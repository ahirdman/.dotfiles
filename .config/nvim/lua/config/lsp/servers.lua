--- Server configurations for vim.lsp.config()
--- Each key is a server name, each value is a vim.lsp.Config table.
--- Uses root_markers instead of the deprecated root_pattern().

---@type table<string, vim.lsp.Config>
local servers = {
	graphql = {
		root_markers = { "package.json" },
		single_file_support = true,
	},
	cssls = {
		root_markers = { "package.json" },
		single_file_support = false,
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
		root_markers = { "biome.json" },
	},
	tailwindcss = {
		root_markers = { "package.json" },
		settings = {
			tailwindCSS = {
				classFunctions = { "cva", "cx" },
			},
		},
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
		root_markers = { "package.json" },
		single_file_support = false,
		init_options = {
			hostInfo = "neovim",
			preferences = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
				importModuleSpecifierEnding = "minimal",
				importModuleSpecifierPreference = "non-relative",
				disableSuggestions = true,
			},
		},
		settings = {
			typescript = {
				preferences = {
					disableSuggestions = true,
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
	-- sqls = {
	-- 	settings = {
	-- 		sqls = {
	-- 			connections = {
	-- 				{
	-- 					driver = "postgresql",
	-- 					dataSourceName = "host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
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
