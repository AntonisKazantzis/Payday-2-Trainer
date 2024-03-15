if not orig__dofile then
    orig__dofile = p2t_dofile
    local io_open = p2t_io.open
    local pcall = pcall or function(clbk, ...)
        return true, clbk(...)
    end

    local unpack = unpack
    local pairs = pairs
    local loadstring = loadstring
    local exts = {'', -- As is
    '.lua', -- Implicit
    '.luac' -- Implicit
    }

    function p2t_dofile(name)
        local err_msg = 'nil argument was given'
        if (name) then
            local check
            for _, ext in pairs(exts) do
                check = io_open(name .. ext, 'rb')
                if (check) then
                    break
                end
            end

            if (check) then
                local data = check:read('*all')
                check:close()
                if (data) then
                    local l, lerr = loadstring(data, name)
                    if (l) then
                        local res = {pcall(l)}
                        if (res[1]) then
                            return unpack(res, 2)
                        else
                            err_msg = res[2]
                        end
                    else
                        err_msg = lerr
                    end
                else
                    err_msg = 'File ' .. name .. ' failed to load!'
                end
            else
                err_msg = 'File ' .. name .. ' isn\'t found!'
            end
        end
        local log_p2t_dofile = log_p2t_dofile
        if (log_p2t_dofile) then
            log_p2t_dofile(err_msg)
        end
    end
end

_G.p2t_dofile = p2t_dofile