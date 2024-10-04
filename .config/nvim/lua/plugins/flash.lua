return {
	"folke/flash.nvim",
	event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
	---@type Flash.Config
	opts = {
		---@type (string|fun(win:window))[]
		exclude = {
			"notify",
			"cmp_menu",
			"noice",
			"flash_prompt",
			function(win)
				-- exclude non-focusable windows
				return not vim.api.nvim_win_get_config(win).focusable
			end,
		},
		highlight = {
			backdrop = true,
			matches = true,
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		treesitter = {
			labels = "abcdefghijklmnopqrstuvwxyz",
			jump = { pos = "range" },
			search = { incremental = false },
			label = { before = true, after = true, style = "highlight" },
			highlight = {
				backdrop = true,
				matches = true,
			},
		},
	},
}
