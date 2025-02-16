return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local icons = require("config.icons")

		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			view = {
				entries = "custom",
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			enabled = function()
				-- disable completion in comments
				local context = require("cmp.config.context")
				local buftype = vim.api.nvim_buf_get_option(0, "buftype")

				if buftype == "prompt" then
					return false
				end

				local is_floating = vim.api.nvim_win_get_config(0).relative ~= ""

				if is_floating then
					return false
				end

				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "nvim_lsp", keyword_length = 0 },
				{ name = "luasnip", keyword_length = 0 },
				{ name = "path" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "calc" },
				{ name = "emoji" },
				{ name = "treesitter" },
				{ name = "tmux" },
				{ name = "tsnip" },
			},
			formatting = {
				format = function(entry, vim_item)
					-- From kind_icons array
					-- This concatenates the icons with the name of the item kind
					vim_item.kind = string.format("%s %s", icons.kind[vim_item.kind], vim_item.kind)
					-- Source
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						nvim_lua = "[Lua]",
						luasnip = "[LuaSnip]",
						latex_symbols = "[LaTeX]",
						tsnip = "[tsnip]",
					})[entry.source.name]
					return vim_item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-a>"] = cmp.mapping.complete({
					config = {
						sources = {
							{ name = "nvim_lsp" },
						},
					},
				}),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
		})
	end,
}
