local nvim_lsp = require("lspconfig")

---@type lspconfig.options
local servers = {
	cssls = {
		root_dir = nvim_lsp.util.root_pattern("package.json"),
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
	-- 	root_dir = nvim_lsp.util.root_pattern(".eslintrc.js"),
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
		root_dir = nvim_lsp.util.root_pattern("biome.json"),
	},
	tailwindcss = {
		--root_dir = nvim_lsp.util.root_pattern("tailwind.config.ts", "tailwind.config.js", "tailwind.config.cjs", "postcss.config.mjs"),
		root_dir = nvim_lsp.util.root_pattern("package.json"),
		settings = {
			tailwindCSS = {
				classFunctions = { "cva", "cx" },
			},
		},
	},
	-- denols = {
	-- 	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
	-- 	single_file_support = false,
	-- 	settings = {
	-- 		deno = {
	-- 			future = true,
	-- 		},
	-- 	},
	-- },
	ts_ls = {
		root_dir = nvim_lsp.util.root_pattern("package.json"),
		single_file_support = false,
		init_options = {
			preferences = {
				disableSuggestions = true,
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
