local wk = require("which-key")
local icons = require("config.icons")
local telescope_builtin = require("telescope.builtin")
local gitsigns = require("gitsigns")
--local copilot = require("copilot.suggestion")

wk.add({
	{ "<leader><leader>", telescope_builtin.buffers, desc = "Find Open Buffers" },
	{ "<leader><tab>", "<cmd> Neotree toggle float <CR>", desc = "Float File Explorer" },
	{ "<leader>e", "<cmd> Neotree reveal right<CR>", desc = "Right File Explorer" },
	{ "<c-n>", "<cmd> Neotree toggle right<CR>", desc = "Toggle Explorer" },
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
	{
		"<leader>w",
		"<cmd>w<cr>",
		desc = "Write",
		icon = icons.ui.Pencil,
	},

	{ "<leader>g", group = "Git" },
	{ "<leader>gd", "<cmd> DiffviewFileHistory <cr>", desc = "View diffs per commit" },
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
	{ "<leader>sn", "<cmd> :Telescope notify <cr>", desc = "Search Notify History" },
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

	{ "<leader>cs", "", hidden = true },

	{ "<leader>a", group = "AI" },

	{ "<leader>r", group = "Run", icon = icons.ui.Forward },
	{
		"<leader>rt",
		function()
			require("config.runner").run({
				cmd = "pnpm run test:ts",
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
						vim.fn.setqflist({}, "r", { title = "TypeCheck", lines = output, efm = efm })

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
			require("config.runner").run({
				cmd = "pnpm run lint:fix",
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

						vim.fn.setqflist({}, "r", { title = "Lint Fix", lines = output, efm = efm })

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
			Snacks.terminal.toggle("pnpm run test", { win = { position = "bottom", height = 0.3 } })
		end,
		desc = "Test",
	},
	{
		"<leader>rs",
		function()
			local cwd = vim.fn.getcwd()
			local pkg_path = cwd .. "/package.json"

			if vim.fn.filereadable(pkg_path) == 0 then
				vim.notify("No package.json found in " .. cwd, vim.log.levels.WARN)
				return
			end

			local content = vim.fn.readfile(pkg_path)
			local ok, pkg = pcall(vim.fn.json_decode, table.concat(content, "\n"))

			if not ok or not pkg.scripts then
				vim.notify("No scripts found in package.json", vim.log.levels.WARN)
				return
			end

			local scripts = {}
			for name, cmd in pairs(pkg.scripts) do
				table.insert(scripts, { name = name, cmd = cmd })
			end

			table.sort(scripts, function(a, b)
				return a.name < b.name
			end)

			vim.ui.select(scripts, {
				prompt = "Run pnpm script",
				format_item = function(item)
					return item.name .. "  ->  " .. item.cmd
				end,
			}, function(choice)
				if choice then
					Snacks.terminal.toggle(
						"pnpm run " .. choice.name,
						{ win = { position = "bottom", height = 0.3 } }
					)
				end
			end)
		end,
		desc = "Pick Script",
	},
}, { mode = "n", prefix = "" })
