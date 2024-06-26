return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = false,
        registers = false,
        spelling = {
          enabled = false,
        },
        presets = {
          operators = true,    -- adds help for operators like d, y, ...
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          z = true,            -- bindings for folds, spelling and others prefixed with z
          g = true,            -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      motions = {
        count = true,
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
      },
      window = {
        border = "single",        -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000,            -- positive value to position WhichKey above other floating windows.
      },
      layout = {
        height = { min = 4, max = 25 },                                                 -- min and max height of the columns
        width = { min = 20, max = 50 },                                                 -- min and max width of the columns
        spacing = 3,                                                                    -- spacing between columns
        align = "left",                                                                 -- align columns left, center or right
      },
      ignore_missing = false,                                                           -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
      show_help = true,                                                                 -- show a help message in the command line for using WhichKey
      show_keys = true,                                                                 -- show the currently pressed key and its label as a message in the command line
      triggers = "auto",                                                                -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specifiy a list manually
      -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
      triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
      },
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for keymaps that start with a native binding
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by default for Telescope
      disable = {
        buftypes = {},
        filetypes = {},
      },
    })

    local telescope_builtin = require("telescope.builtin")

    wk.register({
      ["<leader>d"] = {
        name = "Diagnostics",
        t = { "<cmd> TroubleToggle <cr>", "Toggle Trouble" },
        r = { "<cmd> TroubleRefresh <cr>", "Toggle Trouble" }
      },
      ["<leader>f"] = {
        name = "Files",
        f = { telescope_builtin.find_files, "[F]ind [F]iles" },
        m = { function() vim.lsp.buf.format({ async = true }) end, "Format" }
      },
      ["<leader>g"] = {
        name = "Git",
        f = { telescope_builtin.git_files, "Search [G]it [F]iles" },
        d = { "<cmd> DiffviewOpen origin/main...HEAD <cr>", "View diff against main"}
      },
      ["<leader>s"] = {
        name = "Search",
        d = { telescope_builtin.diagnostics, "[S]earch [D]iagnostics" },
        g = { telescope_builtin.live_grep, "[S]earch by [G]rep" },
        G = { ":LiveGrepGitRoot<cr>", "[S]earch by [G]rep on Git Root" },
        h = { telescope_builtin.help_tags, "[S]earch [H]elp" },
        r = { telescope_builtin.resume, "[S]earch [R]esume" },
        s = { telescope_builtin.builtin, "[S]earch [S]elect Telescope" },
        w = { telescope_builtin.grep_string, "[S]earch current [W]ord" },
        t = { "<cmd> TodoTelescope <cr>", "[S]earch [T]odos" },
      },
      ["?"] = { telescope_builtin.oldfiles, "[?] Find recently opened files" },
      ["<leader><leader>"] = { telescope_builtin.buffers, "[ ] Find existing buffers" }
    }, { mode = "n", prexif = "" })
  end,
}
