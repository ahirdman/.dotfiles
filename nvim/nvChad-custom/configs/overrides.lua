local M = {}

M.noice = {
	lsp = {
		hover = {
			enabled = false,
		},
		signature = {
			enabled = false,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},

	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},

	views = {
		cmdline_popup = {
			border = {},
		},
	},
}

M.masonDap = {
	ensure_installed = { "node2", "js" },
	automatic_installation = true,
}

M.trouble = {
	position = "right",
	width = 50,
	icons = true,
	auto_open = false,
	auto_close = true,
	use_diagnostic_signs = false,
}

M.dashboard = {
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		project = { enable = false },
		shortcut = {
			{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
	},
}

M.treesitter = {
	ensure_installed = {
		-- common
		"toml",
		"yaml",
		"json",
		"markdown",
		"markdown_inline",

		-- nvim
		"vim",
		"lua",

		-- web development
		"html",
		"css",

		-- javascript
		"javascript",
		"typescript",
		"tsx",

		-- C#
		"c_sharp",
		"bicep",

		-- rust
		"rust",

		-- GO
		"go",

		-- iOS
		"swift",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- common
		"json-lsp",
		"actionlint",
		"yaml-language-server",

		-- nvim
		"lua-language-server",
		"stylua",

		-- web development
		"css-lsp",
		"html-lsp",

		-- javascript
		"typescript-language-server",
		"quick_lint_js",

		-- C#
		"csharp-language-server",
		"omnisharp-mono",
		"csharpier",

		-- rust
		"rust-analyzer",

		-- GO
		"gopls",
	},
}

-- git support in nvimtree
M.nvimtree = {
	filters = {
		custom = { "^.git$" },
	},
	git = {
		enable = true,
		ignore = false,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},

		icons = {
			show = {
				git = true,
			},
			glyphs = {
				folder = {
					default = "",
				},
			},
		},
	},
}

M.lspsaga = {
	lightbulb = {
		enable = false,
	},
	symbol_in_winbar = {
		enable = false,
	},
	ui = {
		title = true,
	},
}

return M
