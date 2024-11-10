local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local highlight_group = augroup("YankHighlight", { clear = true })

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		if vim.w.auto_cursorline then
			vim.wo.cursorline = true
			vim.w.auto_cursorline = nil
		end
	end,
})

autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		if vim.wo.cursorline then
			vim.w.auto_cursorline = true
			vim.wo.cursorline = false
		end
	end,
})
