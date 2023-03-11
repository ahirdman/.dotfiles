return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  keys = {
    {
      '<leader>fe',
      function()
        require('neo-tree.command').execute { toggle = true, dir = require('lazyvim.util').get_root() }
      end,
      desc = 'Explorer NeoTree (root dir)',
    },
    {
      '<leader>fE',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
      end,
      desc = 'Explorer NeoTree (cwd)',
    },
    { '<leader>e', '<leader>fe', desc = 'Explorer NeoTree (root dir)', remap = true },
    { '<leader>E', '<leader>fE', desc = 'Explorer NeoTree (cwd)', remap = true },
  },
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then
        require 'neo-tree'
      end
    end
  end,
  opts = {
    source_selector = {
      winbar = true, -- toggle to show selector on winbar
      statusline = true, -- toggle to show selector on statusline
      show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
      -- of the top visible node when scrolled down.
      tab_labels = { -- falls back to source_name if nil
        filesystem = '  Files ',
        buffers = '  Buffers ',
        git_status = '  Git ',
        diagnostics = ' 裂Diagnostics ',
      },
      content_layout = 'center', -- only with `tabs_layout` = "equal", "focus"
      --                start  : |/ 裡 bufname     \/...
      --                end    : |/     裡 bufname \/...
      --                center : |/   裡 bufname   \/...
      tabs_layout = 'equal', -- start, end, center, equal, focus
      --             start  : |/  a  \/  b  \/  c  \            |
      --             end    : |            /  a  \/  b  \/  c  \|
      --             center : |      /  a  \/  b  \/  c  \      |
      --             equal  : |/    a    \/    b    \/    c    \|
      --             active : |/  focused tab    \/  b  \/  c  \|
      truncation_character = '…', -- character to use when truncating the tab label
      tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
      tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
      padding = 0, -- can be int or table
      -- padding = { left = 2, right = 0 },
      -- separator = "▕", -- can be string or table, see below
      separator = { left = '▏', right = '▕' },
      -- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
      -- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
      -- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
      -- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
      -- separator = "|",                                              -- ||  a  |  b  |  c  |...
      separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
      show_separator_on_edge = false,
      --                       true  : |/    a    \/    b    \/    c    \|
      --                       false : |     a    \/    b    \/    c     |
      highlight_tab = 'NeoTreeTabInactive',
      highlight_tab_active = 'NeoTreeTabActive',
      highlight_background = 'NeoTreeTabInactive',
      highlight_separator = 'NeoTreeTabSeparatorInactive',
      highlight_separator_active = 'NeoTreeTabSeparatorActive',
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = false,
    },
    window = {
      mappings = {
        ['<space>'] = 'none',
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
    },
  },
}
