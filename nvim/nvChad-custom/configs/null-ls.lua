local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.deno_fmt.with({ filetypes = { "javascript", "javascriptreact", "json", "jsonc", "markdown", "typescript", "typescriptreact" } }),
	b.formatting.prettier.with({ filetypes = { "html", "css", "scss", "yaml", "handlebars" } }),

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
