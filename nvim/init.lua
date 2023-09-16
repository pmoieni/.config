require("pmoieni.base")
require("pmoieni.highlights")
require("pmoieni.plugins")
require("pmoieni.maps")
require("pmoieni.globals")

local has = vim.fn.has
local is_linux = has "unix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_linux == 1 then
    require('pmoieni.linux')
end
if is_win == 1 then
    require('pmoieni.windows')
end
if is_wsl == 1 then
    require('pmoieni.wsl')
end
