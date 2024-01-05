local M = {}

function M.init()
  local o = vim.o
  local wo = vim.wo

	o.hlsearch = false

	-- Make line numbers default
	wo.number = true

	-- Enable mouse mode
	o.mouse = "a"

	-- Sync clipboard between OS and Neovim.
	--  Remove this option if you want your OS clipboard to remain independent.
	--  See `:help 'clipboard'`
	o.clipboard = "unnamedplus"

	-- Enable break indent
	o.breakindent = true

	-- Save undo history
	o.undofile = true

	-- Case-insensitive searching UNLESS \C or capital in search
	o.ignorecase = true
	o.smartcase = true

	-- Keep signcolumn on by default
	wo.signcolumn = "yes"

	-- Decrease update time
	o.updatetime = 250
	o.timeoutlen = 300

	-- Set completeopt to have a better completion experience
	o.completeopt = "menuone,noselect"

	local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

	vim.api.nvim_create_autocmd("TextYankPost", {
		callback = function()
			vim.highlight.on_yank()
		end,
		group = highlight_group,
		pattern = "*",
	})
end

return M
