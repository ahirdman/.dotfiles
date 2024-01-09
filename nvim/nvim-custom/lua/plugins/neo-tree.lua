return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  keys = {
    { "<leader><tab>", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    { "<leader>e",     ":Neotree reveal left<CR>",  silent = true, desc = "Left File Explorer" },
    { "<c-n>",         ":Neotree toggle left<CR>",  silent = true, desc = "Toggle Explorer" },
  },
  config = function()
    local events = require("neo-tree.events")
    ---@class FileMovedArgs
    ---@field source string
    ---@field destination string

    ---@param args FileMovedArgs
    local function on_file_remove(args)
      local ts_clients = vim.lsp.get_active_clients({ name = "tsserver" })
      for _, ts_client in ipairs(ts_clients) do
        ts_client.request("workspace/executeCommand", {
          command = "_typescript.applyRenameFile",
          arguments = {
            {
              sourceUri = vim.uri_from_fname(args.source),
              targetUri = vim.uri_from_fname(args.destination),
            },
          },
        })
      end
    end

    require("neo-tree").setup({
      use_popups_for_input = false,
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      default_component_configs = {
        container = {
          enable_character_fade = true
        },
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = " ",
          highlight = "NeoTreeModified",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      window = {
        position = "float",
        width = 35,
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = events.FILE_MOVED,
          handler = on_file_remove,
        },
        {
          event = events.FILE_RENAMED,
          handler = on_file_remove,
        },
      },
      mappings = {
        ["<Tab>"] = "open",
        ["<C-i>"] = "open",
        ["m"] = {
          "add",
          -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = "absolute" -- "none", "relative", "absolute"
          }
        },
      }
    })
  end,
}
