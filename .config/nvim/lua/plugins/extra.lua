return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        stop_eof = true,
        easing_function = "sine",
        hide_cursor = true,
        cursor_scrolls_alone = true,
      })
    end,
  },

  {
    'ghassan0/telescope-glyph.nvim',
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  { 'echasnovski/mini.pairs', version = '*', opts = {} },

  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    enabled = false
  },

  {
    "numToStr/Comment.nvim",
    opts = {}
  },

  -- Ui enhancments for vum.ui methods ( such as lsp rename )
  {
    'stevearc/dressing.nvim',
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      border = "rounded"
    },
    config = function()
      require("dressing").setup()
    end,
  },

  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    enabled = false,
    config = function()
      require("fidget").setup({
        window = { blend = 0 },
      })
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function(_, opts)
      require("colorizer").setup(opts)
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "folke/neoconf.nvim",
    config = function()
      require("neoconf").setup({
        -- name of the local settings files
        local_settings = ".neoconf.json",
        -- name of the global settings file in your Neovim config directory
        global_settings = "neoconf.json",
        -- import existing settings from other plugins
        import = {
          vscode = true, -- local .vscode/settings.json
          coc = true,    -- global/local coc-settings.json
          nlsp = true,   -- global/local nlsp-settings.nvim json settings
        },
        -- send new configuration to lsp clients when changing json settings
        live_reload = true,
        -- set the filetype to jsonc for settings files, so you can use comments
        -- make sure you have the jsonc treesitter parser installed!
        filetype_jsonc = true,
        plugins = {
          -- configures lsp clients with settings in the following order:
          -- - lua settings passed in lspconfig setup
          -- - global json settings
          -- - local json settings
          lspconfig = {
            enabled = true,
          },
          -- configures jsonls to get completion in .nvim.settings.json files
          jsonls = {
            enabled = true,
            -- only show completion in json settings for configured lsp servers
            configured_servers_only = true,
          },
          -- configures lua_ls to get completion of lspconfig server settings
          lua_ls = {
            -- by default, lua_ls annotations are only enabled in your neovim config directory
            enabled_for_neovim_config = true,
            -- explicitely enable adding annotations. Mostly relevant to put in your local .nvim.settings.json file
            enabled = false,
          },
        },
      })
    end
  }
}
