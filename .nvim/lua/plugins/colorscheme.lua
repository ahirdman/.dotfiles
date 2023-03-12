return {
  {
    'ellisonleao/gruvbox.nvim',
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = false,
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = 'hard', -- can be "hard", "soft" or empty string
      dim_inactive = false,
      transparent_mode = false,
      palette_overrides = {},
      overrides = {
        WhichKeyFloat = { bg = '#1D2021', fg = '#282828' },
        -- WhichKeyBorder = { bg = '#ffffff', fg = '#ffffff' },
        -- TelescopeBorder = { bg = '#ff9900', fg = '#ff9900' },
        -- NeoTreeWinSeparator = { bg = '#ff9900', fg = '#ff9900' },
      },
    },
  },
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'gruvbox',
    },
  },
}
