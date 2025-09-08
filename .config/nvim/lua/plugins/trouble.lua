return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	enabled = true,
	config = function()
		local icons = require("config.icons")

		require("trouble").setup({
			auto_close = true, -- auto close when there are no items
			auto_open = false, -- auto open when there are items
			auto_preview = true, -- automatically open preview when on an item
			autm_refresh = true, -- auto refresh when open
			auto_jump = false, -- auto jump to the item when there's only one
			focus = false, -- Focus the window when opened
			restore = true, -- restores the last location in the list when opening
			follow = true, -- Follow the current item
			indent_guides = true, -- show indent guides
			max_items = 200, -- limit number of items that can be displayed per section
			multiline = true, -- render multi-line messages
			pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
			warn_no_results = true, -- show a warning when there are no results
			open_no_results = false, -- open the trouble window when there are no results
			---@type trouble.Window.opts
			win = {}, -- window options for the results window. Can be a split or a floating window.
			-- Window options for the preview window. Can be a split, floating window,
			-- or `main` to show the preview in the main editor window.
			---@type trouble.Window.opts
			preview = {
				type = "main",
				-- when a buffer is not yet loaded, the preview window will be created
				-- in a scratch buffer with only syntax highlighting enabled.
				-- Set to false, if you want the preview to always be a real loaded buffer.
				scratch = true,
			},
			-- Key mappings can be set to the name of a builtin action,
			-- or you can define your own custom action.
			---@type table<string, trouble.Action.spec>
			keys = {
				["?"] = "help",
				r = "refresh",
				R = "toggle_refresh",
				q = "close",
				o = "jump_close",
				["<esc>"] = "cancel",
				["<cr>"] = "jump",
				["<2-leftmouse>"] = "jump",
				["<c-s>"] = "jump_split",
				["<c-v>"] = "jump_vsplit",
				-- go down to next item (accepts count)
				-- j = "next",
				["}"] = "next",
				["]]"] = "next",
				-- go up to prev item (accepts count)
				-- k = "prev",
				["{"] = "prev",
				["[["] = "prev",
				dd = "delete",
				d = { action = "delete", mode = "v" },
				i = "inspect",
				p = "preview",
				P = "toggle_preview",
				zo = "fold_open",
				zO = "fold_open_recursive",
				zc = "fold_close",
				zC = "fold_close_recursive",
				za = "fold_toggle",
				zA = "fold_toggle_recursive",
				zm = "fold_more",
				zM = "fold_close_all",
				zr = "fold_reduce",
				zR = "fold_open_all",
				zx = "fold_update",
				zX = "fold_update_all",
				zn = "fold_disable",
				zN = "fold_enable",
				zi = "fold_toggle_enable",
				gb = { -- example of a custom action that toggles the active view filter
					action = function(view)
						view:filter({ buf = 0 }, { toggle = true })
					end,
					desc = "Toggle Current Buffer Filter",
				},
				s = { -- example of a custom action that toggles the severity
					action = function(view)
						local f = view:get_filter("severity")
						local severity = ((f and f.filter.severity or 0) + 1) % 5
						view:filter({ severity = severity }, {
							id = "severity",
							template = "{hl:Title}Filter:{hl} {severity}",
							del = severity == 0,
						})
					end,
					desc = "Toggle Severity Filter",
				},
			},
			---@type table<string, trouble.Mode>
			modes = {
				-- sources define their own modes, which you can use directly,
				-- or override like in the example below
				lsp_references = {
					-- some modes are configurable, see the source code for more details
					params = {
						include_declaration = true,
					},
				},
				-- The LSP base mode for:
				-- * lsp_definitions, lsp_references, lsp_implementations
				-- * lsp_type_definitions, lsp_declarations, lsp_command
				lsp_base = {
					params = {
						-- don't include the current location in the results
						include_current = false,
					},
				},
				diagnostics = {
					groups = {
						{ "filename", format = "{file_icon} {basename:Title} {count}" },
					},
				},
				-- more advanced example that extends the lsp_document_symbols
				symbols = {
					desc = "document symbols",
					mode = "lsp_document_symbols",
					focus = false,
					win = { position = "right" },
					filter = {
						-- remove Package since lua_ls uses it for control flow structures
						["not"] = { ft = "lua", kind = "Package" },
						any = {
							-- all symbol kinds for help / markdown files
							ft = { "help", "markdown" },
							-- default set of symbol kinds
							kind = {
								"Class",
								"Constructor",
								"Enum",
								"Field",
								"Function",
								"Interface",
								"Method",
								"Module",
								"Namespace",
								"Package",
								"Property",
								"Struct",
								"Trait",
							},
						},
					},
				},
			},
			icons = {
				---@type trouble.Indent.symbols
				indent = {
					top = "│ ",
					middle = "├╴",
					last = "└╴",
					fold_open = " ",
					fold_closed = " ",
					ws = "  ",
				},
				folder_closed = icons.ui.Folder,
				folder_open = icons.ui.FolderOpen,
				kinds = {
					Array = icons.kind.Array,
					Boolean = icons.kind.Boolean,
					Class = icons.kind.Class,
					Constant = icons.kind.Constant,
					Constructor = icons.kind.Constructor,
					Enum = icons.kind.Enum,
					EnumMember = icons.kind.EnumMember,
					Event = icons.kind.Event,
					Field = icons.kind.Field,
					File = icons.kind.File,
					Function = icons.kind.Function,
					Interface = icons.kind.Interface,
					Key = icons.kind.Key,
					Method = icons.kind.Method,
					Module = icons.kind.Module,
					Namespace = icons.kind.Namespace,
					Null = icons.kind.Null,
					Number = icons.kind.Number,
					Object = icons.kind.Object,
					Operator = icons.kind.Operator,
					Package = icons.kind.Package,
					Property = icons.kind.Property,
					String = icons.kind.String,
					Struct = icons.kind.Struct,
					TypeParameter = icons.kind.TypeParameter,
					Variable = icons.kind.Variable,
				},
			},
		})
	end,
}
