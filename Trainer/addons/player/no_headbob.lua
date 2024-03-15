toggleNoHeadBob = not toggleNoHeadBob

local orig_get_walk_headbob = PlayerStandard._get_walk_headbob

if toggleNoHeadBob then
    function PlayerStandard:_get_walk_headbob()
        return 0
    end

    managers.mission._fading_debug_output:script().log("No Headbob - Activated", Color.green)
else
    function PlayerStandard:_get_walk_headbob()
        orig_get_walk_headbob(self)
    end

    managers.mission._fading_debug_output:script().log("No Headbob - Deactivated", Color.red)
end
