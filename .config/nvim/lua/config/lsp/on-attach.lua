local on_attach = function(_, bufnr)
	local wk = require("which-key")
	local icons = require("config.icons")
	local telescope = require("telescope.builtin")
	local conform = require("conform")
  local autocmd = vim.api.nvim_create_autocmd
  local lint = require('lint')

	wk.add({
		{ "<leader>l", group = "LSP", icon = icons.kind.Package },
		{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol", buffer = bufnr },

		{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions", buffer = bufnr },
		{
			"<leader>lf",
			function()
				conform.format({ bufnr, async = true })
			end,
			desc = "Format buffer",
			buffer = bufnr,
			noremap = true,
			silent = false,
		},
        }, { mode = "n", prefix = "" })

	wk.add({
		{ "gd", "<cmd> :Lspsaga peek_definition <cr>", desc = "Peek Definition" },
		{ "gr", telescope.lsp_references, desc = "Find References" },
		{ "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
        }, { mode = "n", prefix = "" })

	autocmd({ "BufWritePost" }, {
		callback = function()
			lint.try_lint()
		end,
	})

	-- autocmd({ "BufWritePre" }, {
	-- 	pattern = "*",
	-- 	callback = function()
	-- 		vim.cmd(":Format")
	-- 	end,
	-- })
end

return on_attach
