return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local icons = require("config.icons")
    local actions = require("telescope.actions")

    local function formattedName(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then
        return tail
      end
      return string.format("%s\t\t%s", tail, parent)
    end

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        prompt_prefix = " " .. icons.ui.Telescope .. "  ",
        selection_caret = icons.ui.BoldArrowRight .. " ",
        file_ignore_patterns = { "node_modules", "package-lock.json" },
        initial_mode = "insert",
        select_strategy = "reset",
        sorting_strategy = "ascending",
        color_devicons = true,
        layout_config = {
          prompt_position = "top",
          preview_cutoff = 120,
        },
      },
      pickers = {
        find_files = {
          previewer = false,
          layout_config = {
            height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        },
        buffers = {
          path_display = formattedName,
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["<c-d>"] = actions.delete_buffer,
            },
          },
          previewer = false,
          initial_mode = "normal",
          -- theme = "dropdown",
          layout_config = {
            height = 0.4,
            width = 0.6,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        }
      }
    })

    pcall(telescope.load_extension, "fzf")

    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == "" then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ":h")
      end

      -- Find the Git root directory from the current file's path
      local git_root =
          vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
      if vim.v.shell_error ~= 0 then
        print("Not a git repository. Searching on current working directory")
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        require("telescope.builtin").live_grep({
          search_dirs = { git_root },
        })
      end
    end

    local telescope_ok, telescope_builtin = pcall(require, "telescope.builtin")

    if not telescope_ok then
      return
    end

    vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    local function telescope_live_grep_open_files()
      require("telescope.builtin").live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })

      print(vim.bo.filetype)
    end

    vim.keymap.set("n", "<leader>s/", telescope_live_grep_open_files, { desc = "[S]earch [/] in Open Files" })
  end,
}
