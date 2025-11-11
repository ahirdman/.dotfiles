---@diagnostic disable: duplicate-doc-field

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	enabled = true,
	config = function()
		local snacks = require("snacks")

		snacks.setup({
			gh = { --- Keymaps for GitHub buffers
				---@type table<string, snacks.gh.Keymap|false>?
				keys = {
					select = { "<cr>", "gh_actions", desc = "Select Action" },
					edit = { "i", "gh_edit", desc = "Edit" },
					comment = { "a", "gh_comment", desc = "Add Comment" },
					close = { "c", "gh_close", desc = "Close" },
					reopen = { "o", "gh_reopen", desc = "Reopen" },
				},
				---@type vim.wo|{}
				wo = {
					breakindent = true,
					wrap = true,
					showbreak = "",
					linebreak = true,
					number = false,
					relativenumber = false,
					foldexpr = "v:lua.vim.treesitter.foldexpr()",
					foldmethod = "expr",
					concealcursor = "n",
					conceallevel = 2,
					list = false,
					winhighlight = Snacks.util.winhl({
						Normal = "SnacksGhNormal",
						NormalFloat = "SnacksGhNormalFloat",
						FloatBorder = "SnacksGhBorder",
						FloatTitle = "SnacksGhTitle",
						FloatFooter = "SnacksGhFooter",
					}),
				},
				---@type vim.bo|{}
				bo = {},
				diff = {
					min = 4, -- minimum number of lines changed to show diff
					wrap = 80, -- wrap diff lines at this length
				},
				scratch = {
					height = 15, -- height of scratch window
				},
				icons = {
					logo = " ",
					user = " ",
					checkmark = " ",
					crossmark = " ",
					block = "■",
					file = " ",
					checks = {
						pending = " ",
						success = " ",
						failure = "",
						skipped = " ",
					},
					issue = {
						open = " ",
						completed = " ",
						other = " ",
					},
					pr = {
						open = " ",
						closed = " ",
						merged = " ",
						draft = " ",
						other = " ",
					},
					review = {
						approved = " ",
						changes_requested = " ",
						commented = " ",
						dismissed = " ",
						pending = " ",
					},
					merge_status = {
						clean = " ",
						dirty = " ",
						blocked = " ",
						unstable = " ",
					},
					reactions = {
						thumbs_up = "👍",
						thumbs_down = "👎",
						eyes = "👀",
						confused = "😕",
						heart = "❤️",
						hooray = "🎉",
						laugh = "😄",
						rocket = "🚀",
					},
				},
			},
			bigfile = { enabled = false },
			notifier = { enabled = false },
			quickfile = { enabled = false },
			statuscolumn = { enabled = false },
			---@class snacks.scroll.Config
			---@field animate snacks.animate.Config|{}
			---@field animate_repeat snacks.animate.Config|{}|{delay:number}
			scroll = {
				animate = {
					duration = { step = 10, total = 200 },
					easing = "linear",
				},
				-- faster animation when repeating scroll after delay
				animate_repeat = {
					delay = 100, -- delay in ms before using the repeat animation
					duration = { step = 5, total = 50 },
					easing = "linear",
				},
				-- what buffers to animate
				filter = function(buf)
					return vim.g.snacks_scroll ~= false
						and vim.b[buf].snacks_scroll ~= false
						and vim.bo[buf].buftype ~= "terminal"
				end,
			},
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				style = "up_down",
				easing = "linear",
				duration = {
					step = 20, -- ms per step
					total = 500, -- maximum duration
				},
			},
			image = {
				formats = {
					"png",
					"jpg",
					"jpeg",
					"gif",
					"bmp",
					"webp",
					"tiff",
					"heic",
					"avif",
					"mp4",
					"mov",
					"avi",
					"mkv",
					"webm",
				},
				force = false, -- try displaying the image, even if the terminal does not support it
				doc = {
					-- enable image viewer for documents
					-- a treesitter parser must be available for the enabled languages.
					-- supported language injections: markdown, html
					enabled = true,
					lang = { "markdown", "html", "norg" },
					-- render the image inline in the buffer
					-- if your env doesn't support unicode placeholders, this will be disabled
					-- takes precedence over `opts.float` on supported terminals
					inline = false,
					-- render the image in a floating window
					-- only used if `opts.inline` is disabled
					float = true,
					max_width = 80,
					max_height = 40,
				},
				-- window options applied to windows displaying image buffers
				-- an image buffer is a buffer with `filetype=image`
				wo = {
					wrap = false,
					number = false,
					relativenumber = false,
					cursorcolumn = false,
					signcolumn = "no",
					foldcolumn = "0",
					list = false,
					spell = false,
					statuscolumn = "",
				},
				env = {},
			},
			---@class snacks.dashboard.Config
			---@field sections snacks.dashboard.Section
			---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
			dashboard = {
				width = 40,
				row = nil, -- dashboard position. nil for center
				col = nil, -- dashboard position. nil for center
				pane_gap = 4, -- empty columns between vertical panes
				autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
				preset = {
					-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
					---@type fun(cmd:string, opts:table)|nil
					pick = nil,
					-- Used by the `keys` section to show keymaps.
					-- Set your curstom keymaps here.
					-- When using a function, the `items` argument are the default keymaps.
					---@type snacks.dashboard.Item[]
					keys = {},
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
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
]],
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
						enabled = false, -- displaySecondColumn,
						cmd = "chafa /Users/ahirdman/mars.png --format=symbols --symbols=vhalf --fit-width --align=center; sleep .1",
						height = 17,
						padding = 1,
					},
					{
						section = "header",
						padding = 1,
					},
					{
						align = "center",
						padding = 1,
						text = {
							{ " ", hl = "DashboardYellow" },
							{ " Lazy[l] ", hl = "SnacksDashboardTitle" },
							{ "年", hl = "DashboardOrange" },
							{ "Mason[m] ", hl = "SnacksDashboardTitle" },
							{ "", hl = "DashboardPink" },
							{ " Neogit[g] ", hl = "SnacksDashboardTitle" },
							{ "", hl = "DashboardPink" },
							{ " Github[G] ", hl = "SnacksDashboardTitle" },
							{ "", hl = "DashboardGreen" },
							{ " Files[f] ", hl = "SnacksDashboardTitle" },
							{ "", hl = "DashboardGit" },
							{ " Worktree[w] ", hl = "SnacksDashboardTitle" },
							{ "", hl = "DashboardOrange" },
							{ " Todos[t] ", hl = "SnacksDashboardTitle" },
							{ "", hl = "DashboardPink" },
							{ " Quit[q]", hl = "SnacksDashboardTitle" },
						},
					},
					{
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						padding = 1,
					},
					{
						text = "",
						action = function()
							Snacks.picker.gh_pr({ state = "open" })
						end,
						key = "G",
						padding = 0,
						gap = 0,
					},
					{ text = "", action = ":qa", key = "q", padding = 0, gap = 0 },
					{ text = "", action = ":Lazy", key = "l", padding = 0, gap = 0 },
					{ text = "", action = ":Mason", key = "m", padding = 0, gap = 0 },
					{ text = "", action = ":Neogit", key = "g", padding = 0, gap = 0 },
					{ text = "", action = ":Telescope find_files", key = "f", padding = 0, gap = 0 },
					{
						text = "",
						action = ":lua require('telescope').extensions.git_worktree.git_worktrees()",
						key = "w",
						padding = 0,
						gap = 0,
					},
					{ text = "", action = ":TodoTelescope", key = "t", padding = 0, gap = 0 },
				},
			},
			words = { enabled = false },
		})
	end,
}
