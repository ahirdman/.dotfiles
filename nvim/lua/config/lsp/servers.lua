return {
  yamlls = {},
  jsonls = {
    settings = {
      json = {
        schema = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  quick_lint_js = {},
  tsserver = {
    settings = {
      enable = true,
      single_file_support = false
    }
  },
  -- denols = {
  --   settings = {
  --     enable = false,
  --     single_file_support = true
  --   }
  -- },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
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
