local M = {}

local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local TAIL_LINES = 12

--- @class RunnerOpts
--- @field cmd string
--- @field title string
--- @field id string
--- @field cwd? string
--- @field on_complete fun(output: string[], code: integer)

--- Run a command asynchronously with streaming notification output.
--- @param opts RunnerOpts
function M.run(opts)
	local output = {}
	local spinner_idx = 1
	local cwd = opts.cwd or vim.fn.getcwd()

	-- Show initial notification
	vim.notify("Starting...", vim.log.levels.INFO, {
		id = opts.id,
		title = opts.title,
		icon = spinner_frames[1],
		timeout = false,
	})

	--- Build the notification message from the tail of accumulated output
	local function build_msg()
		if #output == 0 then
			return "Running..."
		end

		local start = math.max(1, #output - TAIL_LINES + 1)
		local lines = {}
		for i = start, #output do
			table.insert(lines, output[i])
		end

		local msg = table.concat(lines, "\n")

		if #output > TAIL_LINES then
			msg = "... (" .. (#output - TAIL_LINES) .. " more lines)\n" .. msg
		end

		return msg
	end

	--- Update the notification in-place
	local function update_notification()
		vim.notify(build_msg(), vim.log.levels.INFO, {
			id = opts.id,
			title = opts.title,
			icon = spinner_frames[spinner_idx],
			timeout = false,
		})
	end

	-- Job chunks can end mid-line; hold the unfinished tail per stream.
	local partial = { stdout = "", stderr = "" }

	--- Process data chunks from stdout/stderr
	local function on_data(_, data, stream)
		if not data then
			return
		end

		local dirty = false
		data[1] = partial[stream] .. data[1]
		partial[stream] = table.remove(data)
		for _, line in ipairs(data) do
			if line ~= "" then
				table.insert(output, line)
				dirty = true
			end
		end

		if dirty then
			vim.schedule(update_notification)
		end
	end

	-- Spinner timer: rotate icon every 80ms
	local timer = vim.uv.new_timer()
	timer:start(
		80,
		80,
		vim.schedule_wrap(function()
			spinner_idx = (spinner_idx % #spinner_frames) + 1
			update_notification()
		end)
	)

	local job = vim.fn.jobstart(opts.cmd, {
		cwd = cwd,
		on_stdout = on_data,
		on_stderr = on_data,
		on_exit = function(_, code)
			-- Stop spinner
			timer:stop()
			timer:close()

			for _, stream in ipairs({ "stdout", "stderr" }) do
				if partial[stream] ~= "" then
					table.insert(output, partial[stream])
				end
			end

			vim.schedule(function()
				opts.on_complete(output, code)
			end)
		end,
	})

	if job <= 0 then
		timer:stop()
		timer:close()
		vim.notify("Could not start: " .. opts.cmd, vim.log.levels.ERROR, {
			id = opts.id,
			title = opts.title,
			timeout = 5000,
		})
	end
end

local lockfiles = {
	{ "pnpm-lock.yaml", "pnpm" },
	{ "bun.lock", "bun" },
	{ "bun.lockb", "bun" },
	{ "yarn.lock", "yarn" },
	{ "package-lock.json", "npm" },
}

--- @class RunnerProject
--- @field root string
--- @field manager string
--- @field scripts table<string, string>

--- Resolve the JS project for the current buffer: workspace root, package manager and scripts.
--- @return RunnerProject
function M.project()
	local markers = vim.tbl_map(function(entry)
		return entry[1]
	end, lockfiles)
	local root = vim.fs.root(0, markers) or vim.fs.root(0, "package.json") or vim.fn.getcwd()

	local manager = "npm"
	for _, entry in ipairs(lockfiles) do
		if vim.uv.fs_stat(vim.fs.joinpath(root, entry[1])) then
			manager = entry[2]
			break
		end
	end

	local scripts = {}
	local pkg_path = vim.fs.joinpath(root, "package.json")
	if vim.fn.filereadable(pkg_path) == 1 then
		local ok, pkg = pcall(vim.json.decode, table.concat(vim.fn.readfile(pkg_path), "\n"))
		if ok and type(pkg) == "table" and type(pkg.scripts) == "table" then
			scripts = pkg.scripts
		end
	end

	return { root = root, manager = manager, scripts = scripts }
end

--- Command for the first of `candidates` the project defines.
--- @param project RunnerProject
--- @param candidates string[]
--- @return string?
function M.script_cmd(project, candidates)
	for _, name in ipairs(candidates) do
		if project.scripts[name] then
			return project.manager .. " run " .. name
		end
	end
end

--- Fill the quickfix list, resolving tool output paths against the directory it ran in.
--- @param title string
--- @param output string[]
--- @param efm string
--- @param cwd string
function M.set_qflist(title, output, efm, cwd)
	local previous = vim.fn.getcwd()
	vim.fn.chdir(cwd)
	vim.fn.setqflist({}, "r", { title = title, lines = output, efm = efm })
	vim.fn.chdir(previous)
end

return M
