return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			{ "b0o/schemastore.nvim" },
			"folke/neoconf.nvim",
		},
		config = function()
			local icons = require("config.icons")
			local servers = require("config.lsp.servers")
			local on_attach = require("config.lsp.on-attach")

			-- neoconf must be set up BEFORE any LSP config
			require("neoconf").setup({
				local_settings = ".neoconf.json",
				global_settings = "neoconf.json",
				import = {
					vscode = false,
				},
				live_reload = true,
				filetype_jsonc = true,
				plugins = {
					lspconfig = {
						enabled = true,
					},
					jsonls = {
						enabled = true,
						configured_servers_only = true,
					},
					lua_ls = {
						enabled_for_neovim_config = true,
						enabled = false,
					},
				},
			})

			-- Mason UI config
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Shared capabilities (nvim-cmp completion support)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Apply shared config to all servers via the '*' wildcard
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Register each server config with vim.lsp.config()
			for name, config in pairs(servers) do
				vim.lsp.config(name, config)
			end

			-- mason-lspconfig v2: ensures servers are installed and
			-- automatically calls vim.lsp.enable() for installed servers
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_enable = true,
			})

			-- LspAttach autocmd replaces per-server on_attach callbacks
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user.lsp.attach", { clear = true }),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client then
						on_attach(client, ev.buf)
					end
				end,
			})

			-- Diagnostics config (unchanged)
			vim.diagnostic.config({
				title = true,
				underline = true,
				virtual_text = {
					suffix = " ",
					source = false,
					current_line = false,
					prefix = function(diagnostic)
						if diagnostic.severity == 1 then
							return " " .. icons.diagnostics.BoldError
						end

						if diagnostic.severity == 2 then
							return " " .. icons.diagnostics.BoldWarning
						end
						if diagnostic.severity == 3 then
							return " " .. icons.diagnostics.BoldInformation
						end
						if diagnostic.severity == 4 then
							return " " .. icons.diagnostics.BoldHint
						end

						return "●"
					end,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = icons.diagnostics.BoldError,
						[vim.diagnostic.severity.WARN] = icons.diagnostics.BoldWarning,
						[vim.diagnostic.severity.HINT] = icons.diagnostics.BoldHint,
						[vim.diagnostic.severity.INFO] = icons.diagnostics.BoldInformation,
					},
				},
				update_in_insert = false,
				severity_sort = true,
				virtual_lines = false,
				float = {
					source = "if_many",
					style = "minimal",
					header = "",
					prefix = "",
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
