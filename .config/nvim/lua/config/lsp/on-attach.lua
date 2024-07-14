local on_attach = function(_, bufnr)
  local utils = require("config.utils")

  utils.buffer_keymap(bufnr, "n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  utils.buffer_keymap(bufnr, "n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  --nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
  utils.buffer_keymap(bufnr, "n", "gd", "<cmd> :Lspsaga peek_definition <cr>", "[G]oto [D]efinition") -- temp replacement
  utils.buffer_keymap(bufnr, "n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  utils.buffer_keymap(bufnr, "n", "gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  utils.buffer_keymap(bufnr, "n", "<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
  utils.buffer_keymap(bufnr, "n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  utils.buffer_keymap(bufnr, "n", "K", vim.lsp.buf.hover, "Hover Documentation")
  utils.buffer_keymap(bufnr, "n", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  utils.buffer_keymap(bufnr, "n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  utils.buffer_keymap(bufnr, "n", "<leader>fm", "<cmd> Format <cr>", "Format buffer")

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

return on_attach
