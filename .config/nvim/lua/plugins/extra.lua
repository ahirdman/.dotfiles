return {
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

  { "echasnovski/mini.pairs", version = "*", opts = {} },

  {
    "stevearc/dressing.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    opts = {
      border = "rounded",
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
    "catgoose/nvim-colorizer.lua",
    config = function()
      local colorizer = require("colorizer")
      colorizer.setup({
        filetypes = { "*", "!lazy" },
        options = {
          parsers = {
            names = { enable = false },
            hex = {
              enable = true,
              rgb = true,       -- #RGB
              rgba = true,      -- #RGBA
              rrggbb = true,    -- #RRGGBB
              rrggbbaa = false, -- #RRGGBBAA
              aarrggbb = false, -- 0xAARRGGBB
            },
            rgb = { enable = false },
            hsl = { enable = false },
            css = false,
            css_fn = false,
            tailwind = { enable = true, lsp = true },
            sass = { enable = false, parsers = { css = true } },
          },
          display = {
            mode = "virtualtext",
            virtualtext = {
              char = "■",
            },
          },
          always_update = true,
        },
        buftypes = {},
      })

      vim.defer_fn(function()
        colorizer.attach_to_buffer(0)
      end, 0)
    end,
  },

  {
    "mfussenegger/nvim-lint",
  },

  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end,
        { desc = "Ask opencode" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
        { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
        { expr = true, desc = "Add range to opencode" })
      vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
        { expr = true, desc = "Add line to opencode" })

      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
        { desc = "opencode half page up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
        { desc = "opencode half page down" })

      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
    end,
  }
}
