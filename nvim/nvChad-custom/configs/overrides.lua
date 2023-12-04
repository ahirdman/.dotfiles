local M = {}

M.trouble = {
	position = "right",
	width = 50,
	icons = true,
	auto_open = false,
	auto_close = true,
	use_diagnostic_signs = false
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
		"tailwindcss-language-server",
		"deno",
		"prettier",
		"eslint_d",

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
	finder = {
		keys = {
		},
	},
	outline = {
		keys = {
		},
	},
	ui = {
		title = true,
	},
}

return M
