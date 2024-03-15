toggleNoSpread = not toggleNoSpread

if toggleNoSpread then
    function NewRaycastWeaponBase:_get_spread_from_number()
        return 0
    end

    managers.mission._fading_debug_output:script().log('No Spread - Activated', Color.green)
else
    function NewRaycastWeaponBase:_get_spread_from_number(user_unit, current_state, current_spread_value)
        local spread = self:_get_spread_indices(current_state)

        return math.max(spread * current_spread_value, 0)
    end

    managers.mission._fading_debug_output:script().log('No Spread - Deactivated', Color.red)
end
