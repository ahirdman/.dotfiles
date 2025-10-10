local jsFormatters = { "biome" }

return {
	"stevearc/conform.nvim",
	config = function()
		---@module "conform"
		---@type conform.setupOpts
		require("conform").setup({
			log_level = 2,
			formatters_by_ft = {
				lua = { "stylua" },
        --bicep = { "bicep" },
				json = { "biome" },
				css = jsFormatters,
				javascript = jsFormatters,
				javascriptreact = jsFormatters,
				typescript = jsFormatters,
				typescriptreact = jsFormatters,
			},
			formatters = {
				taplo = {},
				biome = {
					require_cwd = true,
				},
			},
		})
	end,
}
