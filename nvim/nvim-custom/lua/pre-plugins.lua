local M = {}

function M.init()
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	vim.opt.termguicolors = true
end

return M
