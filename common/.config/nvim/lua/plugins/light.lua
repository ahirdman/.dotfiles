-- Servers set DOTFILES_LIGHT to skip workstation-only plugins.
if not vim.env.DOTFILES_LIGHT then
	return {}
end

return vim.tbl_map(function(name)
	return { name, enabled = false }
end, {
	"zbirenbaum/copilot.lua",
	"nvim-neotest/neotest",
	"marilari88/neotest-vitest",
	"folke/persistence.nvim",
})
