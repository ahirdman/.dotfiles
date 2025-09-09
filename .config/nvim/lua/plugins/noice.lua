return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	enabled = true,
	opts = {
		--
		-- ---@type NoiceConfigViews
		-- views = { ---@see section on views
		-- 	cmdline_popup = {
		-- 		border = {
		-- 			style = "none",
		-- 			padding = { 2, 3 },
		-- 		},
		-- 		filter_options = {},
		-- 		{
		-- 			win_options = {
		-- 				winhighlight = {
		-- 					Normal = "CommandBorder",
		-- 					FloatBorder = "CommandBorder",
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- },
		notify = {
			enabled = false,
			view = "notify",
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline_popup",
			opts = {}, -- global options for the cmdline. See section on views
			---@type table<string, CmdlineFormat>
			format = {
				-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				-- view: (default is cmdline view)
				-- opts: any options passed to the view
				-- icon_hl_group: optional hl_group for the icon
				-- title: set to anything or empty string to hide
				cmdline = { pattern = "^:", icon = "", icon_hl_group = "FloatBorder", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
				telescope = { pattern = "^:%s*Telescope%s+", icon = "", lang = "lua" },
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		popupmenu = {
			enabled = true, -- enables the Noice popupmenu UI
			---@type 'nui'|'cmp'
			backend = "nui", -- backend to use to show regular cmdline completions
			---@type NoicePopupmenuItemKind|false
			-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
			kind_icons = {}, -- set to `false` to disable icons
		},
		lsp = {
			progress = {
				enabled = true,
				--- @type NoiceFormat|string
				format = "lsp_progress",
				--- @type NoiceFormat|string
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = true,
				silent = true, -- set to true to not show a message if hover is not available
				view = nil, -- when nil, use defaults from documentation
				---@type NoiceViewOptions
				opts = {},
			},
			message = {
				enabled = true,
				view = "notify",
				---@type NoiceViewOptions
				opts = {},
			},
			documentation = {
				view = "hover",
				---@type NoiceViewOptions
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
	},
}
