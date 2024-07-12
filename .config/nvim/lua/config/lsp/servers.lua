return {
  yamlls = {},
  -- quick_lint_js = {},
  tailwindcss = {},
  pyright = {},
  taplo = {},
  -- actionlint = {},
  -- denols = {},
  tsserver = {
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
    settings = {
      json = {
        schema = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
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
