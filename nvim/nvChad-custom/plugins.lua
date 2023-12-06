local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- Overrides

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- Disbale plugins

	{
		"NvChad/nvterm",
		enabled = true,
	},

	-- Additions

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = overrides.noice,
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		opts = overrides.masonDap,
	},

	{
		"David-Kunz/jester",
	},

	{
		"rcarriga/nvim-dap-ui",
		lazy = false,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dapui").setup()
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		opts = overrides.masonDap,
	},

	{
		"David-Kunz/jester",
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = overrides.dashboard,
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = overrides.trouble,
		lazy = false,
	},

	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = overrides.lspsaga,
	},
}

return plugins
