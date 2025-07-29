local M = {}

function M.load()
	local c = {
		rosewater = "#ea6962",
		flamingo = "#ea6962",
		red = "#ea6962",
		maroon = "#ea6962",
		pink = "#d3869b",
		mauve = "#d3869b",
		peach = "#e78a4e",
		yellow = "#d8a657",
		green = "#a9b665",
		teal = "#89b482",
		sky = "#89b482",
		sapphire = "#89b482",
		blue = "#7daea3",
		lavender = "#7daea3",
		text = "#ebdbb2",
		subtext1 = "#d5c4a1",
		subtext0 = "#bdae93",
		overlay2 = "#a89984",
		overlay1 = "#928374",
		overlay0 = "#595959",
		surface2 = "#4d4d4d",
		surface1 = "#404040",
		surface0 = "#292929",
		base = "#121212",
		mantle = "#0C0A09",
		crust = "#141617",
		background = "#121212",
		gray_dbg = "#8B8B8B",
	}

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

	local O = {
		CmpItemMenu = { fg = c.surface2 },

		CursorLineNr = { fg = c.text },

		FloatBorder = { fg = c.text },

		GitSignsChange = { fg = c.peach },
		GitSignsAdd = { fg = c.green },

		LineNr = { fg = c.overlay0 },

		LspInfoBorder = { fg = c.text, bg = c.base },

		DashboardGit = { fg = c.red },
		DashboardOrange = { fg = c.peach },
		DashboardYellow = { fg = c.yellow },
		DashboardGreen = { fg = c.green },
		DashboardPink = { fg = c.pink },
		DashboardTodo = { fg = c.teal },

		SnacksDashboardHeader = { fg = c.text },
		SnacksDashboardNormal = { fg = c.text },
		SnacksDashboardTitle = { fg = c.text },

		DashboardHeader = { fg = c.text },
		DashboardFiles = { fg = c.text },
		DashboardShortCutIcon = { fg = c.yellow },
		DashboardMruTitle = { fg = c.peach },

		FlashMatch = { fg = c.text, bg = c.crust },
		FlashCurrent = { fg = c.red },
		-- FlashBackdrop = { bg = c.overlay0 },
		FlashLabel = { fg = c.base, bg = c.text },

		NeogitSectionHeader = { fg = c.peach },
		NeogitUnstagedchanges = { fg = c.red },
		NeogitStagedchanges = { fg = c.green },
		NeogitChangeModified = { fg = c.peach },

		NeoTreeDirectoryIcon = { fg = c.subtext1 },
		NeoTreeDirectoryName = { fg = c.subtext1 },
		NeoTreeFloatBorder = { fg = c.overlay0 },
		NeoTreeGitConflict = { fg = c.red },
		NeoTreeGitDeleted = { fg = c.red },
		NeoTreeGitIgnored = { fg = c.overlay0 },
		NeoTreeGitModified = { fg = c.peach },
		NeoTreeGitStaged = { fg = c.green },
		NeoTreeGitUnstaged = { fg = c.red },
		NeoTreeGitUntracked = { fg = c.green },
		NeoTreeIndent = { fg = c.surface1 },
		NeoTreeNormal = { bg = c.base },
		NeoTreeNormalNC = { bg = c.base },
		NeoTreeRootName = { fg = c.subtext1, style = { "bold" } },
		NeoTreeTabActive = { fg = c.text, bg = c.mantle },
		NeoTreeTabInactive = { fg = c.surface2, bg = c.crust },
		NeoTreeTabSeparatorActive = { fg = c.mantle, bg = c.mantle },
		NeoTreeTabSeparatorInactive = { fg = c.crust, bg = c.crust },
		NeoTreeWinSeparator = { fg = c.base, bg = c.base },

    lualine_b_diff_removed = { fg = c.red },
    lualine_b_diff_removed_normal = { fg = c.red },
    lualine_b_diff_removed_insert = { fg = c.red },
    lualine_b_diff_removed_terminal = { fg = c.red },

		Normal = { fg = c.text, bg = c.base },
		NormalNC = { fg = c.text, bg = c.base },
		NormalFloat = { bg = c.base },
		SignColumn = { bg = c.base },
		EndOfBuffer = { fg = c.base, bg = c.base }, -- or fg="NONE" to hide tildes

		Pmenu = { bg = c.mantle },
		PmenuSel = { bg = c.peach, fg = c.base },

		TelescopePreviewBorder = { fg = c.text },
		TelescopePreviewNormal = { bg = c.base },
		-- TelescopePreviewTitle = { fg = c.crust, bg = c.mantle },
		TelescopePromptBorder = { fg = c.text },
		-- TelescopePromptCounter = { fg = c.mauve, style = { "bold" } },
		TelescopePromptNormal = { bg = c.base },
		TelescopePromptPrefix = { fg = c.peach, bg = c.base },
		TelescopePromptTitle = { fg = c.peach, bg = c.base },
		TelescopeResultsBorder = { fg = c.text },
		TelescopeResultsNormal = { bg = c.base },
		TelescopeResultsTitle = { fg = c.text },
		-- TelescopeSelection    = { bg = c.surface0 },

		VertSplit = { fg = c.surface0, bg = c.base },

		WhichKeyFloat = { bg = c.mantle },

		YankHighlight = { bg = c.surface2 },
		FidgetTask = { fg = c.subtext1 },
		FidgetTitle = { fg = c.peach },

		IblIndent = { fg = c.surface0 },
		IblScope = { fg = c.overlay0 },

		Boolean = { fg = c.mauve },
		Number = { fg = c.mauve },
		Float = { fg = c.mauve },

    Comment = { fg = c.overlay0, style = { "italic" } },
		PreProc = { fg = c.mauve },
		PreCondit = { fg = c.mauve },
		Include = { fg = c.mauve },
		Define = { fg = c.mauve },
		Conditional = { fg = c.red },
		Repeat = { fg = c.red },
		Keyword = { fg = c.red },
		Typedef = { fg = c.red },
		Exception = { fg = c.red },
		Statement = { fg = c.red },
		Error = { fg = c.red },
		StorageClass = { fg = c.peach },
		Tag = { fg = c.peach },
		Label = { fg = c.peach },
		Structure = { fg = c.peach },
		Operator = { fg = c.peach },
		Title = { fg = c.peach },
		Special = { fg = c.yellow },
		SpecialChar = { fg = c.yellow },
		Type = { fg = c.yellow, style = { "bold" } },
		Function = { fg = c.green, style = { "bold" } },
		Delimiter = { fg = c.subtext1 },
		Ignore = { fg = c.subtext1 },
		Macro = { fg = c.teal },

    DiagnosticError = { fg = c.red },
    DiagnosticUnderlineError = { fg = c.red, style = { "underline" } },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.teal },

		NotifyERRORBorder = { fg = c.red },
		NotifyERRORTitle = { fg = c.red },
		NotifyERRORIcon = { fg = c.red },
		NotifyERRORBody = { fg = c.red },

		NotifyWARNBorder = { fg = c.yellow },
		NotifyWARNTitle = { fg = c.yellow },
		NotifyWARNIcon = { fg = c.yellow },
		NotifyWARNBody = { fg = c.yellow },

		NotifyDEBUGBorder = { fg = c.gray_dbg },
		NotifyDEBUGTitle = { fg = c.gray_dbg },
		NotifyDEBUGIcon = { fg = c.gray_dbg },
		NotifyDEBUGBody = { fg = c.gray_dbg },

		NotifyINFOBorder = { fg = c.teal },
		NotifyINFOTitle = { fg = c.teal },
		NotifyINFOIcon = { fg = c.teal },
		NotifyINFOBody = { fg = c.teal },

		NotifyTRACEBorder = { fg = c.pink },
		NotifyTRACETitle = { fg = c.pink },
		NotifyTRACEIcon = { fg = c.pink },
		NotifyTRACEBody = { fg = c.pink },

		-- Legacy TS* groups
		TSAnnotation = { fg = c.mauve },
		TSAttribute = { fg = c.mauve },
		TSBoolean = { fg = c.mauve },
		TSCharacter = { fg = c.teal },
		TSCharacterSpecial = { link = "SpecialChar" },
		TSComment = { link = "Comment" },
		TSConditional = { fg = c.red },
		TSConstBuiltin = { fg = c.mauve },
		TSConstMacro = { fg = c.mauve },
		TSConstant = { fg = c.text },
		TSConstructor = { fg = c.green },
		TSDebug = { link = "Debug" },
		TSDefine = { link = "Define" },
		TSEnvironment = { link = "Macro" },
		TSEnvironmentName = { link = "Type" },
		TSError = { link = "Error" },
		TSException = { fg = c.red },
		TSField = { fg = c.blue },
		TSFloat = { fg = c.mauve },
		TSFuncBuiltin = { fg = c.green },
		TSFuncMacro = { fg = c.green },
		TSFunction = { fg = c.green },
		TSFunctionCall = { fg = c.green },
		TSInclude = { fg = c.red },
		TSKeyword = { fg = c.red },
		TSKeywordFunction = { fg = c.red },
		TSKeywordOperator = { fg = c.peach },
		TSKeywordReturn = { fg = c.red },
		TSLabel = { fg = c.peach },
		TSLiteral = { link = "String" },
		TSMath = { fg = c.blue },
		TSMethod = { fg = c.green },
		TSMethodCall = { fg = c.green },
		TSNamespace = { fg = c.yellow },
		TSNone = { fg = c.text },
		TSNumber = { fg = c.mauve },
		TSOperator = { fg = c.peach },
		TSParameter = { fg = c.text },
		TSParameterReference = { fg = c.text },
		TSPreProc = { link = "PreProc" },
		TSProperty = { fg = c.blue },
		TSPunctBracket = { fg = c.text },
		TSPunctDelimiter = { link = "Delimiter" },
		TSPunctSpecial = { fg = c.blue },
		TSRepeat = { fg = c.red },
		TSStorageClass = { fg = c.peach },
		TSStorageClassLifetime = { fg = c.peach },
		TSStrike = { fg = c.subtext1 },
		TSString = { fg = c.teal },
		TSStringEscape = { fg = c.green },
		TSStringRegex = { fg = c.green },
		TSStringSpecial = { link = "SpecialChar" },
		TSSymbol = { fg = c.text },
		TSTag = { fg = c.peach },
		TSTagAttribute = { fg = c.green },
		TSTagDelimiter = { fg = c.green },
		TSText = { fg = c.green },
		TSTextReference = { link = "Constant" },
		TSTitle = { link = "Title" },
		TSTodo = { link = "Todo" },
		TSType = { fg = c.yellow, style = { "bold" } },
		TSTypeBuiltin = { fg = c.yellow, style = { "bold" } },
		TSTypeDefinition = { fg = c.yellow, style = { "bold" } },
		TSTypeQualifier = { fg = c.peach, style = { "bold" } },
		TSURI = { fg = c.blue },
		TSVariable = { fg = c.text },
		TSVariableBuiltin = { fg = c.mauve },

		-- Extra TS groups used by @text.* links
		TSDanger = { fg = c.red, style = { "bold" } },
		TSEmphasis = { fg = c.text, style = { "italic" } },
		TSStrong = { fg = c.text, style = { "bold" } },
		TSUnderline = { fg = c.text, style = { "underline" } },
		TSNote = { fg = c.blue },
		TSWarning = { fg = c.yellow },

		-- Modern @captures
		["@annotation"] = { link = "TSAnnotation" },
		["@attribute"] = { link = "TSAttribute" },
		["@boolean"] = { link = "TSBoolean" },
		["@character"] = { link = "TSCharacter" },
		["@character.special"] = { link = "TSCharacterSpecial" },
		["@comment"] = { link = "TSComment" },
		["@conceal"] = { link = "TSComment" },
		["@conditional"] = { link = "TSConditional" },
		["@constant"] = { link = "TSConstant" },
		["@constant.builtin"] = { link = "TSConstBuiltin" },
		["@constant.macro"] = { link = "TSConstMacro" },
		["@constructor"] = { link = "TSConstructor" },
		["@debug"] = { link = "TSDebug" },
		["@define"] = { link = "TSDefine" },
		["@error"] = { link = "TSError" },
		["@exception"] = { link = "TSException" },
		["@field"] = { link = "TSField" },
		["@float"] = { link = "TSFloat" },
		["@function"] = { link = "TSFunction" },
		["@function.builtin"] = { link = "TSFuncBuiltin" },
		["@function.call"] = { link = "TSFunctionCall" },
		["@function.macro"] = { link = "TSFuncMacro" },
		["@include"] = { link = "TSInclude" },
		["@keyword"] = { link = "TSKeyword" },
		["@keyword.function"] = { link = "TSKeywordFunction" },
		["@keyword.operator"] = { link = "TSKeywordOperator" },
		["@keyword.return"] = { link = "TSKeywordReturn" },
		["@label"] = { link = "TSLabel" },
		["@math"] = { link = "TSMath" },
		["@method"] = { link = "TSMethod" },
		["@method.call"] = { link = "TSMethodCall" },
		["@namespace"] = { link = "TSNamespace" },
		["@none"] = { link = "TSNone" },
		["@number"] = { link = "TSNumber" },
		["@operator"] = { link = "TSOperator" },
		["@parameter"] = { link = "TSParameter" },
		["@parameter.reference"] = { link = "TSParameterReference" },
		["@preproc"] = { link = "TSPreProc" },
		["@property"] = { link = "TSProperty" },
		["@punctuation.bracket"] = { link = "TSPunctBracket" },
		["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
		["@punctuation.special"] = { link = "TSPunctSpecial" },
		["@repeat"] = { link = "TSRepeat" },
		["@storageclass"] = { link = "TSStorageClass" },
		["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
		["@strike"] = { link = "TSStrike" },
		["@string"] = { link = "TSString" },
		["@string.escape"] = { link = "TSStringEscape" },
		["@string.regex"] = { link = "TSStringRegex" },
		["@string.special"] = { link = "TSStringSpecial" },
		["@symbol"] = { link = "TSSymbol" },
		["@tag"] = { link = "TSTag" },
		["@tag.attribute"] = { link = "TSTagAttribute" },
		["@tag.delimiter"] = { link = "TSTagDelimiter" },
		["@text"] = { link = "TSText" },
		["@text.danger"] = { link = "TSDanger" },
		["@text.diff.add"] = { link = "DiffAdd" }, -- fixed
		["@text.diff.delete"] = { link = "DiffDelete" }, -- fixed
		["@text.emphasis"] = { link = "TSEmphasis" },
		["@text.environment"] = { link = "TSEnvironment" },
		["@text.environment.name"] = { link = "TSEnvironmentName" },
		["@text.literal"] = { link = "TSLiteral" },
		["@text.math"] = { link = "TSMath" },
		["@text.note"] = { link = "TSNote" },
		["@text.reference"] = { link = "TSTextReference" },
		["@text.strike"] = { link = "TSStrike" },
		["@text.strong"] = { link = "TSStrong" },
		["@text.title"] = { link = "TSTitle" },
		["@text.todo"] = { link = "TSTodo" },
		["@text.todo.checked"] = { link = "TSFunction" },
		["@text.todo.unchecked"] = { link = "Ignore" },
		["@text.underline"] = { link = "TSUnderline" },
		["@text.uri"] = { link = "TSURI" },
		["@text.warning"] = { link = "TSWarning" },
		["@todo"] = { link = "TSTodo" },
		["@type"] = { link = "TSType" },
		["@type.builtin"] = { link = "TSTypeBuiltin" },
		["@type.definition"] = { link = "TSTypeDefinition" },
		["@type.qualifier"] = { link = "TSTypeQualifier" },
		["@uri"] = { link = "TSURI" },
		["@variable"] = { link = "TSVariable" },
		["@variable.builtin"] = { link = "TSVariableBuiltin" },

		-- LSP semantic tokens
		["@lsp.type.class"] = { link = "TSType" },
		["@lsp.type.comment"] = { link = "TSComment" },
		["@lsp.type.decorator"] = { link = "TSFunction" },
		["@lsp.type.enum"] = { link = "TSType" },
		["@lsp.type.enumMember"] = { link = "TSProperty" },
		["@lsp.type.events"] = { link = "TSLabel" },
		["@lsp.type.function"] = { link = "TSFunction" },
		["@lsp.type.interface"] = { link = "TSType" },
		["@lsp.type.keyword"] = { link = "TSKeyword" },
		["@lsp.type.macro"] = { link = "TSConstMacro" },
		["@lsp.type.method"] = { link = "TSMethod" },
		["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
		["@lsp.type.namespace"] = { link = "TSNamespace" },
		["@lsp.type.number"] = { link = "TSNumber" },
		["@lsp.type.operator"] = { link = "TSOperator" },
		["@lsp.type.parameter"] = { link = "TSParameter" },
		["@lsp.type.property"] = { link = "TSProperty" },
		["@lsp.type.regexp"] = { link = "TSStringRegex" },
		["@lsp.type.string"] = { link = "TSString" },
		["@lsp.type.struct"] = { link = "TSType" },
		["@lsp.type.type"] = { link = "TSType" },
		["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
		["@lsp.type.variable"] = { link = "TSVariable" },
	}

	-- === Apply =======================================
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
