local colorbuddy = require("colorbuddy")
--colorbuddy.colorscheme("moonlander")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

-- Group.new("luaFunctionCall", g.Function, g.Function, g.Function)
--
-- -- Define highlights in relative terms of other c
-- Group.new("Error", c.red:light(), nil, s.bold)
--
-- -- If you want multiple styles, just add them!
-- Group.new("italicBoldFunction", c.green, g.Function, s.bold + s.italic)
--
-- -- If you want the same style as a different group, but without a style: just subtract it!
-- Group.new("boldFunction", c.yellow, c.background, g.italicBoldFunction - s.italic)

local M = {}

function M.load()
	Color.new("background", "#0f1411")
	Color.new("red", "#ea6962")
	Color.new("green", "#a9b665")
	Color.new("yellow", "#d8a657")
	Color.new("pink", "#d3869b")
	Color.new("orange", "#e78a4e")
	Color.new("teal", "#89b482")
	Color.new("blue", "#7daea3")
	Color.new("white", "#ebdbb2")

	Color.new("rosewater", "#ea6962")
	Color.new("flamingo", "#ea6962")
	Color.new("maroon", "#ea6962")
	Color.new("mauve", "#d3869b")
	Color.new("peach", "#e78a4e")
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
	Color.new("base", "#0f1411")
	Color.new("mantle", "#0C0A09")
	Color.new("crust", "#141617")

	Group.new("Function", c.yellow, c.background, s.bold)
	Group.new("Normal", c.white, c.background)
	Group.new("Special", c.red, nil)
	Group.new("SpecialKey", c.green, nil)
	Group.new("Operator", c.red)

	Group.new("@attribute.builtin", c.orange, nil)

	Group.new("@constant", c.orange, nil, s.none)
	Group.new("@constant.builtin", c.orange, nil)

	Group.new("@constructor", c.orange, nil)

	Group.new("@field", c.white, nil, s.none)

	Group.new("@function", c.yellow, nil, s.none)
	Group.new("@function.bracket", c.orange, nil)
	Group.new("@function.builtin", c.orange, nil)

	Group.new("@keyword", c.orange, nil, s.none)

	Group.new("@property", c.subtext0)

	Group.new("@string", c.subtext0)

	Group.new("@type", c.yellow)
	Group.new("@type.builtin", c.yellow, nil, s.bold)

	Group.new("@variable", c.white, nil)
	Group.new("@variable.builtin", c.white:light():light(), g.Normal)

	Group.new("@lsp.type.class", c.orange, nil, s.none)
	Group.new("@lsp.type.string", c.white, nil, s.none)
	Group.new("@lsp.type.interface", c.white, nil, s.none)
	Group.new("@lsp.type.method", c.orange, nil, s.none)
	Group.new("@lsp.type.type", c.orange, nil, s.none)
end

M.load()

return M
