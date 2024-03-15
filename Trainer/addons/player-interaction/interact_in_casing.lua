ToggleInteractInCasing = not ToggleInteractInCasing

local orig_is_in_required_state = BaseInteractionExt._is_in_required_state

if ToggleInteractInCasing then
    function BaseInteractionExt:_is_in_required_state(movement_state, ...)
        return movement_state == "mask_off" and true or orig_is_in_required_state(self, movement_state, ...)
    end

    managers.mission._fading_debug_output:script().log('Interact In Casing - Activated', Color.green)
else
    function BaseInteractionExt:_is_in_required_state(...)
        orig_is_in_required_state(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Interact In Casing - Deactivated', Color.red)
end
