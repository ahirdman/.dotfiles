---@diagnostic disable: duplicate-doc-field

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local snacks = require("snacks")

		snacks.setup({
			bigfile = { enabled = false },
			notifier = { enabled = true },
			quickfile = { enabled = false },
			statuscolumn = { enabled = false },
			---@class snacks.dashboard.Config
			---@field sections snacks.dashboard.Section
			---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
			dashboard = {
				width = 60,
				row = nil, -- dashboard position. nil for center
				col = nil, -- dashboard position. nil for center
				pane_gap = 4, -- empty columns between vertical panes
				--autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
				-- These settings are used by some built-in sections
				preset = {
					-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
					---@type fun(cmd:string, opts:table)|nil
					pick = nil,
					-- Used by the `keys` section to show keymaps.
					-- Set your curstom keymaps here.
					-- When using a function, the `items` argument are the default keymaps.
					---@type snacks.dashboard.Item[]
					keys = {
						{
							icon = { " ", hl = "DashboardYellow" },
							desc = { "Lazy", hl = "SnacksDashboardTitle" },
							action = ":Lazy",
							key = "l",
						},
						{
							icon = { "年", hl = "DashboardOrange" },
							desc = { "Mason", hl = "SnacksDashboardTitle" },
							action = ":Mason",
							key = "m",
						},
						{
							icon = { " ", hl = "DashboardPink" },
							desc = { "Neogit", hl = "SnacksDashboardTitle" },
							action = ":Neogit ",
							key = "g",
						},
						{
							icon = { " ", hl = "DashboardGreen" },
							desc = { "Files", hl = "SnacksDashboardTitle" },
							action = ":Telescope find_files",
							key = "f",
						},
						{
							icon = { " ", hl = "DashboardGit" },
							desc = { "Worktree", hl = "SnacksDashboardTitle" },
							action = ":lua require('telescope').extensions.git_worktree.git_worktrees()",
							key = "w",
						},
						{
							icon = { " ", hl = "DashboardOrange" },
							desc = { "Todos", hl = "SnacksDashboardTitle" },
							action = ":TodoTelescope",
							key = "t",
						},
					},
					header = [[


 ██████╗  ██████╗ ██████╗██╗   ██╗██████╗ ██╗   ██╗
██╔═══██╗██╔════╝██╔════╝██║   ██║██╔══██╗╚██╗ ██╔╝
██║   ██║██║     ██║     ██║   ██║██████╔╝ ╚████╔╝ 
██║   ██║██║     ██║     ██║   ██║██╔═══╝   ╚██╔╝  
╚██████╔╝╚██████╗╚██████╗╚██████╔╝██║        ██║   
 ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝        ╚═╝   
                                                   
███╗   ███╗ █████╗ ██████╗ ███████╗                
████╗ ████║██╔══██╗██╔══██╗██╔════╝                
██╔████╔██║███████║██████╔╝███████╗                
██║╚██╔╝██║██╔══██║██╔══██╗╚════██║                
██║ ╚═╝ ██║██║  ██║██║  ██║███████║                
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝                 ]],
				},
				-- item field formatters
				formats = {
					-- icon = function(item)
					-- 	if item.file and item.icon == "file" or item.icon == "directory" then
					-- 		return M.icon(item.file, item.icon)
					-- 	end
					-- 	return { item.icon, width = 2, hl = "icon" }
					-- end,
					footer = { "%s", align = "center" },
					header = { "%s", align = "center" },
					file = function(item, ctx)
						local fname = vim.fn.fnamemodify(item.file, ":~")
						fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
						local dir, file = fname:match("^(.*)/(.+)$")
						return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } }
							or { { fname, hl = "file" } }
					end,
				},
				sections = {
					{
						section = "terminal",
						cmd = "chafa /Users/ahirdman/mars.png --format symbols --symbols vhalf --align=center; sleep .1",
						height = 17,
						padding = 1,
						pane = 1,
					},
					{
						section = "header",
						pane = 2,
					},
					{ section = "keys", gap = 1, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{
						pane = 2,
						icon = { " ", hl = "DashboardPink" },
						title = "Git Status",
						section = "terminal",
						-- enabled = snacks.git.get_root() ~= nil,
						cmd = "git status -s",
						height = 5,
						padding = 1,
						ttl = 60,
						indent = 1,
					},
				},
			},
			words = { enabled = false },
		})
	end,
}
