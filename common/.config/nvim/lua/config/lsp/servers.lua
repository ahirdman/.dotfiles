--- Server configurations for vim.lsp.config()
--- Each key is a server name, each value is a vim.lsp.Config table.
--- Uses root_markers instead of the deprecated root_pattern().

-- Resolve each buffer independently; Neovim can edit more than one repository.
local function typescript_project(bufnr)
	local root = vim.fs.root(bufnr, {
		{ "pnpm-workspace.yaml", "pnpm-lock.yaml", "package-lock.json", "yarn.lock", "bun.lock", "bun.lockb" },
		{ ".git", "tsconfig.json", "jsconfig.json", "package.json" },
	})
	if not root then return end

	local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc", "deno.lock" })
	if deno_root and #deno_root >= #root then return end

	local package_path = vim.fs.joinpath(root, "node_modules", "typescript", "package.json")
	local ok, package = pcall(function()
		return vim.json.decode(table.concat(vim.fn.readfile(package_path), "\n"))
	end)
	local major = ok and type(package) == "table" and type(package.version) == "string"
		and tonumber(package.version:match("^(%d+)")) or nil
	return root, major ~= nil and major >= 7
end

---@type table<string, vim.lsp.Config>
local servers = {
	graphql = {
		root_markers = { "package.json" },
	},
	cssls = {
		root_markers = { "package.json" },
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
		},
	},
	-- eslint = {
	-- 	root_markers = { ".eslintrc.js" },
	-- 	settings = {
	-- 		codeAction = {
	-- 			disableRuleComment = {
	-- 				enable = true,
	-- 				location = "separateLine",
	-- 			},
	-- 			showDocumentation = {
	-- 				enable = true,
	-- 			},
	-- 		},
	-- 		codeActionOnSave = {
	-- 			enable = false,
	-- 			mode = "all",
	-- 		},
	-- 		experimental = {
	-- 			useFlatConfig = false,
	-- 		},
	-- 		format = true,
	-- 		nodePath = "",
	-- 		onIgnoredFiles = "off",
	-- 		problems = {
	-- 			shortenToSingleLine = false,
	-- 		},
	-- 		quiet = false,
	-- 		rulesCustomizations = {},
	-- 		run = "onType",
	-- 		useESLintClass = false,
	-- 		validate = "on",
	-- 		workingDirectory = {
	-- 			mode = "location",
	-- 		},
	-- 	},
	-- },
	yamlls = {
		settings = {
			yaml = {
				schemas = {
					["https://json.schemastore.org/github-workflow.json"] = "./.github/workflows/*",
					["https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json"] = "**/azure.yaml",
				},
			},
		},
	},
	biome = {
    root_dir = function(bufnr, on_dir)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if vim.fs.root(filename, { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts", "oxfmt.config.mts" }) then
        return
      end
      local root = vim.fs.root(filename, { "biome.json", "biome.jsonc" })
      if root then on_dir(root) end
    end,
	},
	oxlint = {
		-- Use the project-local version to match CI; TS config/plugins need this flag.
		cmd = { "pnpm", "exec", "oxlint", "--lsp" },
		cmd_env = {
			NODE_OPTIONS = "--experimental-strip-types",
		},
	},
	tailwindcss = {
		root_markers = { "pnpm-workspace.yaml", ".git" },
		settings = {
			tailwindCSS = {
				classFunctions = { "cva", "cx" },
			},
		},
		-- Replaces the lspconfig before_init, so keep its editor.tabSize default.
		before_init = function(_, config)
			config.settings = vim.tbl_deep_extend("keep", config.settings, {
				editor = { tabSize = vim.lsp.util.get_effective_tabstop() },
			})
			-- Monorepos keeping their Tailwind entrypoint in the shared UI package.
			local config_file = vim.fs.joinpath(config.root_dir, "packages", "ui", "src", "styles", "globals.css")
			if vim.fn.filereadable(config_file) == 1 then
				config.settings.tailwindCSS.experimental = { configFile = config_file }
			end
		end,
	},
	-- denols = {
	-- 	root_markers = { "deno.json", "deno.jsonc" },
	-- 	single_file_support = false,
	-- 	settings = {
	-- 		deno = {
	-- 			future = true,
	-- 		},
	-- 	},
	-- },
	ts_ls = {
		root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
		root_dir = function(bufnr, on_dir)
			local root, native = typescript_project(bufnr)
			if root and not native then on_dir(root) end
		end,
		before_init = function(_, config)
			local sdk = vim.fs.joinpath(config.root_dir, "node_modules", "typescript", "lib")
			if vim.fn.filereadable(vim.fs.joinpath(sdk, "tsserver.js")) == 1 then
				config.init_options.tsserver = { path = vim.fs.joinpath(sdk, "tsserver.js") }
			end
		end,
		init_options = {
			hostInfo = "neovim",
			preferences = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
				importModuleSpecifierEnding = "minimal",
				importModuleSpecifierPreference = "non-relative",
			},
		},
		settings = {
			typescript = {
				preferences = {
					importModuleSpecifier = "non-relative",
					importModuleSpecifierEnding = "minimal",
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},
			},
		},
	},
	tsc = {
		root_dir = function(bufnr, on_dir)
			local root, native = typescript_project(bufnr)
			if root and native then on_dir(root) end
		end,
		cmd = function(dispatchers, config)
			local effect = vim.fs.joinpath(config.root_dir, "node_modules", ".bin", "effect-tsgo")
			local cmd = vim.fn.executable(effect) == 1
				and { effect, "tsc", "--lsp", "--stdio" }
				or { vim.fs.joinpath(config.root_dir, "node_modules", ".bin", "tsc"), "--lsp", "--stdio" }
			return vim.lsp.rpc.start(cmd, dispatchers, { cwd = config.root_dir })
		end,
		settings = {
			["js/ts"] = {
				preferences = {
					importModuleSpecifier = "non-relative",
					importModuleSpecifierEnding = "minimal",
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				-- workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				-- diagnostics = { disable = { "missing-fields" } },
			},
		},
	},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	pyright = {
		settings = {
			pyright = {
				disableOrganizeImports = true,
			},
		},
	},
	ruff = {},
	taplo = {},
	bicep = {},
}

return servers
