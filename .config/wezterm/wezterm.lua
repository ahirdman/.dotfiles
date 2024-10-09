local wezterm = require("wezterm")

return {
	colors = {
		foreground = "#FFFFFF",
		background = "#000000",

		cursor_bg = "#ebdbb2",
		cursor_fg = "black",

		ansi = {
			"#928374", -- black
			"#ea6962", -- red
			"#a9b665", -- green
			"#d8a657", -- yellow
			"#7daea3", -- blue
			"#d3869b", -- magenta
			"#89b482", -- cyan
			"#ebdbb2", -- white
		},
		brights = {
			"#928374", -- bright black (often gray)
			"#ea6962", -- bright red
			"#a9b665", -- bright green
			"#d8a657", -- bright yellow
			"#7daea3", -- bright blue
			"#d3869b", -- bright magenta
			"#89b482", -- bright cyan
			"#ebdbb2", -- bright white
		},
	},

	font_rules = {
		{
			italic = true,
			font = wezterm.font("Berkeley Mono", { weight = "Regular" }),
		},
	},
	font_size = 16.0,
	font = wezterm.font({
		family = "Berkeley Mono",
		weight = "Regular",
	}),

	window_decorations = "RESIZE",
	window_padding = {
		left = 2,
		right = 2,
		top = 6,
		bottom = 6,
	},

	enable_tab_bar = false,
	enable_scroll_bar = false,

	initial_rows = 60,
	initial_cols = 220,

	send_composed_key_when_left_alt_is_pressed = true,
}
