return {
  -- Work specifik LSP servers
  eslint = {
    settings = {
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine"
        },
        showDocumentation = {
          enable = true
        }
      },
      codeActionOnSave = {
        enable = false,
        mode = "all"
      },
      experimental = {
        useFlatConfig = false
      },
      format = true,
      nodePath = "",
      onIgnoredFiles = "off",
      problems = {
        shortenToSingleLine = false
      },
      quiet = false,
      rulesCustomizations = {},
      run = "onType",
      useESLintClass = false,
      validate = "on",
      workingDirectory = {
        mode = "location"
      }
    }
  },
  bicep = {},
  -- Everyday usage LSP servers
  yamlls = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "./.github/workflows/*",
      }
    },
  },
  biome = {
    settings = {
      enable = false
    }
  },
  tailwindcss = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
        },
      },
    }
  },
  pyright = {},
  taplo = {},
  -- actionlint = {},
  -- denols = {},
  ts_ls = {
    settings = {
      enable = true,
      single_file_support = false,
    },
    init_options = {
      preferences = {
        disableSuggestions = true
      }
    }
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
  jsonls = {
    json = {
      schema = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
  gopls = {},
  sqls = {
    settings = {
      sqls = {
        connections = {
          {
            driver = 'postgresql',
            dataSourceName =
            'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
          },
        },
      },
    },
  }
}
