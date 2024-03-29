return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    local icons = require("config.icons")

    require("lualine").setup({
      options = {
        theme = "catppuccin",
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
        lualine_a = {},
        lualine_b = {
          "fancy_branch",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 2 for full path
            symbols = {
              modified = "  ",
              readonly = "  ",
              unnamed = "  ",
            },
          },
          {
            "fancy_diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " ", info = icons.diagnostics.Information .. " " },
          },
          { "fancy_searchcount" },
        },
        lualine_x = {
          "fancy_lsp_servers",
          "fancy_diff",
          "progress",
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        -- lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      -- extensions = { "neo-tree", "lazy" },
    })
  end,
}
