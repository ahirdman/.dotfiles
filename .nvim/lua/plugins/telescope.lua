return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  options = {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
    config = function(options)
      require('telescope').setup(options)
      -- Enable telescope fzf native, if installed

      pcall(require('telescope').load_extension, 'fzf')
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
