return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			{ "b0o/schemastore.nvim" },
			"folke/neoconf.nvim",
		},
		config = function()
			local icons = require("config.icons")
			local servers = require("config.lsp.servers")
			local on_attach = require("config.lsp.on-attach")

			-- Native TypeScript watches the whole monorepo. Runtime state and caches
			-- must not invalidate its projects on every background write.
			-- Neovim 0.12 uses this exclusion for macOS event watchers too.
			local watchfiles = require("vim.lsp._watchfiles")
			for _, pattern in ipairs({
				"**/.git/**",
				"**/.alchemy/**",
				"**/.wrangler/**",
				"**/.turbo/**",
				"**/.container-stage-*/**",
				"**/*.tsbuildinfo",
			}) do
				watchfiles._poll_exclude_pattern = watchfiles._poll_exclude_pattern + vim.glob.to_lpeg(pattern)
			end

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

			-- Shared capabilities (blink.cmp completion support)
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Apply shared config to all servers via the '*' wildcard
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Register each server config with vim.lsp.config()
			for name, config in pairs(servers) do
				vim.lsp.config(name, config)
			end

			-- Oxlint and native TypeScript are provided by the project, not Mason.
			local mason_servers = vim.tbl_filter(function(name)
				return name ~= "oxlint" and name ~= "tsc"
			end, vim.tbl_keys(servers))

			-- Ensure the remaining configured servers are installed via Mason.
			require("mason-lspconfig").setup({
				ensure_installed = not vim.env.DOTFILES_LIGHT and mason_servers or {},
				automatic_enable = false,
			})

			-- Explicitly enable all registered server configs using the Neovim 0.11
			-- built-in LSP activation flow instead of relying on mason-lspconfig
			-- plugin-specific auto-enable behavior.
			vim.lsp.enable(vim.tbl_keys(servers))

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
