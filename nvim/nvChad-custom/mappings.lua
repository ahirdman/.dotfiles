---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		-- TMUX

		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },

		-- Trouble

		["<leader>xx"] = { "<cmd>TroubleToggle<cr>, toggle trouble" },
		["<leader>xd"] = { "<cmd>TroubleToggle<cr>, trouble diagnostics" },
		["<leader>xq"] = { "<cmd>TroubleToggle<cr>, trouble quickfix" },

		-- Undo Tree

		["<leader>u"] = { "<cmd>UndotreeToggle<cr>, undo tree toggle" },

    -- Lsp Saga

    ["gh"] = { "<cmd>Lspsaga finder<CR>", "lsp finder" },
    ["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
    ["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "peek type definition" },

    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "lsp saga outline" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" }
	},
	v = {
		["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
		["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
	},
}

return M
