local M = {}

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
		"vim",
		"lua",
		"html",
		"css",
		"c_sharp",
		"bicep",
		"javascript",
		"typescript",
		"tsx",
		"json",
    "rust",
		"toml",
		"yaml",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"tailwindcss-language-server",
		"json-lsp",
		"deno",
		"prettier",
		"eslint_d",
		"csharp-language-server",
		"omnisharp-mono",
		"csharpier",

    -- Chad stuff
    "rust-analyzer",

		-- dev ops stuff
		"actionlint",
		"yaml-language-server",
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
			expand_or_jump = "<CR>",
		},
	},
	outline = {
		keys = {
			expand_or_jump = "<CR>",
		},
	},
	ui = {
		title = true,
	},
}

return M
