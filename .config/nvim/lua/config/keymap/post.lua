local wk = require("which-key")
local icons = require("config.icons")
local telescope_builtin = require("telescope.builtin")
local gitsigns = require("gitsigns")
--local copilot = require("copilot.suggestion")

--- Find the first matching script in the current project, or warn when there is none.
local function project_script(candidates, label)
	local runner = require("config.runner")
	local project = runner.project()
	local cmd = runner.script_cmd(project, candidates)
	if not cmd then
		vim.notify("No " .. label .. " script in " .. project.root .. "/package.json", vim.log.levels.WARN)
	end
	return cmd, project
end

wk.add({
	{ "<leader><leader>", telescope_builtin.buffers, desc = "Find Open Buffers" },
	{ "<leader><tab>", "<cmd> Neotree toggle float <CR>", desc = "Float File Explorer" },
	{ "<leader>e", "<cmd> Neotree reveal right<CR>", desc = "Right File Explorer" },
	{ "<c-n>", "<cmd> Neotree toggle right<CR>", desc = "Toggle Explorer" },
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
	{
		"<leader>lF",
		function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
			vim.notify("Format on save " .. (vim.g.disable_autoformat and "off" or "on"))
		end,
		desc = "Toggle Format on Save",
	},
	{
		"<leader>w",
		"<cmd>w<cr>",
		desc = "Write",
		icon = icons.ui.Pencil,
	},

	{ "<leader>g", group = "Git" },
	{
		"<leader>go",
		function()
			local lib = require("diffview.lib")
			local view = lib.get_current_view()
			if view then
				vim.cmd("DiffviewClose")
			else
				vim.cmd("DiffviewOpen")
			end
		end,
		desc = "Toggle Diffview",
	},
	{ "<leader>gd", "<cmd> DiffviewFileHistory % <cr>", desc = "File History (current)" },
	{ "<leader>gH", "<cmd> DiffviewFileHistory <cr>", desc = "File History (repo)" },
	{
		"<leader>gD",
		function()
			require("telescope.builtin").git_branches({
				prompt_title = "Compare Against Branch",
				attach_mappings = function(_, map)
					map("i", "<CR>", function(prompt_bufnr)
						local selection = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
						require("telescope.actions").close(prompt_bufnr)
						if selection then
							local branch = selection.value
							vim.cmd("DiffviewOpen " .. branch)
						end
					end)
					map("n", "<CR>", function(prompt_bufnr)
						local selection = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
						require("telescope.actions").close(prompt_bufnr)
						if selection then
							local branch = selection.value
							vim.cmd("DiffviewOpen " .. branch)
						end
					end)
					return true
				end,
			})
		end,
		desc = "Compare Against Branch",
	},
	{ "<leader>gg", "<cmd> Neogit <cr>", desc = "Open Neogit" },
	{ "<leader>gr", gitsigns.reset_hunk, desc = "Reset hunk" },
	{ "<leader>gs", gitsigns.stage_hunk, desc = "Stage hunk" },
	{
		"<leader>gw",
		"<cmd> :lua require('telescope').extensions.git_worktree.git_worktrees() <cr>",
		desc = "Switch Worktree",
	},
	{
		"<leader>gc",
		"<cmd> :lua require('telescope').extensions.git_worktree.create_git_worktree() <cr>",
		desc = "Create Worktree",
	},

	{ "<leader>s", group = "Search", icon = icons.ui.Telescope },
	{ "<leader>sf", telescope_builtin.find_files, desc = "[S]earch [F]iles" },
	{ "<leader>sd", telescope_builtin.diagnostics, desc = "[S]earch [D]iagnostics" },
	{ "<leader>sg", telescope_builtin.live_grep, desc = "[S]earch by [G]rep" },
	{ "<leader>sh", telescope_builtin.help_tags, desc = "[S]earch [H]elp" },
	{ "<leader>sr", telescope_builtin.resume, desc = "[S]earch [R]esume" },
	{ "<leader>sn", function() Snacks.notifier.show_history() end, desc = "Search Notify History" },
	{
		"<leader>ss",
		telescope_builtin.builtin,
		desc = "[S]earch [S]elect Telescope",
	},
	{
		"<leader>sw",
		telescope_builtin.grep_string,
		desc = "[S]earch current [W]ord",
	},
	{ "<leader>st", "<cmd> TodoTelescope <cr>", desc = "[S]earch [T]odos" },
	{
		"<leader>s?",
		telescope_builtin.oldfiles,
		desc = "[?] Find recently opened files",
	},

	{ "<leader>t", group = "Todo", icon = icons.ui.Check },
	{ "<leader>tl", "<cmd>TodoTelescope<cr>", desc = "List Todos" },

	{ "<leader>x", group = "Diagnostics" },
	{
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle<cr>",
		desc = "Diagnostics (Trouble)",
	},
	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
	},
	{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
	{
		"<leader>xl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{
		"<leader>xL",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location List (Trouble)",
	},
	{
		"<leader>xQ",
		"<cmd>Trouble qflist toggle<cr>",
		desc = "Quickfix List (Trouble)",
	},

	{ "<leader>a", group = "AI" },

	{ "<leader>r", group = "Run", icon = icons.ui.Forward },
	{
		"<leader>rt",
		function()
			local cmd, project = project_script({ "test:ts", "typecheck", "type-check", "check-types", "tsc" }, "typecheck")
			if not cmd then
				return
			end

			require("config.runner").run({
				cmd = cmd,
				cwd = project.root,
				title = "TypeCheck",
				id = "runner_typecheck",
				on_complete = function(output, code)
					if code == 0 then
						vim.fn.setqflist({}, "r", { title = "TypeCheck", items = {} })
						vim.notify("Typecheck passed", vim.log.levels.INFO, {
							id = "runner_typecheck",
							title = "TypeCheck",
							timeout = 3000,
						})
					else
						local efm = "%f(%l\\,%c): error TS%n: %m,%f(%l\\,%c): %trror TS%n: %m,%-G%.%#"
						require("config.runner").set_qflist("TypeCheck", output, efm, project.root)

						local qflist = vim.fn.getqflist()
						local valid = vim.tbl_filter(function(item)
							return item.valid == 1
						end, qflist)

						if #valid > 0 then
							vim.cmd("Trouble qflist open")
							vim.notify(#valid .. " type error(s)", vim.log.levels.ERROR, {
								id = "runner_typecheck",
								title = "TypeCheck",
								timeout = 5000,
							})
						else
							vim.notify("Typecheck failed (could not parse errors)", vim.log.levels.WARN, {
								id = "runner_typecheck",
								title = "TypeCheck",
								timeout = 5000,
							})
						end
					end
				end,
			})
		end,
		desc = "TypeCheck",
	},
	{
		"<leader>rl",
		function()
			local cmd, project = project_script({ "lint:fix", "lint" }, "lint")
			if not cmd then
				return
			end

			require("config.runner").run({
				cmd = cmd,
				cwd = project.root,
				title = "Lint Fix",
				id = "runner_lintfix",
				on_complete = function(output, code)
					-- Reload buffers since lint:fix writes files
					vim.cmd("checktime")

					if code == 0 then
						vim.fn.setqflist({}, "r", { title = "Lint Fix", items = {} })
						vim.notify("Lint fix passed", vim.log.levels.INFO, {
							id = "runner_lintfix",
							title = "Lint Fix",
							timeout = 3000,
						})
					else
						-- Try parsing biome-style diagnostics: path/file.ts:line:col
						-- Also handle biome --reporter=github style if configured
						local efm = table.concat({
							"%f:%l:%c %m", -- biome default: file.ts:10:5 lint/rule
							"%f %#(%l\\,%c): %m", -- fallback tsc-style
							"::error file=%f\\,line=%l\\,col=%c::%m", -- github reporter
							"%-G%.%#", -- ignore everything else
						}, ",")

						require("config.runner").set_qflist("Lint Fix", output, efm, project.root)

						local qflist = vim.fn.getqflist()
						local valid = vim.tbl_filter(function(item)
							return item.valid == 1
						end, qflist)

						if #valid > 0 then
							vim.cmd("Trouble qflist open")
							vim.notify(#valid .. " lint issue(s) remaining", vim.log.levels.WARN, {
								id = "runner_lintfix",
								title = "Lint Fix",
								timeout = 5000,
							})
						else
							vim.notify("Lint fix failed (could not parse errors)", vim.log.levels.WARN, {
								id = "runner_lintfix",
								title = "Lint Fix",
								timeout = 5000,
							})
						end
					end
				end,
			})
		end,
		desc = "Lint Fix",
	},
	{
		"<leader>rr",
		function()
			local cmd, project = project_script({ "test" }, "test")
			if cmd then
				Snacks.terminal.toggle(cmd, { cwd = project.root, win = { position = "bottom", height = 0.3 } })
			end
		end,
		desc = "Test",
	},
	{
		"<leader>rs",
		function()
			local project = require("config.runner").project()

			if vim.tbl_isempty(project.scripts) then
				vim.notify("No scripts found in " .. project.root .. "/package.json", vim.log.levels.WARN)
				return
			end

			local scripts = {}
			for name, cmd in pairs(project.scripts) do
				table.insert(scripts, { name = name, cmd = cmd })
			end

			table.sort(scripts, function(a, b)
				return a.name < b.name
			end)

			vim.ui.select(scripts, {
				prompt = "Run " .. project.manager .. " script",
				format_item = function(item)
					return item.name .. "  ->  " .. item.cmd
				end,
			}, function(choice)
				if choice then
					Snacks.terminal.toggle(
						project.manager .. " run " .. choice.name,
						{ cwd = project.root, win = { position = "bottom", height = 0.3 } }
					)
				end
			end)
		end,
		desc = "Pick Script",
	},
}, { mode = "n", prefix = "" })
