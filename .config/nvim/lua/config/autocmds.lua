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

-- TODO: Hide cursor on dashboard

-- autocmd({ "FileType" }, {
-- 	callback = function()
-- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
--
-- 		if buf_ft == "dashboard" then
-- 			--print("Match")
-- 			--vim.wo.concealcursor()
-- 			--vim.cmd("hi Cursor guifg=bg guibg=bg")
-- 			--vim.api.nvim_set_option("guicursor", "")
-- 			--vim.opt.guicursor = "a:Cursor/lCursor" -- Make the cursor invisible or change the style
-- 		else
-- 			-- Re-enable the cursor for other buffers
-- 			vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
-- 		end
-- 	end,
-- })
