local io_open = p2t_io.open
local loadstring = loadstring
local log_run_lua = log_run_lua

function lua_run(path)
    local file = io_open(path, "r")
    if file then
        local exe = loadstring(file:read("*all"))
        if exe then
            exe()
        else
            log_run_lua("Error: in '" .. path .. "'.\n")
        end
        file:close()
    else
        log_run_lua("Couldn't open '" .. path .. "'.\n")
    end
end

_G.lua_run = lua_run
