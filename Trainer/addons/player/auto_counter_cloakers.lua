toggeCounterCloakers = not toggeCounterCloakers

local orig_on_SPOOCed = PlayerMovement.on_SPOOCed

if toggeCounterCloakers then
    function PlayerMovement:on_SPOOCed(enemy_unit)
        return "countered"
    end

    managers.mission._fading_debug_output:script().log("Auto Counter Cloaker's Kick - Activated", Color.green)
else
    function PlayerMovement:on_SPOOCed(...)
        orig_on_SPOOCed(self, ...)
    end

    managers.mission._fading_debug_output:script().log("Auto Counter Cloaker's Kick - Deactivated", Color.red)
end
