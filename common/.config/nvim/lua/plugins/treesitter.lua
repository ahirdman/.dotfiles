return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
			config = function()
				require("nvim-treesitter-textobjects").setup({
					select = { lookahead = true },
				})

				local keymaps = {
					aa = "@parameter.outer",
					ia = "@parameter.inner",
					af = "@function.outer",
					["if"] = "@function.inner",
					ac = "@class.outer",
					ic = "@class.inner",
				}
				for key, capture in pairs(keymaps) do
					vim.keymap.set({ "x", "o" }, key, function()
						require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects")
					end, { desc = "Select " .. capture })
				end
			end,
		},
	},
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({})

		local available = {}
		for _, lang in ipairs(treesitter.get_available()) do
			available[lang] = true
		end
		local can_install = vim.fn.executable("tree-sitter") == 1
		local requested = {}

		local function attach(buf)
			if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].filetype == "" then
				return
			end
			local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
			if not lang or not pcall(vim.treesitter.start, buf, lang) then
				return
			end
			if vim.treesitter.query.get(lang, "indents") then
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("Treesitter", { clear = true }),
			callback = function(event)
				attach(event.buf)
				local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
				if can_install and lang and available[lang] and not requested[lang] then
                    requested[lang] = true
					treesitter.install({ lang }):await(function(err, success)
						if not err and success then
							vim.schedule(function()
								attach(event.buf)
							end)
						end
					end)
				end
			end,
		})

		if can_install then
			treesitter.install({
				"go",
				"lua",
				"rust",
				"tsx",
				"javascript",
				"typescript",
				"vim",
				"bash",
				"markdown",
				"markdown_inline",
				"regex",
			})
		else
			vim.schedule(function()
				vim.notify("Tree-sitter parser installation requires tree-sitter CLI: brew install tree-sitter-cli", vim.log.levels.WARN)
			end)
		end
	end,
}
