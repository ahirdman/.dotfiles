return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        stop_eof = true,
        easing = "linear",
        hide_cursor = true,
        cursor_scrolls_alone = true,
        performance_mode = false
      })
    end,
  },

  {
    'ghassan0/telescope-glyph.nvim',
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },

  { 'echasnovski/mini.pairs', version = '*', opts = {} },

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
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      local colorizer = require("colorizer")
      colorizer.setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true,           -- #RGB hex codes
          RRGGBB = true,        -- #RRGGBB hex codes
          names = false,        -- "Name" codes like Blue or blue
          RRGGBBAA = false,     -- #RRGGBBAA hex codes
          AARRGGBB = false,     -- 0xAARRGGBB hex codes
          rgb_fn = false,       -- CSS rgb() and rgba() functions
          hsl_fn = false,       -- CSS hsl() and hsla() functions
          css = false,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
          mode = 'virtualtext', -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = true,                                 -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
          virtualtext = "",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      })

      vim.defer_fn(function()
        colorizer.attach_to_buffer(0)
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
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  { -- Temp until telescope builtin go to defenition works again
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        symbol_in_winbar = {
          enable = false
        },
        lightbulb = { enable = false },
        definition = {
          width = 0.9,
          height = 0.6
        }
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },

  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        yaml = { 'actionlint' }
      }
    end
  }
}
