return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		local icons = require("config.icons")

		notify.setup({
			background_colour = "NotifyBackground",
			fps = 30,
			icons = {
				DEBUG = icons.diagnostics.Debug,
				ERROR = icons.diagnostics.Error,
				INFO = icons.diagnostics.Information,
				TRACE = "✎",
				WARN = icons.diagnostics.Warning,
			},
			level = 2,
			minimum_width = 50,
			max_width = 50,
			max_height = 200,
			render = "wrapped-compact",
			stages = "fade",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 3000,
			top_down = true,
		})

		vim.notify = notify
	end,
}
