local M = {}

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
