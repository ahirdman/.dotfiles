local colorbuddy = require("colorbuddy")
colorbuddy.colorscheme("moonlander")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

local M = {}

function M.load()
    -- Catppuccin mocha colors
    Color.new("rosewater", "#ea6962")
    Color.new("flamingo", "#ea6962")
    Color.new("red", "#ea6962")
    Color.new("maroon", "#ea6962")
    Color.new("pink", "#d3869b")
    Color.new("mauve", "#d3869b")
    Color.new("peach", "#e78a4e")
    Color.new("yellow", "#d8a657")
    Color.new("green", "#a9b665")
    Color.new("teal", "#89b482")
    Color.new("sky", "#89b482")
    Color.new("sapphire", "#89b482")
    Color.new("blue", "#7daea3")
    Color.new("lavender", "#7daea3")
    Color.new("text", "#ebdbb2")
    Color.new("subtext1", "#d5c4a1")
    Color.new("subtext0", "#bdae93")
    Color.new("overlay2", "#a89984")
    Color.new("overlay1", "#928374")
    Color.new("overlay0", "#595959")
    Color.new("surface2", "#4d4d4d")
    Color.new("surface1", "#404040")
    Color.new("surface0", "#292929")
    Color.new("base", "#121212")
    Color.new("mantle", "#0C0A09")
    Color.new("crust", "#141617")
    Color.new("background", "#121212")

    local overrides = {
        AvanteTitle = { bg = c.mantle, fg = c.peach },
        AvanteReversedTitle = { fg = c.mantle },
        AvanteSidebarNormal = { bg = c.mantle, fg = c.text },
        AvanteSidebarWinSeparator = { bg = c.mantle, fg = c.overlay0 },
        
        CmpItemMenu = { fg = c.surface2 },
        
        CursorLineNr = { fg = c.text },
        
        FloatBorder = { bg = c.base, fg = c.text },
        
        GitSignsChange = { fg = c.peach },
        
        LineNr = { fg = c.overlay0 },
        
        LspInfoBorder = { link = "FloatBorder" },
        
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
        NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
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
        
        NormalFloat = { bg = c.base },
        
        Pmenu = { bg = c.mantle, fg = "" },
        
        PmenuSel = { bg = c.peach, fg = "" },
        TelescopePreviewBorder = { bg = c.base, fg = c.text },
        TelescopePreviewNormal = { bg = c.base },
        -- TelescopePreviewTitle = { fg = c.crust, bg = c.mantle },
        TelescopePromptBorder = { bg = c.base, fg = c.text },
        -- TelescopePromptCounter = { fg = c.mauve, style = { "bold" } },
        TelescopePromptNormal = { bg = c.base },
        TelescopePromptPrefix = { bg = c.base, fg = c.peach },
        TelescopePromptTitle = { fg = c.peach, bg = c.base },
        TelescopeResultsBorder = { bg = c.base, fg = c.text },
        TelescopeResultsNormal = { bg = c.base }, -- Result list
        TelescopeResultsTitle = { fg = c.text, bg = c.base },
        -- TelescopeSelection = { bg = c.surface0 }, -- Active Row in selection list
        
        VertSplit = { bg = c.base, fg = c.surface0 },
        
        WhichKeyFloat = { bg = c.mantle },
        
        YankHighlight = { bg = c.surface2 },
        FidgetTask = { fg = c.subtext1 }, -- Changed
        FidgetTitle = { fg = c.peach },
        
        IblIndent = { fg = c.surface0 },
        IblScope = { fg = c.overlay0 },
        
        Boolean = { fg = c.mauve },
        Number = { fg = c.mauve },
        Float = { fg = c.mauve },
        
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
        Delimiter = { fg = c.subtext1 }, -- changed
        Ignore = { fg = c.subtext1 }, -- changed
        Macro = { fg = c.teal },
        
        NotifyERRORBorder = { fg = c.red },
        NotifyERRORTitle = { fg = c.red },
        NotifyERRORIcon = { fg = c.red },
        NotifyERRORBody = { link = "Normal" },
        
        NotifyWARNBorder = { fg = c.yellow },
        NotifyWARNTitle = { fg = c.yellow },
        NotifyWARNIcon = { fg = c.yellow },
        NotifyWARNBody = { link = "Normal" },
        
        NotifyDEBUGBorder = { fg = "#8B8B8B" },
        NotifyDEBUGTitle = { fg = "#8B8B8B" },
        NotifyDEBUGIcon = { fg = "#8B8B8B" },
        NotifyDEBUGBody = { link = "Normal" },
        
        NotifyINFOBorder = { fg = c.teal }, -- Darker higher
        NotifyINFOTitle = { fg = c.teal },
        NotifyINFOIcon = { fg = c.teal },
        NotifyINFOBody = { link = "Normal" },
        
        NotifyTRACEBorder = { fg = c.pink },
        NotifyTRACETitle = { fg = c.pink },
        NotifyTRACEIcon = { fg = c.pink },
        NotifyTRACEBody = { link = "Normal" },
        
        -- Typescript
        
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
        TSStrike = { fg = c.subtext1 }, -- changed
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
        
        ["@annotation"] = { link = "TSAnnotation" },
        ["@attribute"] = { link = "TSAttribute" },
        ["@boolean"] = { link = "TSBoolean" },
        ["@character"] = { link = "TSCharacter" },
        ["@character.special"] = { link = "TSCharacterSpecial" },
        ["@comment"] = { link = "TSComment" },
        ["@conceal"] = { link = "Grey" },
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
        ["@text.diff.add"] = { link = "diffAdded" },
        ["@text.diff.delete"] = { link = "diffRemoved" },
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
        ["@text.todo.checked"] = { link = "Green" },
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

    local function apply(groups)
        for name, opts in pairs(groups) do
            if opts.link then
                Group.link(name, opts.link)
            else
                local style = s.none
                if opts.style and opts.style[1] == "bold" then
                    style = s.bold
                end
                Group.new(name, opts.fg, opts.bg, style)
            end
        end
    end

    apply(overrides)
end

M.load()

return M
