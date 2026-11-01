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
		{ "gr", telescope.lsp_references, desc = "Find References", buffer = bufnr },
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
