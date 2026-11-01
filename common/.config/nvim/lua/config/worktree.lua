local M = {}

---@param args string[]
---@param cwd? string
---@return string? output
---@return string? error
local function git(args, cwd)
	local result = vim.system(vim.list_extend({ "git" }, args), { text = true, cwd = cwd }):wait()
	if result.code ~= 0 then
		return nil, vim.trim(result.stderr or "")
	end
	return vim.trim(result.stdout or "")
end

local function notify_error(message)
	vim.notify(message, vim.log.levels.ERROR, { title = "Worktree" })
end

---@return { path: string, branch: string }[]
local function list()
	local output, err = git({ "worktree", "list", "--porcelain" })
	if not output then
		notify_error(err or "Not a git repository")
		return {}
	end

	local worktrees = {}
	for _, line in ipairs(vim.split(output, "\n")) do
		local path = line:match("^worktree (.+)$")
		if path then
			table.insert(worktrees, { path = path, branch = "(detached)" })
		end

		local current = worktrees[#worktrees]
		local branch = line:match("^branch refs/heads/(.+)$")
		if current and branch then
			current.branch = branch
		elseif current and line == "bare" then
			current.bare = true
		end
	end

	return vim.tbl_filter(function(worktree)
		return not worktree.bare
	end, worktrees)
end

--- Change to a worktree, staying on the current file when it exists there.
---@param path string
local function open(path)
	local file = vim.api.nvim_buf_get_name(0)
	local root = git({ "rev-parse", "--show-toplevel" })
	local relative = file ~= "" and root and vim.fs.relpath(root, file) or nil

	vim.cmd.cd(vim.fn.fnameescape(path))

	local target = relative and vim.fs.joinpath(path, relative)
	if target and vim.uv.fs_stat(target) then
		vim.cmd.edit(vim.fn.fnameescape(target))
	end
	vim.notify("Switched to " .. path, vim.log.levels.INFO, { title = "Worktree" })
end

function M.switch()
	local worktrees = list()
	if #worktrees == 0 then
		return
	end

	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Git Worktrees",
			finder = require("telescope.finders").new_table({
				results = worktrees,
				entry_maker = function(worktree)
					local display = string.format("%s\t%s", worktree.branch, vim.fn.fnamemodify(worktree.path, ":~"))
					return { value = worktree, display = display, ordinal = worktree.branch .. " " .. worktree.path }
				end,
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					if selection then
						open(selection.value.path)
					end
				end)
				return true
			end,
		})
		:find()
end

function M.create()
	local worktrees = list()
	if #worktrees == 0 then
		return
	end

	vim.ui.input({ prompt = "Worktree branch" }, function(branch)
		if not branch or vim.trim(branch) == "" then
			return
		end
		branch = vim.trim(branch)

		-- The first entry is always the main worktree, so new ones sit beside it.
		local main = worktrees[1].path
		local name = vim.fs.basename(main) .. "-" .. branch:gsub("[/%s]", "-")
		local path = vim.fs.joinpath(vim.fs.dirname(main), name)

		local args = { "worktree", "add", path }
		if not git({ "show-ref", "--verify", "--quiet", "refs/heads/" .. branch }, main) then
			args = { "worktree", "add", "-b", branch, path }
		else
			table.insert(args, branch)
		end

		local _, err = git(args, main)
		if err then
			notify_error(err)
			return
		end
		open(path)
	end)
end

return M
