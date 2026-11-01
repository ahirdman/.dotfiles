local M = {}

M.keymap = function(mode, key, func, desc)
	vim.keymap.set(mode, key, func, { noremap = true, silent = true, desc = desc })
end

-- M.current_buffer_keymap = function(mode, key, result)
-- 	vim.keymap.set(mode, key, result, { buffer = true, noremap = true, silent = true })
-- end

M.buffer_keymap = function(bufnr, mode, key, result, desc)
	vim.keymap.set(mode, key, result, { buffer = bufnr, noremap = true, silent = true, desc = desc })
end

return M
