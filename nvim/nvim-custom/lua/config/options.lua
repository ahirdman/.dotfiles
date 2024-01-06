vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make line numbers default
vim.wo.number = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

local options = {
	breakindent = false,
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	confirm = true, -- confirm to save changes before exiting modified buffer
	cursorline = false, -- highlight the current line
  expandtab = true,
	hlsearch = true,
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	relativenumber = true, -- set relative numbered lines
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	smartcase = true, -- smart case
  smartindent = true,
  softtabstop = 2,
  tabstop = 2, -- insert 2 spaces for a tab
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 100, -- faster completion (4000ms default)
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

