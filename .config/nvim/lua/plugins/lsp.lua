return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    { "j-hui/fidget.nvim",       opts = {} },
    { "b0o/schemastore.nvim" },
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lsp_config = require('lspconfig')
    local neodev = require("neodev")
    local servers = require("config.lsp.servers")
    local on_attach = require("config.lsp.on-attach")

    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    neodev.setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    mason_lspconfig.setup_handlers({
      function(server_name)
        lsp_config[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
          init_options = (servers[server_name] or {}).init_options,
        })
      end,
    })

    vim.diagnostic.config({
      title = false,
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        source = true,
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = "",
      },
    })
  end,
}
