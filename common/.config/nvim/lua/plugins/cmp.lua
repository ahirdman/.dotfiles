return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	},
	config = function()
		local icons = require("config.icons")

		require("luasnip.loaders.from_vscode").lazy_load()

		local function in_comment()
			local cursor = vim.api.nvim_win_get_cursor(0)
			local ok, node = pcall(vim.treesitter.get_node, { pos = { cursor[1] - 1, math.max(cursor[2] - 1, 0) } })
			return ok and node ~= nil and node:type():find("comment", 1, true) ~= nil
		end

		require("blink.cmp").setup({
			enabled = function()
				return vim.bo.buftype ~= "prompt" and vim.api.nvim_win_get_config(0).relative == "" and not in_comment()
			end,
			snippets = { preset = "luasnip" },
			cmdline = { enabled = false },
			appearance = { kind_icons = icons.kind },
			completion = {
				list = { selection = { preselect = true, auto_insert = false } },
				menu = { border = "rounded" },
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = { border = "rounded" },
				},
			},
			sources = {
				default = { "lazydev", "lsp", "snippets", "path" },
				providers = {
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			keymap = {
				preset = "none",
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<C-a>"] = {
					function(cmp)
						return cmp.show({ providers = { "lsp" } })
					end,
				},
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},
		})
	end,
}
