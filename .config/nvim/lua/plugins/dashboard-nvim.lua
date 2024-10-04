return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			preview = {},
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰊳 Lazy", group = "@property", action = "Lazy", key = "l" },
					{ desc = " Mason", group = "Config", action = "Mason", key = "m" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
				},
				packages = { enable = true },
				project = {
					enable = false,
					limit = 4,
					icon = "your icon",
					label = "",
					action = "Telescope find_files cwd=",
				},
			},
		})
	end,
}
