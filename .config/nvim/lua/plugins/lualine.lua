return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    local icons = require("config.icons")
    local lualine = require('lualine')

    -- NOTE: These should be extracted from current theme instead
    local colors = {
      white        = '#ebdbb2',
      red          = '#fb4934',
      pink         = '#d3869b',
      green        = '#a9b665',
      blue         = '#83a598',
      yellow       = '#d8a657',
      peach        = "#e78a4e",
      gray         = '#a89984',
      darkgray     = '#3c3836',
      lightgray    = '#504945',
      inactivegray = '#7c6f64',
      base         = "#000000",
    }

    local customTheme = {
      normal = {
        a = { bg = colors.blue, fg = colors.base, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.base, fg = colors.gray }
      },
      insert = {
        a = { bg = colors.yellow, fg = colors.base, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.base, fg = colors.white }
      },
      visual = {
        a = { bg = colors.pink, fg = colors.base, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.base, fg = colors.base }
      },
      replace = {
        a = { bg = colors.red, fg = colors.base, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.base, fg = colors.white }
      },
      command = {
        a = { bg = colors.green, fg = colors.base, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.base, fg = colors.base }
      },
      inactive = {
        a = { bg = colors.base, fg = colors.base },
        b = { bg = colors.base, fg = colors.base },
        c = { bg = colors.base, fg = colors.base },
        x = { bg = colors.base, fg = colors.base },
        z = { bg = colors.base, fg = colors.base },
        y = { bg = colors.base, fg = colors.base }
      }
    }

    lualine.setup({
      options = {
        theme = customTheme,
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = icons.ui.DividerRight, right = icons.ui.DividerLeft },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "dashboard-nvim",
            "help",
            "neo-tree",
            "Trouble",
            "toggleterm",
            "TelescopePrompt"
          },
          winbar = {},
        },
      },
      sections = {
        lualine_a = {
          { 'mode' }
        },
        lualine_b = {
          {
            "filename",
            path = 0,
            symbols = {
              modified = "  ",
              readonly = "  ",
              unnamed = "  ",
            },
            color = { fg = colors.white, bg = '' }
          },
          {
            "diff",
            color = { bg = '' },
          },
          {
            "fancy_searchcount",
            color = { fg = colors.peach, bg = '' }
          },
        },
        lualine_c = {
          {
            "fancy_diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " ", info = icons.diagnostics.Information .. " " },
          },

        },
        lualine_x = {
          {
            "branch",
            color = { fg = colors.peach, bg = '' },
            icon = icons.git.Branch
          },

          "fancy_lsp_servers",
          {

            "progress",
            color = { bg = '' }
          }
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      --extensions = { "neo-tree", "lazy", "trouble" },
    })
  end,
}
