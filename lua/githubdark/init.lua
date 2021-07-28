local util = require("githubdark.util")
local theme = require("githubdark.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
