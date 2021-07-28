local util = require("githubdark.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("githubdark.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",
    bg_dark = "#2b3036",
    bg = "#24292e",
    bg_highlight = "#292e42",
    terminal_black = "#414868",
    fg = "#e1e4e8",
    fg_dark = "#d1d5da",
    fg_gutter = "#444d56",
    dark3 = "#545c7e", -- TODO
    comment = "#959da5",
    dark5 = "#737aa2", -- TODO
    cyan = "#7dcfff", -- TODO
    blue0 = "#3d59a1",
    blue = "#b392f0",
    blue1 = "#9ecbff",
    blue2 = "#79b8ff",
    blue3 = "#22374b",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8", -- TODO
    blue7 = "#394b70", -- TODO
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ffab70",
    yellow = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f97583",
    red1 = "#db4b4b",
    git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
    gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
  }
  if config.style == "night" or config.style == "day" or vim.o.background == "light" then
    colors.bg = "#1a1b26"
  end
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green, 0.15),
    delete = util.darken(colors.red, 0.35),
    change = util.darken(colors.blue, 0.15),
    text = util.darken(colors.blue, 0.5)
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.fg_gutter
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = colors.blue3
  colors.bg_search = util.darken(colors.blue0, 0.75)
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red1
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M
