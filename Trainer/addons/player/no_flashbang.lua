toggleNoFlashBang = not toggleNoFlashBang

local orig_start_tinnitus = PlayerDamage._start_tinnitus
local orig_set_flashbang = CoreEnvironmentControllerManager.set_flashbang

if toggleNoFlashBang then
    function PlayerDamage:_start_tinnitus(...)
        self:_stop_tinnitus()
    end

    function CoreEnvironmentControllerManager:set_flashbang(...)
    end

    managers.mission._fading_debug_output:script().log("No Flashbang - Activated", Color.green)
else
    function PlayerDamage:_start_tinnitus(...)
        orig_start_tinnitus(slef, ...)
    end

    function CoreEnvironmentControllerManager:set_flashbang(...)
        orig_start_tinnitus(slef, ...)
    end

    managers.mission._fading_debug_output:script().log("No Flashbang - Deactivated", Color.red)
end
