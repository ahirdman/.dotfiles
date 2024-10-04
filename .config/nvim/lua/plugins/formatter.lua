return {
	"mhartington/formatter.nvim",
	config = function()
		local formatter = require("formatter")
		local util = require("formatter.util")

		local stylua = require("formatter.filetypes.lua").stylua

		local prettier = function()
			return {
				exe = "prettier",
				args = {
					"--stdin-filepath",
					util.escape_path(util.get_current_buffer_file_path()),
					"--ignore-path=''",
				},
				stdin = true,
				try_node_modules = true,
			}
		end

		local biome = function()
			return {
				exe = "biome",
				args = {
					"format",
					"--stdin-file-path",
					util.escape_path(util.get_current_buffer_file_path()),
				},
				stdin = true,
			}
		end

		local javascript = function()
			if vim.loop.fs_stat("biome.json") == nil then
				return prettier()
			end

			return biome()
		end

		formatter.setup({
			logging = true,
			log_level = vim.log.levels.INFO,
			filetype = {
				javascript = {
					javascript,
				},
				typescriptreact = {
					javascript,
				},
				typescript = {
					javascript,
				},
				lua = {
					stylua,
				},
			},
		})
	end,
}
