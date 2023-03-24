return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' }, -- Optional
    { 'hrsh7th/cmp-path' }, -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' }, -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' }, -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    local lsp = require 'lsp-zero'

    lsp.preset {
      name = 'recommended',
    }

    lsp.ensure_installed {
      'tsserver',
    }

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      local map = function(mode, input, cmd, options)
        vim.keymap.set(mode, input, cmd, options)
      end

      map('n', 'gd', function()
        vim.lsp.buf.definition()
      end, opts)
      map('n', 'K', function()
        vim.lsp.buf.hover()
      end, opts)
      map('n', '<leader>vd', function()
        vim.diagnostic.open_float()
      end, opts)
      map('n', '<leader>vca', function()
        vim.lsp.buf.code_action()
      end, opts)
    end)

    lsp.setup_nvim_cmp {
      documentation = {
        max_height = 15,
        max_width = 60,
        border = 'rounded',
        col_offset = 0,
        side_padding = 1,
        winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
        zindex = 1001,
      },
    }

    local cmp = require 'cmp'
    local cmp_config = lsp.defaults.cmp_config {
      window = {
        completion = cmp.config.window.bordered(),
      },
    }

    lsp.setup()

    cmp.setup(cmp_config)

    vim.diagnostic.config {
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }
  end,
}
