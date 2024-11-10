return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "b0o/schemastore.nvim" },
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		"folke/neoconf.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lsp_config = require("lspconfig")
		local neodev = require("neodev")
		local servers = require("config.lsp.servers")
		local on_attach = require("config.lsp.on-attach")

		require("neoconf").setup({
			local_settings = ".neoconf.json",
			global_settings = "neoconf.json",
			import = {
				vscode = true, -- local .vscode/settings.json
				coc = true, -- global/local coc-settings.json
				nlsp = true, -- global/local nlsp-settings.nvim json settings
			},
			live_reload = true,
			-- set the filetype to jsonc for settings files, so you can use comments
			-- make sure you have the jsonc treesitter parser installed!
			filetype_jsonc = true,
			plugins = {
				-- configures lsp clients with settings in the following order:
				-- - lua settings passed in lspconfig setup
				-- - global json settings
				-- - local json settings
				lspconfig = {
					enabled = true,
				},
				-- configures jsonls to get completion in .nvim.settings.json files
				jsonls = {
					enabled = true,
					-- only show completion in json settings for configured lsp servers
					configured_servers_only = true,
				},
				-- configures lua_ls to get completion of lspconfig server settings
				lua_ls = {
					-- by default, lua_ls annotations are only enabled in your neovim config directory
					enabled_for_neovim_config = true,
					-- explicitly enable adding annotations. Mostly relevant to put in your local .nvim.settings.json file
					enabled = false,
				},
			},
		})

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		neodev.setup()

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		mason_lspconfig.setup_handlers({
			function(server_name)
				local server_opts = servers[server_name] or {}
				server_opts.capabilities = capabilities
				server_opts.on_attach = on_attach

				lsp_config[server_name].setup(server_opts)
			end,

			lsp_config.nixd.setup({
				cmd = { "nixd" },
				settings = {
					nixd = {
						nixpgs = {
							expr = "import <nixpgs> { }",
						},
						formatting = {
							command = { "alejandra" },
						},
					},
				},
			}),
		})

		vim.diagnostic.config({
			title = false,
			underline = true,
			virtual_text = true,
			signs = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				source = true,
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})
	end,
}
