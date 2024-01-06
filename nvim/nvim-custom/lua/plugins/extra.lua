return {
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
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    opts = {}
  },

  -- Ui enhancments for vum.ui methods ( such as lsp rename )
  {
    'stevearc/dressing.nvim',
    opts = {
      border = "rounded"
    },
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
    "SmiteshP/nvim-navic",
    config = function()
      local icons = require("config.icons")
      require("nvim-navic").setup({
        highlight = true,
        lsp = {
          auto_attach = true,
          preference = { "typescript-tools" },
        },
        click = true,
        separator = " " .. icons.ui.ChevronRight .. " ",
        depth_limit = 0,
        depth_limit_indicator = "..",
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      })
    end,
  },

  {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
      { "SmiteshP/nvim-navic" },
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
    }
  }
}
