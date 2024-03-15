local _G = _G

local Network = Network
local game_state_machine = game_state_machine
local alive = alive
local string = string

function inGame()
    if not game_state_machine then
        return false
    end
    return string.find(game_state_machine:current_state_name(), "game")
end
 
function isHost()
    if not Network then
        return false
    end
    return not Network:is_client()
end
 
function isHostage(unit)
    if unit and alive(unit) and ((unit.brain and unit:brain().is_hostage and unit:brain():is_hostage()) or
        (unit.anim_data and (unit:anim_data().tied or unit:anim_data().hands_tied))) then
        return true
    end
    return false
end

_G.inGame = inGame
_G.isHost = isHost
_G.isHostage = isHostage