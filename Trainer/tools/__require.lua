p2t_io = {}
local io_open = io.open
local io_lines = io.lines
local io_popen = io.popen

p2t_io.open = function(file, mode)
    file = "mods/Payday 2 Trainer/" .. file
    return io_open(file, mode)
end

p2t_io.lines = function(file)
    file = "mods/Payday 2 Trainer/" .. file
    return io_lines(file)
end

p2t_io.io_popen = function(command)
    command = command:gsub("Trainer/", "mods/Payday 2 Trainer/Trainer/")
    return io_popen(command)
end

do

    if not (orig__require) then
        local orig__require = p2t_require
        local _G = _G
        local str_lower = string.lower
        local loadstring = loadstring
        local pcall = pcall
        local log_p2t_require = log_p2t_require
        local tostring = tostring
        local unpack = unpack
        local io_open = p2t_io.open

        local __require_pre = {}
        local __require_after = {}
        local __require_override = {}

        local G = getfenv(0)
        G.orig__require = orig__require
        G.__require_pre = __require_pre
        G.__require_after = __require_after
        G.__require_override = __require_override

        local was__required = {}

        local first_require_clbk
        first_require_clbk = function()
            if rawget(_G, '__first_require_clbk') then
                local exec = __first_require_clbk
                __first_require_clbk = nil
                exec()
            end
            first_require_clbk = function()
            end
        end

        local function exec_before_clbks(path)
            local before_clbk = __require_pre[path]
            if before_clbk then
                before_clbk()
            end
        end

        local function exec_after_clbks(path)
            local after_clbk = __require_after[path]
            if after_clbk then
                after_clbk()
            end
        end

        local exts = {'', '.lua', '.luac'}

        function p2t_require(in_path, safe, reload)
            first_require_clbk()

            local path = str_lower(in_path)

            local __was_required = was__required[path]
            if (__was_required ~= nil and not reload) then
                return unpack(__was_required)
            end

            local before_clbk = __require_pre[path]
            if before_clbk then
                before_clbk()
            end

            local override_clbk = __require_override[path]
            if override_clbk then
                return override_clbk()
            end

            local f
            local final_path
            local i = 1
            repeat
                final_path = path .. exts[i]
                f = io_open(final_path, 'rb')
                i = i + 1
            until f or i > 3
            if not f then
                if safe then
                    return log_p2t_require("Error: filename " .. in_path .. " wasn't found!\n")
                end
                local ret = orig__require(in_path)
                local after_clbk = __require_after[path]
                if after_clbk then
                    after_clbk()
                end
                return ret
            end
            local exec, str_err = loadstring(f:read('*all'), final_path)
            f:close()
            if exec then
                if (safe) then
                    local res = {pcall(exec)}
                    if res[1] then
                        res = {unpack(res, 2)}
                        was__required[path] = res
                        local after_clbk = __require_after[path]
                        if after_clbk then
                            after_clbk()
                        end
                        return unpack(res)
                    else
                        log_p2t_require('Error: ' .. res[2] .. '\n')
                    end
                else
                    local res = {exec()}
                    was__required[path] = res
                    local after_clbk = __require_after[path]
                    if after_clbk then
                        after_clbk()
                    end
                    return unpack(res)
                end
            elseif str_err then
                log_p2t_require('Error: ' .. str_err .. '\n')
            end
        end
        function reset_requires()
            was__required = {}
        end
    end
end

_G.p2t_require = p2t_require