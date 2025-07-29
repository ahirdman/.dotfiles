vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "moonlander"

require("config.themes.moonlander").load()
