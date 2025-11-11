local M = {}

function M.load()
	local c = {
		-- Base colors
		background = "#0C0A09", -- oklch(0.1448 0 0)
		foreground = "#ebdbb2", -- oklch(0.9851 0 0)

		-- Surface levels
		card = "#363636", -- oklch(0.2134 0 0) - elevated surface
		popover = "#444444", -- oklch(0.2686 0 0) - floating elements
		sidebar = "#343434", -- oklch(0.2046 0 0) - sidebar background

		-- Interactive & emphasis
		primary = "#8e8e8e", -- oklch(0.5555 0 0) - primary actions
		accent = "#5f5f5f", -- oklch(0.3715 0 0) - accented elements
		muted = "#444444", -- oklch(0.2686 0 0) - muted backgrounds

		-- Text & foreground variants
		mutedForeground = "#b5b5b5", -- oklch(0.709 0 0) - muted text
		primaryForeground = "#fbfbfb", -- oklch(0.9851 0 0) - text on primary

		-- Borders & inputs
		border = "#575757", -- oklch(0.3407 0 0)
		input = "#707070", -- oklch(0.4386 0 0)
		ring = "#8e8e8e", -- oklch(0.5555 0 0) - focus rings

		-- Status colors
		destructive = "#ea6962", -- oklch(0.7022 0.1892 22.2279) - errors, red
		destructiveShadow = "#2a1616",
		warning = "#d8a657", -- warnings, yellow
		warningShadow = "#2a2416",
	}

	local O = {
		-- ========================================
		-- NEOVIM UI
		-- ========================================
		Normal = { fg = c.foreground, bg = c.background },
		NormalNC = { fg = c.foreground, bg = c.background },
		NormalFloat = { bg = c.card },
		FloatBorder = { fg = c.mutedForeground },
		SignColumn = { bg = c.background },
		EndOfBuffer = { fg = c.background, bg = c.background },
		ColorColumn = { bg = c.card },
		LineNr = { fg = c.border },
		CursorLineNr = { fg = c.mutedForeground, style = { "bold" } },
		CursorLine = { bg = c.card },
		VertSplit = { fg = c.border, bg = c.background },
		Pmenu = { bg = c.card, fg = c.mutedForeground },
		PmenuSel = { bg = c.accent, fg = c.foreground, style = { "bold" } },
		PmenuSbar = { bg = c.popover },
		PmenuThumb = { bg = c.border },
		YankHighlight = { bg = c.accent },
		Visual = { bg = c.accent },
		IncSearch = { bg = c.input, fg = c.foreground, style = { "bold" } },
		Search = { bg = c.accent, fg = c.foreground },
		StatusLine = { fg = c.mutedForeground, bg = c.popover },
		StatusLineNC = { fg = c.input, bg = c.card },
		TabLine = { fg = c.mutedForeground, bg = c.card },
		TabLineFill = { bg = c.card },
		TabLineSel = { fg = c.foreground, bg = c.border, style = { "bold" } },

		-- ========================================
		-- DIFF & GIT
		-- ========================================
		Added = { fg = c.mutedForeground },
		DiffAdd = { bg = c.popover, fg = c.mutedForeground },
		DiffDelete = { bg = c.destructiveShadow, fg = c.input },
		DiffChange = { bg = c.warningShadow },
		DiffText = { bg = c.border, fg = c.foreground },
		GitSignsAdd = { fg = c.primary },
		GitSignsChange = { fg = c.mutedForeground },
		GitSignsDelete = { fg = c.input },

		-- ========================================
		-- DIAGNOSTICS
		-- ========================================
		DiagnosticError = { fg = c.destructive, bg = c.destructiveShadow },
		DiagnosticUnderlineError = { sp = c.destructive, style = { "undercurl" } },
		DiagnosticVirtualLinesError = { fg = c.destructive },
		DiagnosticFloatingError = { fg = c.destructive },
		DiagnosticSignError = { fg = c.destructive },

		DiagnosticWarn = { fg = c.warning, bg = c.warningShadow },
		DiagnosticUnderlineWarn = { sp = c.warning, style = { "undercurl" } },
		DiagnosticSignWarn = { fg = c.warning },

		DiagnosticInfo = { fg = c.primary },
		DiagnosticUnderlineInfo = { sp = c.mutedForeground, style = { "undercurl" } },
		DiagnosticSignInfo = { fg = c.mutedForeground },

		DiagnosticHint = { fg = c.mutedForeground },
		DiagnosticUnderlineHint = { sp = c.input, style = { "undercurl" } },
		DiagnosticSignHint = { fg = c.input },

		DiagnosticDeprecated = { fg = c.input, style = { "strikethrough" } },
		DiagnosticUnnecessary = { fg = c.input },

		-- ========================================
		-- PLUGIN: Telescope
		-- ========================================
		TelescopePreviewBorder = { fg = c.border },
		TelescopePreviewNormal = { bg = c.background },
		TelescopePromptBorder = { fg = c.border },
		TelescopePromptNormal = { bg = c.background },
		TelescopePromptPrefix = { fg = c.mutedForeground, bg = c.background },
		TelescopePromptTitle = { fg = c.foreground, bg = c.background },
		TelescopeResultsBorder = { fg = c.border },
		TelescopeResultsNormal = { bg = c.background },
		TelescopeResultsTitle = { fg = c.mutedForeground },
		TelescopeSelection = { bg = c.border },

		-- ========================================
		-- PLUGIN: NeoTree
		-- ========================================
		NeoTreeDirectoryIcon = { fg = c.primary },
		NeoTreeDirectoryName = { fg = c.primary },
		NeoTreeFloatBorder = { fg = c.border },
		NeoTreeGitConflict = { fg = c.destructive },
		NeoTreeGitDeleted = { fg = c.input },
		NeoTreeGitIgnored = { fg = c.border },
		NeoTreeGitModified = { fg = c.primary },
		NeoTreeGitStaged = { fg = c.mutedForeground },
		NeoTreeGitUnstaged = { fg = c.mutedForeground },
		NeoTreeGitUntracked = { fg = c.primary },
		NeoTreeIndent = { fg = c.border },
		NeoTreeNormal = { bg = c.background },
		NeoTreeNormalNC = { bg = c.background },
		NeoTreeRootName = { fg = c.mutedForeground, style = { "bold" } },
		NeoTreeTabActive = { fg = c.foreground, bg = c.popover },
		NeoTreeTabInactive = { fg = c.input, bg = c.card },
		NeoTreeTabSeparatorActive = { fg = c.popover, bg = c.popover },
		NeoTreeTabSeparatorInactive = { fg = c.card, bg = c.card },
		NeoTreeWinSeparator = { fg = c.background, bg = c.background },

		-- ========================================
		-- PLUGIN: Dashboard
		-- ========================================
		DashboardHeader = { fg = c.foreground },
		DashboardFiles = { fg = c.mutedForeground },
		DashboardShortCutIcon = { fg = c.primary },
		DashboardMruTitle = { fg = c.foreground },
		DashboardGit = { fg = c.mutedForeground },
		DashboardOrange = { fg = c.primary },
		DashboardYellow = { fg = c.mutedForeground },
		DashboardGreen = { fg = c.primary },
		DashboardPink = { fg = c.mutedForeground },
		DashboardTodo = { fg = c.primary },
		SnacksDashboardHeader = { fg = c.foreground },
		SnacksDashboardNormal = { fg = c.mutedForeground },
		SnacksDashboardTitle = { fg = c.foreground },

		-- ========================================
		-- PLUGIN: Flash
		-- ========================================
		FlashMatch = { fg = c.mutedForeground, bg = c.popover },
		FlashCurrent = { fg = c.foreground, style = { "bold" } },
		FlashLabel = { fg = c.background, bg = c.foreground, style = { "bold" } },

		-- ========================================
		-- PLUGIN: Neogit
		-- ========================================
		NeogitSectionHeader = { fg = c.foreground, style = { "bold" } },
		NeogitUnstagedchanges = { fg = c.primary },
		NeogitStagedchanges = { fg = c.mutedForeground },
		NeogitChangeModified = { fg = c.primary },
		NeogitHunkHeaderCursor = { fg = c.primary, bg = c.popover },

		-- ========================================
		-- PLUGIN: Lualine
		-- ========================================
		lualine_b_diff_removed = { fg = c.mutedForeground },
		lualine_b_diff_removed_normal = { fg = c.mutedForeground },
		lualine_b_diff_removed_insert = { fg = c.mutedForeground },
		lualine_b_diff_removed_terminal = { fg = c.mutedForeground },

		-- ========================================
		-- PLUGIN: Noice
		-- ========================================
		NoiceCmdlineIcon = { fg = c.mutedForeground },
		NoiceCmdlinePopupBorder = { fg = c.mutedForeground },
		NoiceCmdlinePopupTitleCmdline = { fg = c.foreground },
		NoiceCmdlinePopupBorderSearch = { fg = c.mutedForeground },
		NoiceCmdlinePopupTitleSearch = { fg = c.foreground },
		NoiceCmdlineIconSearch = { fg = c.mutedForeground },

		-- ========================================
		-- PLUGIN: Notify
		-- ========================================
		NotifyERRORBorder = { fg = c.destructive },
		NotifyERRORTitle = { fg = c.destructive },
		NotifyERRORIcon = { fg = c.destructive },
		NotifyERRORBody = { fg = c.destructive },
		NotifyWARNBorder = { fg = c.warning },
		NotifyWARNTitle = { fg = c.warning },
		NotifyWARNIcon = { fg = c.warning },
		NotifyWARNBody = { fg = c.warning },
		NotifyDEBUGBorder = { fg = c.mutedForeground },
		NotifyDEBUGTitle = { fg = c.mutedForeground },
		NotifyDEBUGIcon = { fg = c.mutedForeground },
		NotifyDEBUGBody = { fg = c.mutedForeground },
		NotifyINFOBorder = { fg = c.primary },
		NotifyINFOTitle = { fg = c.primary },
		NotifyINFOIcon = { fg = c.primary },
		NotifyINFOBody = { fg = c.primary },
		NotifyTRACEBorder = { fg = c.mutedForeground },
		NotifyTRACETitle = { fg = c.mutedForeground },
		NotifyTRACEIcon = { fg = c.mutedForeground },
		NotifyTRACEBody = { fg = c.mutedForeground },
		NotifyBackground = { bg = c.background },

		-- ========================================
		-- PLUGIN: WhichKey
		-- ========================================
		WhichKeyFloat = { bg = c.card },

		-- ========================================
		-- PLUGIN: Indent Blankline
		-- ========================================
		IblIndent = { fg = c.border },
		IblScope = { fg = c.border },

		-- ========================================
		-- PLUGIN: Fidget
		-- ========================================
		FidgetTask = { fg = c.primary },
		FidgetTitle = { fg = c.mutedForeground },

		-- ========================================
		-- PLUGIN: LSP Info
		-- ========================================
		LspInfoBorder = { fg = c.mutedForeground, bg = c.background },

		-- ========================================
		-- PLUGIN: CMP
		-- ========================================
		CmpItemMenu = { fg = c.input },

		-- ========================================
		-- PLUGIN: RenderMarkdown
		-- ========================================
		RenderMarkdown_RenderMarkdownCodeBorder_bg_as_fg = { fg = c.mutedForeground, bg = c.mutedForeground },

		-- ========================================
		-- SYNTAX: Comments
		-- ========================================
		Comment = { fg = c.input, style = { "italic" } },
		["@comment"] = { link = "Comment" },
		["@conceal"] = { link = "Comment" },
		["@lsp.type.comment"] = { link = "@comment" },

		-- ========================================
		-- SYNTAX: Functions & Methods
		-- ========================================
		Function = { fg = c.foreground, style = { "bold" } },
		["@function"] = { fg = c.foreground },
		["@function.builtin"] = { fg = c.foreground },
		["@function.call"] = { fg = c.foreground },
		["@function.macro"] = { fg = c.foreground },
		["@method"] = { fg = c.foreground },
		["@method.call"] = { fg = c.foreground },
		["@constructor"] = { fg = c.foreground },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.decorator"] = { link = "@function" },

		-- ========================================
		-- SYNTAX: Keywords & Control Flow
		-- ========================================
		Keyword = { fg = c.mutedForeground, style = { "italic" } },
		Conditional = { fg = c.mutedForeground, style = { "italic" } },
		Repeat = { fg = c.mutedForeground, style = { "italic" } },
		Statement = { fg = c.mutedForeground },
		Exception = { fg = c.mutedForeground, style = { "italic" } },
		["@keyword"] = { fg = c.mutedForeground, style = { "italic" } },
		["@keyword.function"] = { fg = c.mutedForeground, style = { "italic" } },
		["@keyword.return"] = { fg = c.mutedForeground, style = { "italic" } },
		["@conditional"] = { fg = c.mutedForeground, style = { "italic" } },
		["@repeat"] = { fg = c.mutedForeground, style = { "italic" } },
		["@exception"] = { fg = c.mutedForeground, style = { "italic" } },
		["@lsp.type.keyword"] = { link = "@keyword" },

		-- ========================================
		-- SYNTAX: Operators & Punctuation
		-- ========================================
		Operator = { fg = c.mutedForeground },
		Delimiter = { fg = c.primary },
		["@operator"] = { fg = c.mutedForeground },
		["@keyword.operator"] = { fg = c.mutedForeground },
		["@punctuation.bracket"] = { fg = c.primary },
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.special"] = { fg = c.primary },
		["@lsp.type.operator"] = { link = "@operator" },

		-- ========================================
		-- SYNTAX: Types & Structures
		-- ========================================
		Type = { fg = c.foreground, style = { "bold" } },
		Typedef = { fg = c.mutedForeground },
		Structure = { fg = c.mutedForeground },
		StorageClass = { fg = c.mutedForeground },
		["@type"] = { fg = c.foreground, style = { "bold" } },
		["@type.builtin"] = { fg = c.foreground, style = { "bold" } },
		["@type.definition"] = { fg = c.foreground, style = { "bold" } },
		["@type.qualifier"] = { fg = c.mutedForeground, style = { "bold" } },
		["@storageclass"] = { fg = c.mutedForeground },
		["@storageclass.lifetime"] = { fg = c.mutedForeground },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.typeParameter"] = { link = "@type.definition" },
		["@lsp.type.modifier"] = { link = "@type.qualifier" },

		-- ========================================
		-- SYNTAX: Variables, Constants & Parameters
		-- ========================================
		["@variable"] = { fg = c.mutedForeground },
		["@variable.builtin"] = { fg = c.primary },
		["@constant"] = { fg = c.mutedForeground },
		["@constant.builtin"] = { fg = c.primary },
		["@constant.macro"] = { fg = c.primary },
		["@parameter"] = { fg = c.mutedForeground },
		["@parameter.reference"] = { fg = c.mutedForeground },
		["@lsp.type.variable"] = { link = "@variable" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.macro"] = { link = "@constant.macro" },

		-- ========================================
		-- SYNTAX: Strings, Numbers & Booleans
		-- ========================================
		Number = { fg = c.primary },
		Float = { fg = c.primary },
		Boolean = { fg = c.primary },
		String = { fg = c.primary },
		["@string"] = { fg = c.primary },
		["@string.escape"] = { fg = c.mutedForeground },
		["@string.regex"] = { fg = c.mutedForeground },
		["@string.special"] = { link = "SpecialChar" },
		["@character"] = { fg = c.primary },
		["@character.special"] = { link = "SpecialChar" },
		["@number"] = { fg = c.primary },
		["@float"] = { fg = c.primary },
		["@boolean"] = { fg = c.primary },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.regexp"] = { link = "@string.regex" },

		-- ========================================
		-- SYNTAX: Properties & Fields
		-- ========================================
		["@property"] = { fg = c.mutedForeground },
		["@field"] = { fg = c.mutedForeground },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.enumMember"] = { link = "@property" },

		-- ========================================
		-- SYNTAX: Preprocessor & Macros
		-- ========================================
		PreProc = { fg = c.primary },
		PreCondit = { fg = c.primary },
		Include = { fg = c.mutedForeground },
		Define = { fg = c.primary },
		Macro = { fg = c.primary },
		["@preproc"] = { link = "PreProc" },
		["@include"] = { fg = c.mutedForeground },
		["@define"] = { link = "Define" },

		-- ========================================
		-- SYNTAX: Tags, Labels & Attributes
		-- ========================================
		Tag = { fg = c.mutedForeground },
		Label = { fg = c.mutedForeground },
		Title = { fg = c.foreground, style = { "bold" } },
		["@tag"] = { fg = c.mutedForeground },
		["@tag.attribute"] = { fg = c.primary },
		["@tag.delimiter"] = { fg = c.primary },
		["@label"] = { fg = c.mutedForeground },
		["@attribute"] = { fg = c.primary },
		["@annotation"] = { fg = c.primary },
		["@namespace"] = { fg = c.mutedForeground },
		["@lsp.type.events"] = { link = "@label" },
		["@lsp.type.namespace"] = { link = "@namespace" },

		-- ========================================
		-- SYNTAX: Special & Misc
		-- ========================================
		Special = { fg = c.mutedForeground },
		SpecialChar = { fg = c.mutedForeground },
		Error = { fg = c.destructive },
		Ignore = { fg = c.input },
		Todo = { fg = c.foreground, bg = c.accent, style = { "bold" } },
		["@error"] = { link = "Error" },
		["@none"] = { fg = c.mutedForeground },
		["@symbol"] = { fg = c.mutedForeground },
		["@debug"] = { fg = c.mutedForeground },
		["@math"] = { fg = c.mutedForeground },
		["@strike"] = { fg = c.input, style = { "strikethrough" } },

		-- ========================================
		-- SYNTAX: Text & Markup
		-- ========================================
		["@text"] = { fg = c.mutedForeground },
		["@text.danger"] = { fg = c.destructive, style = { "bold" } },
		["@text.warning"] = { fg = c.warning },
		["@text.note"] = { fg = c.primary },
		["@text.todo"] = { link = "Todo" },
		["@text.todo.checked"] = { fg = c.primary },
		["@text.todo.unchecked"] = { link = "Ignore" },
		["@text.diff.add"] = { link = "DiffAdd" },
		["@text.diff.delete"] = { link = "DiffDelete" },
		["@text.emphasis"] = { fg = c.mutedForeground, style = { "italic" } },
		["@text.strong"] = { fg = c.foreground, style = { "bold" } },
		["@text.underline"] = { fg = c.mutedForeground, style = { "underline" } },
		["@text.strike"] = { fg = c.input, style = { "strikethrough" } },
		["@text.title"] = { link = "Title" },
		["@text.literal"] = { link = "String" },
		["@text.uri"] = { fg = c.primary, style = { "underline" } },
		["@text.math"] = { fg = c.mutedForeground },
		["@text.reference"] = { link = "Constant" },
		["@text.environment"] = { link = "Macro" },
		["@text.environment.name"] = { link = "Type" },
		["@todo"] = { link = "Todo" },
		["@uri"] = { fg = c.primary, style = { "underline" } },
	}

	-- === Apply =======================================
	local function flags(style_list)
		local t = {}
		if not style_list then
			return t
		end
		for _, s in ipairs(style_list) do
			if s == "bold" then
				t.bold = true
			elseif s == "italic" then
				t.italic = true
			elseif s == "underline" then
				t.underline = true
			elseif s == "undercurl" then
				t.undercurl = true
			elseif s == "strikethrough" then
				t.strikethrough = true
			elseif s == "reverse" then
				t.reverse = true
			end
		end
		return t
	end

	local function hi(name, spec)
		if spec.link then
			vim.api.nvim_set_hl(0, name, { link = spec.link, default = false })
			return
		end
		local o = {}
		if spec.fg then
			o.fg = spec.fg
		end
		if spec.bg then
			o.bg = spec.bg
		end
		if spec.sp then
			o.sp = spec.sp
		end
		local st = flags(spec.style)
		for k, v in pairs(st) do
			o[k] = v
		end
		vim.api.nvim_set_hl(0, name, o)
	end

	local keys = {}

	for k in pairs(O) do
		table.insert(keys, k)
	end

	table.sort(keys, function(a, b)
		return tostring(a) < tostring(b)
	end)

	-- 1) concrete (non-links)
	for _, k in ipairs(keys) do
		if not O[k].link then
			hi(k, O[k])
		end
	end
	-- 2) links
	for _, k in ipairs(keys) do
		if O[k].link then
			hi(k, O[k])
		end
	end
end

return M
