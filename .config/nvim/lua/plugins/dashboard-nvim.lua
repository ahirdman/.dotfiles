return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "hyper",
		config = {
			disable_move = true,
			week_header = {
				enable = true,
			},
			shortcut = {
				{
					icon = " ",
					icon_hl = "DashboardYellow",
					group = "Text",
					desc = "Lazy",
					action = "Lazy",
					key = "l",
				},
				{
					icon = " ",
					icon_hl = "DashboardOrange",
					group = "Text",
					desc = "Mason",
					action = "Mason",
					key = "m",
				},
				{
					icon = " ",
					icon_hl = "DashboardGit",
					group = "Text",
					desc = "Neogit",
					action = ":Neogit ",
					key = "g",
				},
				{
					icon = " ",
					icon_hl = "DashboardGreen",
					group = "Text",
					desc = "Files",
					action = "Telescope find_files",
					key = "f",
				},
				{
					icon = " ",
					icon_hl = "DashboardGit",
					group = "Text",
					desc = "Worktree",
					action = ":lua require('telescope').extensions.git_worktree.git_worktrees()",
					key = "w",
				},
			},
			packages = { enable = true },
			footer = {},
			mru = { limit = 5, icon = " ", label = "Recent files", cwd_only = true },
			project = {
				enable = false,
			},
		},
	},
}
