vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- clear highlight
vim.keymap.set({ "n" }, "<Esc>", ":noh <CR>")

-- switch between windows
vim.keymap.set({ "n" }, "<C-h>", "<C-w>h")                       -- Move left
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l")                       -- Move Right
vim.keymap.set({ "n" }, "<C-l>", "<C-w>j")                       -- Move Down
vim.keymap.set({ "n" }, "<C-l>", "<C-w>k")                       -- Move Up

vim.keymap.set({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft <CR>")  -- Move left
vim.keymap.set({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight <CR>") -- Move Right
vim.keymap.set({ "n" }, "<C-l>", "<cmd> TmuxNavigateDown <CR>")  -- Move Down
vim.keymap.set({ "n" }, "<C-l>", "<cmd> TmuxNavigateUp <CR>")    -- Move Up

vim.keymap.set({ "n" }, "F", "<cmd>:lua vim.diagnostic.open_float() <CR>")

-- save
vim.keymap.set({ "n" }, "<C-s>", "<cmd> w <CR>")

-- move line up/down in visual mode
vim.keymap.set({ "v" }, "J", ":m '>+1<CR>gv=gv")
vim.keymap.set({ "v" }, "K", ":m '<-2<CR>gv=gv")


-- navigate within insert mode
vim.keymap.set({ "i" }, "<C-h>", "<Left>")

vim.keymap.set({ "i" }, "<C-l>", "<Right>")
vim.keymap.set({ "i" }, "<C-j>", "<Down>")
vim.keymap.set({ "i" }, "<C-k>", "<Up>")
