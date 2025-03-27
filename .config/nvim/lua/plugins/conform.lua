local jsFormatters = { "biome", "prettier", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	config = function()
		---@module "conform"
		---@type conform.setupOpts
		require("conform").setup({
			log_level = 2,
			formatters_by_ft = {
				lua = { "stylua" },
				bicep = { "bicep" },
				json = { "biome" },
				nix = { "alejandra" },
				--python = { "ruff" },
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
				prettier = {
					require_cwd = true,
				},
			},
			-- format_on_save = {
			-- 	timeout_ms = 500,
			-- 	lsp_format = "fallback",
			-- },
		})
	end,
}
