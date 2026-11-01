local on_attach = function(client, bufnr)
	local wk = require("which-key")
	local icons = require("config.icons")
	local telescope = require("telescope.builtin")
	local conform = require("conform")
	local lint = require("lint")

	wk.add({
		{ "<leader>l", group = "LSP", icon = icons.kind.Package },
		{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol", buffer = bufnr },

		{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions", buffer = bufnr },
		{ "<leader>ls", telescope.lsp_document_symbols, desc = "Document Symbols", buffer = bufnr },
		{ "<leader>lS", telescope.lsp_dynamic_workspace_symbols, desc = "Workspace Symbols", buffer = bufnr },
		{
			"<leader>li",
			function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
			end,
			desc = "Toggle Inlay Hints",
			buffer = bufnr,
		},
		{
			"<leader>lf",
			function()
				conform.format({ bufnr = bufnr, async = true, lsp_format = "fallback" })
			end,
			desc = "Format buffer",
			buffer = bufnr,
			noremap = true,
			silent = false,
		},
	}, { mode = "n", prefix = "" })

	wk.add({
		{ "gd", vim.lsp.buf.definition, desc = "Go To Definition", buffer = bufnr },
		{ "gD", vim.lsp.buf.declaration, desc = "Go To Declaration", buffer = bufnr },
		-- Extend Neovim's gr* defaults (grn rename, gra code action) rather than shadow them with gr.
		{ "grr", telescope.lsp_references, desc = "Find References", buffer = bufnr },
		{ "gri", telescope.lsp_implementations, desc = "Go To Implementation", buffer = bufnr },
		{ "grt", telescope.lsp_type_definitions, desc = "Go To Type Definition", buffer = bufnr },
		{ "K", vim.lsp.buf.hover, desc = "Hover Documentation", buffer = bufnr },
	}, { mode = "n", prefix = "" })

	-- Runs once per attached client; keep a single lint autocmd per buffer.
	local lint_group = vim.api.nvim_create_augroup("user.lsp.lint", { clear = false })
	vim.api.nvim_clear_autocmds({ group = lint_group, buffer = bufnr })
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		group = lint_group,
		buffer = bufnr,
		callback = function()
			local file_path = vim.fn.expand("%:p")

			if string.match(file_path, "%.github/") then
				lint.try_lint("actionlint")
			end
		end,
	})
end

return on_attach
