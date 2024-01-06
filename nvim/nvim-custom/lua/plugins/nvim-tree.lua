return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local default_width = 30

		require("nvim-tree").setup({
			diagnostics = {
				enable = true,
			},
			filters = {
				custom = {
					"^\\.git$",
				},
			},
			view = {
				centralize_selection = true,
				width = default_width,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
		})

		local utils = require("config.utils")

		utils.keymap("n", "<C-n>", "<cmd> NvimTreeToggle <cr>")
		utils.keymap("n", "<leader>e", "<cmd> NvimTreeFocus <cr>")
		utils.keymap("n", "<C-6>", "<cmd> NvimTreeResize " .. default_width .. "<cr>")
		utils.keymap("n", "<C-7>", "<cmd> NvimTreeResize 100<cr>")
		utils.keymap("n", "<C-8>", "<cmd> NvimTreeResize +5<cr>")
		utils.keymap("n", "<C-9>", "<cmd> NvimTreeResize -5<cr>")
	end,
}
