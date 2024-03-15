toggleNoInterruptionOnDistance = not toggleNoInterruptionOnDistance

local orig_toggle_interact_dont_interupt_on_distance = BaseInteractionExt.toggle_interact_dont_interupt_on_distance
local orig_interacting = PlayerStandard._interacting

if toggleNoInterruptionOnDistance then
    function BaseInteractionExt:toggle_interact_dont_interupt_on_distance()
        return true
    end

    function PlayerStandard:_interacting()
        return
    end

    managers.mission._fading_debug_output:script().log('No Interruption On Distance - Activated', Color.green)
else
    function BaseInteractionExt:toggle_interact_dont_interupt_on_distance()
        orig_toggle_interact_dont_interupt_on_distance(self)
    end

    function PlayerStandard:_interacting()
        orig_interacting(self)
    end

    managers.mission._fading_debug_output:script().log('No Interruption On Distance - Deactivated', Color.red)
end
