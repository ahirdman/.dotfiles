return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
  lazy = false,
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
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
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
		vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })

		-- See `:help telescope.builtin`
		vim.keymap.set(
			"n",
			"<leader>?",
			require("telescope.builtin").oldfiles,
			{ desc = "[?] Find recently opened files" }
		)
		vim.keymap.set(
			"n",
			"<leader><space>",
			require("telescope.builtin").buffers,
			{ desc = "[ ] Find existing buffers" }
		)

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

		vim.keymap.set("n", "<leader>ss", telescope_builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>gf", telescope_builtin.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", telescope_builtin.resume, { desc = "[S]earch [R]esume" })
	end,
}
