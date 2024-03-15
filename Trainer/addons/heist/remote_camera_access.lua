local game_state_machine = game_state_machine
local change_state_by_name = game_state_machine.change_state_by_name
local can_change_state_by_name = game_state_machine.can_change_state_by_name

local function remoteCameraAccess()
    if (can_change_state_by_name(game_state_machine, "ingame_access_camera")) then
        change_state_by_name(game_state_machine, "ingame_access_camera")
    end
end

remoteCameraAccess()
