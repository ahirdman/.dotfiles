local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.deno_fmt.with({ filetypes = { "javascript", "javascriptreact", "json", "jsonc", "markdown", "typescript", "typescriptreact" } }),
	-- b.formatting.prettier.with({ filetypes = { "html", "css", "scss", "yaml", "handlebars" } }),

	-- b.formatting.prettier.with({
	--   filetypes = { "html", "css", "scss", "yaml", "handlebars", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	--   extra_args = { "--config-precedence", "prefer-file" }, -- Ensure local config is used if present
	-- }),

	-- ESLint for JavaScript and TypeScript
	-- b.diagnostics.eslint.with({
	--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	--   prefer_local = "node_modules/.bin",
	-- }),

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	-- mobile dev
	-- b.formatting.swiftlint,
	-- b.formatting.swiftformat
}

null_ls.setup({
	debug = true,
	sources = sources,
})
