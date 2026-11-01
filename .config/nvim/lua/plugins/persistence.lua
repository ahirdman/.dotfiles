return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>S", group = "Session" },
		{
			"<leader>Sl",
			function()
				require("persistence").load()
			end,
			desc = "Restore session for this directory",
		},
		{
			"<leader>Ss",
			function()
				require("persistence").select()
			end,
			desc = "Select session",
		},
		{
			"<leader>Sd",
			function()
				require("persistence").stop()
			end,
			desc = "Don't save this session",
		},
	},
	config = function()
		require("persistence").setup()
	end,
}
