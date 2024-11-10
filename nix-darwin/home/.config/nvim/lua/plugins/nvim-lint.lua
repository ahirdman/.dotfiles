return {
	"mfussenegger/nvim-lint",
	config = function()
		local nvim_lint = require("lint")

		nvim_lint.linters_by_ft = {
			yaml = { "actionlint" },
		}
	end,
}
