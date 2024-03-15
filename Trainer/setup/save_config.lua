local _G = _G
local p2t_config = p2t_config
local io_open = p2t_io.open
local string = string
local pairs = pairs
local tostring = tostring
local log_error = log_error

local function save_config(p2t_config)
    local file = io_open("Trainer/setup/config.lua", "w")
    if file then
        file:write("return {\n")
        for k, v in pairs(p2t_config) do
            file:write(string.format("    %s = %s,\n", k, tostring(v)))
        end
        file:write("}\n")
        file:close()
    else
        log_error("Error: Unable to open p2t_config file for writing.")
    end
end

local function update_config(key, value)
    p2t_config[key] = value
    save_config(p2t_config)
end

local function reset_config()
    for key, _ in pairs(p2t_config) do
        p2t_config[key] = false
    end
    save_config(p2t_config)
end

_G.update_config = update_config
_G.reset_config = reset_config
