local wk = require("which-key")
local icons = require("config.icons")
local telescope_builtin = require("telescope.builtin")
local gitsigns = require("gitsigns")
--local copilot = require("copilot.suggestion")

wk.add({
	{ "<leader>o", "<cmd> Oil <CR>", desc = "Open Oil" },
	{ "<leader>p", "<cmd> Oil --float <CR>", desc = "Open Oil float" },

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
	{
		"<leader>gd",
		"<cmd> DiffviewOpen origin/main...HEAD <cr>",
		desc = "View diff against main",
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
	--{ "<leader>aX", copilot.toggle_auto_trigger(), desc = "Toggle Auto Trigger" },
}, { mode = "n", prexif = "" })
