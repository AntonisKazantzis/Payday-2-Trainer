toggleIncreasedFireRate = not toggleIncreasedFireRate

if toggleIncreasedFireRate then
    function NewRaycastWeaponBase:fire_rate_multiplier()
        return 100
    end

    managers.mission._fading_debug_output:script().log('Increased Fire Rate - Activated', Color.green)
else
    function NewRaycastWeaponBase:fire_rate_multiplier()
        return 1
    end

    managers.mission._fading_debug_output:script().log('Increased Fire Rate - Deactivated', Color.red)
end
