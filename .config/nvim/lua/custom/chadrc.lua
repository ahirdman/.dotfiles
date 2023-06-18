---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvchad",
  theme_toggle = { "gruvchad", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,

    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "Trouble Toggle", "<leader>xx", "..." },
      { "Trouble Diagnostics", "<leader>xd", "..." },
      { "Trouble Quickfix", "<leader>xq", "..." },
      { "Undo Tree Toggle", "<leader>u", "..." },
      { "Rename Symbol", "<leader>ra", "..." },
      { "Lsp Saga Outline", "<leader>o", "..." },
      { "Lsp Saga Code Action", "<leader>ca", "..." },
      { "Lsp Saga Finder", "gh", "..." },
      { "Lsp Saga Peek Definition", "gp", "..." },
      { "Lsp Saga Peek Type Definition", "gt", "..." },
    },
  },
}



M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
