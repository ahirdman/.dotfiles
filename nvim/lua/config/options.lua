vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make line numbers default
vim.wo.number = true

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local options = {
  breakindent = false,
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  confirm = true,                          -- confirm to save changes before exiting modified buffer
  cursorline = false,                      -- highlight the current line
  expandtab = true,
  hlsearch = true,
  ignorecase = true,     -- ignore case in search patterns
  mouse = "a",           -- allow the mouse to be used in neovim
  pumheight = 10,        -- pop up menu height
  relativenumber = true, -- set relative numbered lines
  shiftwidth = 2,        -- the number of spaces inserted for each indentation
  showmode = false,      -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,       -- always show tabs
  smartcase = true,      -- smart case
  smartindent = true,
  softtabstop = 2,
  tabstop = 2,          -- insert 2 spaces for a tab
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000,    -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,      -- enable persistent undo
  updatetime = 100,     -- faster completion (4000ms default)
  showcmd = false,      -- Don't show the command in the last line
  ruler = false,        -- Don't show the ruler
  scrolloff = 8,        -- Makes sure there are always eight lines of context
  sidescrolloff = 8,    -- Makes sure there are always eight lines of context
  numberwidth = 4,      -- set number column width to 2 {default 4}
  signcolumn = "yes",   -- always show the sign column, otherwise it would shift the text each time
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local icons = require("config.icons")

local signs = {
  Error = icons.diagnostics.BoldError,
  Warn = icons.diagnostics.BoldWarning,
  Hint = icons.diagnostics.BoldHint,
  Info = icons.diagnostics.BoldInformation,
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
