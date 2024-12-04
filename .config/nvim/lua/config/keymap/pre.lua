local utils = require("config.utils")

utils.keymap({ "n", "v" }, "<Space>", "<Nop>")

-- clear highlight
utils.keymap({ "n" }, "<Esc>", ":noh <CR>")

-- switch between windows
utils.keymap({ "n" }, "<C-h>", "<C-w>h") -- Move left
utils.keymap({ "n" }, "<C-l>", "<C-w>l") -- Move Right
utils.keymap({ "n" }, "<C-l>", "<C-w>j") -- Move Down
utils.keymap({ "n" }, "<C-l>", "<C-w>k") -- Move Up

utils.keymap({ "n" }, "L", "<cmd>:lua vim.diagnostic.open_float() <CR>")

-- save
utils.keymap({ "n" }, "<C-s>", "<cmd> w <CR>")

-- move line up/down in visual mode
utils.keymap({ "v" }, "J", ":m '>+1<CR>gv=gv")
utils.keymap({ "v" }, "K", ":m '<-2<CR>gv=gv")

-- navigate within insert mode
utils.keymap({ "i" }, "<C-h>", "<Left>")
utils.keymap({ "i" }, "<C-l>", "<Right>")
utils.keymap({ "i" }, "<C-j>", "<Down>")
utils.keymap({ "i" }, "<C-k>", "<Up>")
utils.keymap({ "i" }, "<C-k>", "<Up>")

utils.keymap({ "i" }, "jj", "<Esc>")
