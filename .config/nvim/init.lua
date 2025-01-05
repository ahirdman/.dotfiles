require("config.keymap.pre")
require("config.options")
require("config.autocmds")
require("config.lazy")

-- Keymaps use plugin "which-key", defer loading until plugins have been loaded
require("config.keymap.post")
-- require("config.themes.moonlander")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
