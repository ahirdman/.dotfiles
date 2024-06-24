return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      local icons = require('config.icons')
      require("gitsigns").setup {
        signs = {
          add = {
            --hl = "GitSignsAdd",
            text = icons.ui.BoldLineLeft,
            --numhl = "GitSignsAddNr",
            --linehl = "GitSignsAddLn",
          },
          change = {
            --hl = "GitSignsChange",
            text = icons.ui.BoldLineLeft,
            --numhl = "GitSignsChangeNr",
            --linehl = "GitSignsChangeLn",
          },
          delete = {
            --hl = "GitSignsDelete",
            text = icons.ui.TriangleShortArrowRight,
            --numhl = "GitSignsDeleteNr",
            --linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            --hl = "GitSignsDelete",
            text = icons.ui.TriangleShortArrowRight,
            --numhl = "GitSignsDeleteNr",
            --linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            --hl = "GitSignsChange",
            text = icons.ui.BoldLineLeft,
            --numhl = "GitSignsChangeNr",
            --linehl = "GitSignsChangeLn",
          },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        status_formatter = nil,
        update_debounce = 200,
        max_file_length = 40000,
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        yadm = { enable = false },

        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          local wk = require("which-key")

          wk.register({
            g = {
              b = { function() gitsigns.blame_line { full = false } end, "Preview blame" },
            }
          }, { prefix = "<leader>" })

          wk.register({
            g = {
              h = { gitsigns.preview_hunk, 'Preview git hunk' },
              t = { gitsigns.toggle_deleted, 'Toggle deleted hunks' }
            }
          }, { prefix = "<leader>", buffer = bufnr })

          map('n', ']]', gitsigns.next_hunk, { buffer = bufnr, desc = 'Next git hunk' })
          map('n', '[[', gitsigns.prev_hunk, { buffer = bufnr, desc = 'Previous git hunk' })
        end,
      }
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  'tpope/vim-fugitive',
}
