return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local trouble = require("todo-comments")
		local icons = require("config.icons")

		trouble.setup({
			signs = true,
			sign_priority = 8,
			keywords = {
				FIX = { icon = icons.diagnostics.Debug, color = "error" },
				TODO = { icon = icons.ui.Check, color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = icons.diagnostics.Warning, color = "warning" },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = icons.diagnostics.Information, color = "#7daea3", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true, -- enable multiline todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "",
				keyword = "wide",
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400,
				exclude = {},
			},
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#ea6962" },
				warning = { "DiagnosticWarn", "WarningMsg", "#d8a657" },
				info = { "DiagnosticInfo", "#7daea3" },
				hint = { "DiagnosticHint", "#a9b665" },
				default = { "Identifier", "#ebdbb2" },
				test = { "Identifier", "#d3869b" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		})
	end,
}
