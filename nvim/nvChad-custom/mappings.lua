---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		-- Tabbuffline
		["<leader>xa"] = {
			function()
				require("nvchad.tabufline").closeAllBufs()
			end,
			"Close all buffers",
		},

		-- TMUX

		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },

		-- Trouble

		["<leader>tr"] = { "<cmd>TroubleToggle<cr>", "toggle trouble" },
		["<leader>td"] = { "<cmd>TroubleToggle<cr>", "trouble diagnostics" },
		["<leader>tq"] = { "<cmd>TroubleToggle<cr>", "trouble quickfix" },

		-- Todo

		["<leader>to"] = { "<cmd>TodoTelescope<cr>", "open todos in telescope" },

		-- Undo Tree

		["<leader>u"] = { "<cmd>UndotreeToggle<cr>", "UndoTree toggle" },

		-- Lsp Saga

		["gh"] = { "<cmd>Lspsaga finder<CR>", "lsp finder" },
		["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
		["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "peek type definition" },

		["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "lsp saga outline" },
		["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },

    -- Telescope

    ["<leader>gs"] = { "<cmd> Telescope git_stash <CR>", "Git stash" },

    -- Dap UI

    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "Toggle breakpoint"},
    ["<leader>dc"] = { "<cmd>DapContinue<CR>", "Dap continue"},
    ["<leader>dt"] = { "<cmd>:lua require('dapui').toggle()<CR>", "Toggle Dap-UI"}

	},
	v = {
		["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
		["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
	},
}

return M
