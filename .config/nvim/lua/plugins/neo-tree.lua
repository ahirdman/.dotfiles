return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	enabled = true,
	event = "VeryLazy",
	config = function()
		local icons = require("config.icons")
		local events = require("neo-tree.events")

		---@class FileMovedArgs
		---@field source string
		---@field destination string

		---@param args FileMovedArgs
		local function on_file_remove(args)
			local ts_clients = vim.lsp.client({ name = "ts_ls" })

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
			use_popups_for_input = true,
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_modified_markers = true,
			enable_diagnostics = true,
			sort_case_insensitive = true,
			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					with_markers = true,
					with_expanders = true,
				},
				modified = {
					symbol = icons.ui.Pencil,
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				icon = {
					folder_closed = icons.ui.Folder,
					folder_open = icons.ui.FolderOpen,
					folder_empty = icons.ui.EmptyFolder,
					folder_empty_open = icons.ui.EmptyFolderOpen,
				},
				git_status = {
					symbols = {
						-- Change type
						added = "",
						modified = "",
						deleted = icons.git.FileDeleted,
						renamed = icons.git.FileRenamed,
						-- Status type
						untracked = icons.git.FileUntracked,
						ignored = icons.git.FileIgnored,
						unstaged = icons.git.FileUnstaged,
						staged = icons.git.FileStaged,
						conflict = icons.git.Diff,
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
						".git",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
					mappings = {
						["<Tab>"] = "open",
						nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
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
						show_path = "relative", -- "none", "relative", "absolute"
					},
				},
			},
		})
	end,
}
