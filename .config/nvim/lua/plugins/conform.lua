return {
	"stevearc/conform.nvim",
	config = function()
		---@module "conform"
		---@type conform.setupOpts
		require("conform").setup({
			log_level = 2,
			formatters_by_ft = {
				lua = { "stylua" },
				bicep = { "bicep" },
				json = { "jsonls" },
				javascript = { "biome", "prettier", stop_after_first = true },
				javascriptreact = { "biome", "prettier", stop_after_first = true },
				typescript = { "biome", "prettier", stop_after_first = true },
				typescriptreact = { "biome", "prettier", stop_after_first = true },
				nix = { "alejandra" },
			},
			formatters = {
				taplo = {},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		-- vim.api.nvim_create_user_command("Format", function()
		-- 	local formatters = get_closest_formatter({
		-- 		biome = { "biome.json" },
		-- 		prettier = { ".prettierrc", "prettier.config.js" },
		-- 		stylua = { "stylua.toml" },
		-- 	})
		--
		-- 	if not formatters then
		-- 		print("Formatter not found, using lsp")
		-- 		require("conform").format({ async = true, lsp_fallback = true })
		-- 	else
		-- 		print("Formatted with " .. formatters[1])
		-- 		require("conform").format({ async = true, formatters, lsp_fallback = false })
		-- 	end
		-- end, {})
		--
		-- vim.api.nvim_create_user_command("FormatWithBiome", function()
		-- 	require("conform").format({
		-- 		async = true,
		-- 		formatters = { "biome" },
		-- 		lsp_fallback = false,
		-- 	})
		-- end, {})
		--
		-- vim.api.nvim_create_user_command("FormatWithPrettier", function()
		-- 	require("conform").format({
		-- 		async = true,
		-- 		formatters = { "prettier" },
		-- 		lsp_fallback = false,
		-- 	})
		-- end, {})
		vim.api.nvim_create_user_command("FWNix", function()
			require("conform").format({
				async = true,
				formatters = { "nixpkgs-fmt" },
				lsp_fallback = false,
			})
		end, {})
	end,
	--
	-- init = function()
	-- 	-- If you want the formatexpr, here is the place to set it
	-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	-- end,
}
