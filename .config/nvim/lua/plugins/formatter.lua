return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")

		-- TODO: Conditionally set prettier for repositories with prettier configured, otherwise use biome

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.DEBUG,
			filetype = {
				javascript = {
					require("formatter.filetypes.javascript").prettier,
					function()
						return {
							exe = "prettier",
							args = {
								"--log-level debug",
								"--config-precedence prefer-file",
								--"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								--"--",
								--"-",
							},
							stdin = true,
							try_node_modules = true,
						}
					end,
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettier,
					function()
						return {
							exe = "prettier",
							args = {
								"--log-level debug",
								"--config-precedence prefer-file",
								--"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								--"--",
								--"-",
							},
							stdin = true,
							try_node_modules = true,
						}
					end,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
					function()
						return {
							exe = "prettier",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
							try_node_modules = true,
						}
					end,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
			},
		})
	end,
}
