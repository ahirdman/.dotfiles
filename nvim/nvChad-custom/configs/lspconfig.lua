local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
-- local bicep_lsp_bin = "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll"

local servers = {
	"html",
	"cssls",
	"clangd",
	"jsonls",
	"csharp_ls",
	"yamlls",
	"rust_analyzer",
	"gopls",
	"sourcekit",
	"sqlls",
  "tsserver"
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.quick_lint_js.setup({
 	filetypes = { "javascript", "javascriptreact", "typescript", "typescript.tsx", "typescriptreact" },
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			update_in_insert = true,
		}),
	},
})

-- lspconfig.biome.setup({
-- 	cmd = { "biome", "lsp-proxy" },
--   enable_editorconfig_support = true,
--   enable_import_completion = true,
-- 	filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescript.tsx", "typescriptreact" },
-- })

-- lspconfig.omnisharp.setup({
-- 	cmd = { "dotnet", "/opt/homebrew/bin/omnisharp" },
-- 	enable_editorconfig_support = true,
-- 	enable_ms_build_load_projects_on_demand = false,
-- 	enable_roslyn_analyzers = true,
-- 	organize_imports_on_format = false,
-- 	enable_import_completion = false,
-- 	sdk_include_prereleases = true,
-- 	analyze_open_documents_only = false,
-- })
--
-- lspconfig.bicep.setup({
-- 	cmd = { "dotnet", bicep_lsp_bin },
-- })
