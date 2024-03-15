ToggleInteractThroughWalls = not ToggleInteractThroughWalls

local orig_raycheck_ok = ObjectInteractionManager._raycheck_ok

if ToggleInteractThroughWalls then
    function ObjectInteractionManager:_raycheck_ok(...)
        return true
    end

    managers.mission._fading_debug_output:script().log('Interact Through Walls - Activated', Color.green)
else
    function ObjectInteractionManager:_raycheck_ok(...)
        orig_raycheck_ok(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Interact Through Walls - Deactivated', Color.red)
end
