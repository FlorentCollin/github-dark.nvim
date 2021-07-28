local config = require("githubdark.config")
local colors = require("githubdark.colors").setup(config)
local util = require("githubdark.util")

local githubdark = {}

githubdark.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

githubdark.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

githubdark.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.yellow },
}

githubdark.visual = {
  a = { bg = colors.magenta, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.magenta },
}

githubdark.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

githubdark.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if vim.o.background == "light" then
  for _, mode in pairs(githubdark) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.getColor(section.bg)
      end
      if section.fg then
        section.fg = util.getColor(section.fg)
      end
    end
  end
end

if vim.g.githubdark_lualine_bold then
  for _, mode in pairs(githubdark) do
    mode.a.gui = "bold"
  end
end

return githubdark
