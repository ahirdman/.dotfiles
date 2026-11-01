local oxfmt_markers = { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts", "oxfmt.config.mts" }

local function usesOxfmt(bufnr)
  return vim.fs.root(vim.api.nvim_buf_get_name(bufnr), oxfmt_markers) ~= nil
end

local function jsFormatters(bufnr)
  return usesOxfmt(bufnr) and { "oxfmt" } or { "biome" }
end

local function oxfmtOnly(bufnr)
  return usesOxfmt(bufnr) and { "oxfmt" } or {}
end

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
				json = jsFormatters,
        jsonc = jsFormatters,
				yaml = oxfmtOnly,
				markdown = oxfmtOnly,
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
        oxfmt = {
          require_cwd = true,
          cwd = require("conform.util").root_file(oxfmt_markers),
        },
			},
		})
	end,
}
