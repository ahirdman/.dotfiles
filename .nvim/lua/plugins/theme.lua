return {
  'folke/tokyonight.nvim',
  opts = {
    style = 'storm',
    light_style = 'day',
  },
  init = function()
    vim.cmd [[colorscheme tokyonight]]
  end,
  config = function(opts)
    require('tokyonight').setup(opts)
  end,
}
