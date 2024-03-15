local io_open = p2t_io.open
local _G = _G
local current_time = os.date("%Y-%m-%d %H:%M:%S")

local function log_p2t_dofile(msg_1)
    local file = io_open("Logs/P2t-Dofile.txt", "a")
    if file then
        file:write(current_time .. " - " .. msg_1 .. "\n")
        file:close()
    end
end

local function log_p2t_require(msg_2)
    local file = io_open("Logs/P2t-Require.txt", "a")
    if file then
        file:write(current_time .. " - " .. msg_2 .. "\n")
        file:close()
    end
end

local function log_run_lua(msg_3)
    local file = io_open("Logs/Run-Lua.txt", "a")
    if file then
        file:write(current_time .. " - " .. msg_3 .. "\n")
        file:close()
    end
end

local function log_error(msg_4)
    local file = io_open("Logs/Error.txt", "a")
    if file then
        file:write(current_time .. " - " .. msg_4 .. "\n")
        file:close()
    end
end

_G.log_p2t_dofile = log_p2t_dofile
_G.log_p2t_require = log_p2t_require
_G.log_run_lua = log_run_lua
_G.log_error = log_error