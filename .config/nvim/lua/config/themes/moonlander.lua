local M = {}

function M.load()
  local c = {
    red = "#ea6962",
    redShadow = "#2a1616",
    maroon = "#ea6962",
    pink = "#d3869b",
    peach = "#e78a4e",
    yellow = "#d8a657",
    yellowShadow = "#2a2416",
    green = "#a9b665",
    teal = "#89b482",
    tealShadow = "#162a20",
    blue = "#7daea3",
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

  local O = {
    -- ========================================
    -- NEOVIM UI
    -- ========================================
    Normal                          = { fg = c.text, bg = c.base },
    NormalNC                        = { fg = c.text, bg = c.base },
    NormalFloat                     = { bg = c.base },
    FloatBorder                     = { fg = c.text },
    SignColumn                      = { bg = c.base },
    EndOfBuffer                     = { fg = c.base, bg = c.base },
    ColorColumn                     = { bg = c.mantle, fg = c.peach },
    LineNr                          = { fg = c.overlay0 },
    CursorLineNr                    = { fg = c.text },
    VertSplit                       = { fg = c.surface0, bg = c.base },
    Pmenu                           = { bg = c.mantle },
    PmenuSel                        = { bg = c.peach, fg = c.base },
    YankHighlight                   = { bg = c.surface2 },

    -- ========================================
    -- DIFF & GIT
    -- ========================================
    Added                           = { fg = c.teal },
    DiffAdd                         = { bg = "#1a2e1a" },
    DiffDelete                      = { bg = c.redShadow, fg = c.overlay0 },
    DiffChange                      = { bg = "#1a2433" },
    DiffText                        = { bg = "#2a3f5c", style = { "bold" } },
    GitSignsAdd                     = { fg = c.green },
    GitSignsChange                  = { fg = c.peach },

    -- ========================================
    -- PLUGIN: Diffview
    -- ========================================
    DiffviewDiffAddAsDelete         = { bg = "#2a1616" },
    DiffviewFiller                  = { fg = c.surface1, bg = c.mantle },
    DiffviewDiffDelete              = { fg = c.surface1 },
    DiffviewFilePanelTitle          = { fg = c.peach, style = { "bold" } },
    DiffviewFilePanelCounter        = { fg = c.teal },
    DiffviewFilePanelFileName       = { fg = c.text },
    DiffviewFilePanelPath           = { fg = c.overlay1 },
    DiffviewFilePanelInsertions     = { fg = c.green },
    DiffviewFilePanelDeletions      = { fg = c.red },
    DiffviewFilePanelConflicts      = { fg = c.yellow },
    DiffviewStatusAdded             = { fg = c.green },
    DiffviewStatusModified          = { fg = c.peach },
    DiffviewStatusRenamed           = { fg = c.blue },
    DiffviewStatusDeleted           = { fg = c.red },
    DiffviewStatusUnmerged          = { fg = c.yellow, style = { "bold" } },

    -- ========================================
    -- DIAGNOSTICS
    -- ========================================
    DiagnosticError                 = { fg = c.red, bg = c.redShadow },
    DiagnosticUnderlineError        = { sp = c.red, style = { "underline" } },
    DiagnosticVirtualLinesError     = { fg = c.yellow },
    DiagnosticFloatingError         = { fg = c.teal },
    DiagnosticSignError             = { fg = c.red },

    DiagnosticWarn                  = { fg = c.yellow, bg = c.yellowShadow },
    DiagnosticUnderlineWarn         = { sp = c.yellow, style = { "underline" } },

    DiagnosticInfo                  = { fg = c.teal, bg = c.tealShadow },
    DiagnosticUnderlineInfo         = { sp = c.teal, style = { "underline" } },

    DiagnosticDeprecated            = { fg = c.subtext1, style = { "strikethrough" } },
    DiagnosticUnnecessary           = { fg = c.overlay0 },

    -- ========================================
    -- PLUGIN: Telescope
    -- ========================================
    TelescopePreviewBorder          = { fg = c.text },
    TelescopePreviewNormal          = { bg = c.base },
    TelescopePromptBorder           = { fg = c.text },
    TelescopePromptNormal           = { bg = c.base },
    TelescopePromptPrefix           = { fg = c.peach, bg = c.base },
    TelescopePromptTitle            = { fg = c.peach, bg = c.base },
    TelescopeResultsBorder          = { fg = c.text },
    TelescopeResultsNormal          = { bg = c.base },
    TelescopeResultsTitle           = { fg = c.text },
    TelescopeSelection              = { bg = c.surface0 },

    -- ========================================
    -- PLUGIN: NeoTree
    -- ========================================
    NeoTreeDirectoryIcon            = { fg = c.subtext1 },
    NeoTreeDirectoryName            = { fg = c.subtext1 },
    NeoTreeFloatBorder              = { fg = c.overlay0 },
    NeoTreeGitConflict              = { fg = c.red },
    NeoTreeGitDeleted               = { fg = c.red },
    NeoTreeGitIgnored               = { fg = c.overlay0 },
    NeoTreeGitModified              = { fg = c.peach },
    NeoTreeGitStaged                = { fg = c.green },
    NeoTreeGitUnstaged              = { fg = c.red },
    NeoTreeGitUntracked             = { fg = c.green },
    NeoTreeIndent                   = { fg = c.surface1 },
    NeoTreeNormal                   = { bg = c.base },
    NeoTreeNormalNC                 = { bg = c.base },
    NeoTreeRootName                 = { fg = c.subtext1, style = { "bold" } },
    NeoTreeTabActive                = { fg = c.text, bg = c.mantle },
    NeoTreeTabInactive              = { fg = c.surface2, bg = c.crust },
    NeoTreeTabSeparatorActive       = { fg = c.mantle, bg = c.mantle },
    NeoTreeTabSeparatorInactive     = { fg = c.crust, bg = c.crust },
    NeoTreeWinSeparator             = { fg = c.base, bg = c.base },

    -- ========================================
    -- PLUGIN: Dashboard
    -- ========================================
    DashboardHeader                 = { fg = c.text },
    DashboardFiles                  = { fg = c.text },
    DashboardShortCutIcon           = { fg = c.yellow },
    DashboardMruTitle               = { fg = c.peach },
    DashboardGit                    = { fg = c.red },
    DashboardOrange                 = { fg = c.peach },
    DashboardYellow                 = { fg = c.yellow },
    DashboardGreen                  = { fg = c.green },
    DashboardPink                   = { fg = c.pink },
    DashboardTodo                   = { fg = c.teal },
    SnacksDashboardHeader           = { fg = c.text },
    SnacksDashboardNormal           = { fg = c.text },
    SnacksDashboardTitle            = { fg = c.text },

    -- ========================================
    -- PLUGIN: Flash
    -- ========================================
    FlashMatch                      = { fg = c.text, bg = c.crust },
    FlashCurrent                    = { fg = c.red },
    FlashLabel                      = { fg = c.base, bg = c.text },

    -- ========================================
    -- PLUGIN: Neogit
    -- ========================================
    NeogitSectionHeader             = { fg = c.peach },
    NeogitUnstagedchanges           = { fg = c.red },
    NeogitStagedchanges             = { fg = c.green },
    NeogitChangeModified            = { fg = c.peach },
    NeogitHunkHeaderCursor          = { fg = c.subtext1, bg = c.crust },

    -- ========================================
    -- PLUGIN: Lualine
    -- ========================================
    lualine_b_diff_removed          = { fg = c.red },
    lualine_b_diff_removed_normal   = { fg = c.red },
    lualine_b_diff_removed_insert   = { fg = c.red },
    lualine_b_diff_removed_terminal = { fg = c.red },

    -- ========================================
    -- PLUGIN: Noice
    -- ========================================
    NoiceCmdlineIcon                = { fg = c.yellow },
    NoiceCmdlinePopupBorder         = { fg = c.peach },
    NoiceCmdlinePopupTitleCmdline   = { fg = c.text },
    NoiceCmdlinePopupBorderSearch   = { fg = c.peach },
    NoiceCmdlinePopupTitleSearch    = { fg = c.text },
    NoiceCmdlineIconSearch          = { fg = c.yellow },

    -- ========================================
    -- PLUGIN: Notify
    -- ========================================
    SnacksNotifierBorderError        = { fg = c.red },
    SnacksNotifierBorderWarn         = { fg = c.yellow },
    SnacksNotifierBorderInfo         = { fg = c.teal },
    SnacksNotifierBorderDebug        = { fg = c.gray_dbg },
    SnacksNotifierBorderTrace        = { fg = c.pink },
    SnacksNotifierTitleError         = { fg = c.red },
    SnacksNotifierTitleWarn          = { fg = c.yellow },
    SnacksNotifierTitleInfo          = { fg = c.teal },
    SnacksNotifierTitleDebug         = { fg = c.gray_dbg },
    SnacksNotifierTitleTrace         = { fg = c.pink },
    SnacksNotifierIconError          = { fg = c.red },
    SnacksNotifierIconWarn           = { fg = c.yellow },
    SnacksNotifierIconInfo           = { fg = c.teal },
    SnacksNotifierIconDebug          = { fg = c.gray_dbg },
    SnacksNotifierIconTrace          = { fg = c.pink },
    SnacksNotifierError              = { fg = c.text },
    SnacksNotifierWarn               = { fg = c.text },
    SnacksNotifierInfo               = { fg = c.text },
    SnacksNotifierDebug              = { fg = c.text },
    SnacksNotifierTrace              = { fg = c.text },

    -- ========================================
    -- PLUGIN: WhichKey
    -- ========================================
    WhichKeyFloat                   = { bg = c.mantle },

    -- ========================================
    -- PLUGIN: Indent Blankline
    -- ========================================
    IblIndent                       = { fg = c.surface0 },
    IblScope                        = { fg = c.overlay0 },

    -- ========================================
    -- PLUGIN: Fidget
    -- ========================================
    FidgetTask                      = { fg = c.subtext1 },
    FidgetTitle                     = { fg = c.peach },

    -- ========================================
    -- PLUGIN: LSP Info
    -- ========================================
    LspInfoBorder                   = { fg = c.text, bg = c.base },

    -- ========================================
    -- PLUGIN: CMP
    -- ========================================
    CmpItemMenu                     = { fg = c.surface2 },

    -- ========================================
    -- PLUGIN: RenderMarkdown
    -- ========================================
    -- RenderMarkdown_RenderMarkdownCodeBorder_bg_as_fg = { fg = c.text, bg = c.text },
    RenderMarkdownCode              = { bg = c.crust },
    RenderMarkdownBullet            = { fg = c.peach },
    -- RenderMarkdownH1Bg              = { bg = c.crust },
    -- RenderMarkdownH2Bg              = { bg = c.crust },
    -- RenderMarkdownH3Bg              = { bg = c.crust },
    -- RenderMarkdownH4Bg              = { bg = c.crust },
    -- RenderMarkdownH5Bg              = { bg = c.crust },
    -- RenderMarkdownH6Bg              = { bg = c.crust },

    -- ========================================
    -- SYNTAX: Comments
    -- ========================================
    Comment                         = { fg = c.overlay0, style = { "italic" } },
    ["@comment"]                    = { link = "Comment" },
    ["@conceal"]                    = { link = "Comment" },
    ["@lsp.type.comment"]           = { link = "@comment" },

    -- ========================================
    -- SYNTAX: Functions & Methods
    -- ========================================
    Function                        = { fg = c.green, style = { "bold" } },
    ["@function"]                   = { fg = c.green },
    ["@function.builtin"]           = { fg = c.green },
    ["@function.call"]              = { fg = c.green },
    ["@function.macro"]             = { fg = c.green },
    ["@method"]                     = { fg = c.green },
    ["@method.call"]                = { fg = c.green },
    ["@constructor"]                = { fg = c.green },
    ["@lsp.type.function"]          = { link = "@function" },
    ["@lsp.type.method"]            = { link = "@method" },
    ["@lsp.type.decorator"]         = { link = "@function" },

    -- ========================================
    -- SYNTAX: Keywords & Control Flow
    -- ========================================
    Keyword                         = { fg = c.red },
    Conditional                     = { fg = c.red },
    Repeat                          = { fg = c.red },
    Statement                       = { fg = c.red },
    Exception                       = { fg = c.red },
    ["@keyword"]                    = { fg = c.red },
    ["@keyword.function"]           = { fg = c.red },
    ["@keyword.return"]             = { fg = c.red },
    ["@conditional"]                = { fg = c.red },
    ["@repeat"]                     = { fg = c.red },
    ["@exception"]                  = { fg = c.red },
    ["@lsp.type.keyword"]           = { link = "@keyword" },

    -- ========================================
    -- SYNTAX: Operators & Punctuation
    -- ========================================
    Operator                        = { fg = c.peach },
    Delimiter                       = { fg = c.subtext1 },
    ["@operator"]                   = { fg = c.peach },
    ["@keyword.operator"]           = { fg = c.peach },
    ["@punctuation.bracket"]        = { fg = c.text },
    ["@punctuation.delimiter"]      = { link = "Delimiter" },
    ["@punctuation.special"]        = { fg = c.blue },
    ["@lsp.type.operator"]          = { link = "@operator" },

    -- ========================================
    -- SYNTAX: Types & Structures
    -- ========================================
    Type                            = { fg = c.yellow, style = { "bold" } },
    Typedef                         = { fg = c.red },
    Structure                       = { fg = c.peach },
    StorageClass                    = { fg = c.peach },
    ["@type"]                       = { fg = c.yellow, style = { "bold" } },
    ["@type.builtin"]               = { fg = c.yellow, style = { "bold" } },
    ["@type.definition"]            = { fg = c.yellow, style = { "bold" } },
    ["@type.qualifier"]             = { fg = c.peach, style = { "bold" } },
    ["@storageclass"]               = { fg = c.peach },
    ["@storageclass.lifetime"]      = { fg = c.peach },
    ["@lsp.type.type"]              = { link = "@type" },
    ["@lsp.type.class"]             = { link = "@type" },
    ["@lsp.type.enum"]              = { link = "@type" },
    ["@lsp.type.interface"]         = { link = "@type" },
    ["@lsp.type.struct"]            = { link = "@type" },
    ["@lsp.type.typeParameter"]     = { link = "@type.definition" },
    ["@lsp.type.modifier"]          = { link = "@type.qualifier" },

    -- ========================================
    -- SYNTAX: Variables, Constants & Parameters
    -- ========================================
    ["@variable"]                   = { fg = c.text },
    ["@variable.builtin"]           = { fg = c.pink },
    ["@constant"]                   = { fg = c.text },
    ["@constant.builtin"]           = { fg = c.pink },
    ["@constant.macro"]             = { fg = c.pink },
    ["@parameter"]                  = { fg = c.text },
    ["@parameter.reference"]        = { fg = c.text },
    ["@lsp.type.variable"]          = { link = "@variable" },
    ["@lsp.type.parameter"]         = { link = "@parameter" },
    ["@lsp.type.macro"]             = { link = "@constant.macro" },

    -- ========================================
    -- SYNTAX: Strings, Numbers & Booleans
    -- ========================================
    Number                          = { fg = c.pink },
    Float                           = { fg = c.pink },
    Boolean                         = { fg = c.pink },
    ["@string"]                     = { fg = c.teal },
    ["@string.escape"]              = { fg = c.green },
    ["@string.regex"]               = { fg = c.green },
    ["@string.special"]             = { link = "SpecialChar" },
    ["@character"]                  = { fg = c.teal },
    ["@character.special"]          = { link = "SpecialChar" },
    ["@number"]                     = { fg = c.pink },
    ["@float"]                      = { fg = c.pink },
    ["@boolean"]                    = { fg = c.pink },
    ["@lsp.type.string"]            = { link = "@string" },
    ["@lsp.type.number"]            = { link = "@number" },
    ["@lsp.type.regexp"]            = { link = "@string.regex" },

    -- ========================================
    -- SYNTAX: Properties & Fields
    -- ========================================
    ["@property"]                   = { fg = c.blue },
    ["@field"]                      = { fg = c.blue },
    ["@lsp.type.property"]          = { link = "@property" },
    ["@lsp.type.enumMember"]        = { link = "@property" },

    -- ========================================
    -- SYNTAX: Preprocessor & Macros
    -- ========================================
    PreProc                         = { fg = c.pink },
    PreCondit                       = { fg = c.pink },
    Include                         = { fg = c.pink },
    Define                          = { fg = c.pink },
    Macro                           = { fg = c.teal },
    ["@preproc"]                    = { link = "PreProc" },
    ["@include"]                    = { fg = c.red },
    ["@define"]                     = { link = "Define" },

    -- ========================================
    -- SYNTAX: Tags, Labels & Attributes
    -- ========================================
    Tag                             = { fg = c.peach },
    Label                           = { fg = c.peach },
    Title                           = { fg = c.peach },
    ["@tag"]                        = { fg = c.peach },
    ["@tag.attribute"]              = { fg = c.green },
    ["@tag.delimiter"]              = { fg = c.green },
    ["@label"]                      = { fg = c.peach },
    ["@attribute"]                  = { fg = c.pink },
    ["@annotation"]                 = { fg = c.pink },
    ["@namespace"]                  = { fg = c.yellow },
    ["@lsp.type.events"]            = { link = "@label" },
    ["@lsp.type.namespace"]         = { link = "@namespace" },

    -- ========================================
    -- SYNTAX: Special & Misc
    -- ========================================
    Special                         = { fg = c.yellow },
    SpecialChar                     = { fg = c.yellow },
    Error                           = { fg = c.red },
    Ignore                          = { fg = c.subtext1 },
    ["@error"]                      = { link = "Error" },
    ["@none"]                       = { fg = c.text },
    ["@symbol"]                     = { fg = c.text },
    ["@debug"]                      = { link = "Debug" },
    ["@math"]                       = { fg = c.blue },
    ["@strike"]                     = { fg = c.subtext1 },

    -- ========================================
    -- SYNTAX: Text & Markup
    -- ========================================
    ["@text"]                       = { fg = c.green },
    ["@text.danger"]                = { fg = c.red, style = { "bold" } },
    ["@text.warning"]               = { fg = c.yellow },
    ["@text.note"]                  = { fg = c.blue },
    ["@text.todo"]                  = { link = "Todo" },
    ["@text.todo.checked"]          = { fg = c.green },
    ["@text.todo.unchecked"]        = { link = "Ignore" },
    ["@text.diff.add"]              = { link = "DiffAdd" },
    ["@text.diff.delete"]           = { link = "DiffDelete" },
    ["@text.emphasis"]              = { fg = c.text, style = { "italic" } },
    ["@text.strong"]                = { fg = c.text, style = { "bold" } },
    ["@text.underline"]             = { fg = c.text, style = { "undercurl" } },
    ["@text.strike"]                = { fg = c.subtext1 },
    ["@text.title"]                 = { link = "Title" },
    ["@text.literal"]               = { link = "String" },
    ["@text.uri"]                   = { fg = c.blue },
    ["@text.math"]                  = { fg = c.blue },
    ["@text.reference"]             = { link = "Constant" },
    ["@text.environment"]           = { link = "Macro" },
    ["@text.environment.name"]      = { link = "Type" },
    ["@todo"]                       = { link = "Todo" },
    ["@uri"]                        = { fg = c.blue },
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
