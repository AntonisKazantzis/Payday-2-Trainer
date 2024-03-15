ToggleInteractWithAnything = not ToggleInteractWithAnything

local orig_has_required_upgrade = BaseInteractionExt._has_required_upgrade
local orig_has_required_deployable = BaseInteractionExt._has_required_deployable
local orig_can_interact = BaseInteractionExt.can_interact

if ToggleInteractWithAnything then
    function BaseInteractionExt:_has_required_upgrade()
        return true
    end

    function BaseInteractionExt:_has_required_deployable()
        return true
    end

    function BaseInteractionExt:can_interact(...)
        return true
    end

    managers.mission._fading_debug_output:script().log('Interact With Anything - Activated', Color.green)
else
    function BaseInteractionExt:_has_required_upgrade()
        orig_has_required_upgrade(self)
    end

    function BaseInteractionExt:_has_required_deployable()
        orig_has_required_deployable(self)
    end

    function BaseInteractionExt:can_interact(...)
        orig_can_interact(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Interact With Anything - Deactivated', Color.red)
end