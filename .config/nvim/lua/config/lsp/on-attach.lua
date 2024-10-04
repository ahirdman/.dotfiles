local on_attach = function(_, bufnr)
	local wk = require("which-key")
	local icons = require("config.icons")
	local telescope = require("telescope.builtin")

	wk.add({
		{ "<leader>l", group = "LSP", icon = icons.kind.Package },
		{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol", buffer = bufnr },
		{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions", buffer = bufnr },
		{
			"<leader>lf",
			"<CMD> :FormatWrite <CR>",
			desc = "Format buffer",
			buffer = bufnr,
			noremap = true,
			silent = true,
		},
	}, { mode = "n", prexif = "" })

	wk.add({
		{ "gd", "<cmd> :Lspsaga peek_definition <cr>", desc = "Peek Definition" },
		{ "gr", telescope.lsp_references, desc = "Find References" },
		{ "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
	}, { mode = "n", prexif = "" })

	--nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

	-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	--   callback = function()
	--     require("lint").try_lint()
	--   end,
	-- })
end

return on_attach
