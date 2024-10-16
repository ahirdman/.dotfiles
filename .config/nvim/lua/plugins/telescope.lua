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

				--        border = true,
				-- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },

				-- prompt_title = false,
				-- prompt_border = true,

				prompt_prefix = " " .. icons.ui.Telescope .. "  ",
				selection_caret = icons.ui.BoldArrowRight .. " ",
				file_ignore_patterns = { "node_modules", "package-lock.json", ".git", "*.ttf" },
				initial_mode = "insert",
				select_strategy = "reset",
				sorting_strategy = "ascending",
				color_devicons = true,
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 120,

					-- prompt_title = { padding = { 2, 2, 2, 2 } },
					-- results_title = { padding = { 1, 1, 1, 1 } },
				},
			},
			pickers = {
				find_files = {
					previewer = false,
					hidden = true,
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
					layout_config = {
						height = 0.4,
						width = 0.6,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
			},
		})

		pcall(telescope.load_extension, "git_worktree")
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "glyph")

		local telescope_ok, telescope_builtin = pcall(require, "telescope.builtin")

		if not telescope_ok then
			return
		end

		local utils = require("config.utils")

		local function telescope_live_grep_open_files()
			require("telescope.builtin").live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})

			print(vim.bo.filetype)
		end

		utils.keymap("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, "[/] Fuzzily search in current buffer")

		utils.keymap("n", "<leader>s/", telescope_live_grep_open_files, "[S]earch [/] in Open Files")
	end,
}
