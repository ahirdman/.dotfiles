vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- navigate within insert mode
vim.keymap.set({ "i" }, "<C-h>", "<Left>")

-- clear highlight
vim.keymap.set({ "n" }, "<Esc>", ":noh <CR>")

vim.keymap.set({ "i" }, "<C-l>", "<Right>")
vim.keymap.set({ "i" }, "<C-j>", "<Down>")
vim.keymap.set({ "i" }, "<C-k>", "<Up>")

-- switch between windows
vim.keymap.set({ "n" }, "<C-h>", "<C-w>h") -- Move left
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l") -- Move Right
vim.keymap.set({ "n" }, "<C-l>", "<C-w>j") -- Move Down
vim.keymap.set({ "n" }, "<C-l>", "<C-w>k") -- Move Up

vim.keymap.set({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft <CR>") -- Move left
vim.keymap.set({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight <CR>") -- Move Right
vim.keymap.set({ "n" }, "<C-l>", "<cmd> TmuxNavigateDown <CR>") -- Move Down
vim.keymap.set({ "n" }, "<C-l>", "<cmd> TmuxNavigateUp <CR>") -- Move Up

-- save
vim.keymap.set({ "n" }, "<C-s>", "<cmd> w <CR>")

-- format
vim.keymap.set({ "n" }, "<Space>fm", function()
	vim.lsp.buf.format({ async = true })
end)

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
