toggleInfiniteStamina = not toggleInfiniteStamina

if toggleInfiniteStamina then
    function PlayerMovement:_change_stamina(...)
    end

    function PlayerMovement:is_stamina_drained()
        return false
    end

    function PlayerStandard:_can_run_directional()
        return true
    end

    managers.mission._fading_debug_output:script().log('Infinite Stamina - Activated', Color.green)
else
    local orig_change_stamina = PlayerMovement._change_stamina
    function PlayerMovement:_change_stamina(...)
        orig_change_stamina(self, ...)
    end

    local orig_is_stamina_drained = PlayerMovement.is_stamina_drained
    function PlayerMovement:is_stamina_drained()
        orig_is_stamina_drained(self)
    end

    local orig_can_run_directional = PlayerStandard._can_run_directional
    function PlayerStandard:_can_run_directional()
        orig_can_run_directional(self)
    end

    managers.mission._fading_debug_output:script().log('Infinite Stamina - Deactivated', Color.red)
end
