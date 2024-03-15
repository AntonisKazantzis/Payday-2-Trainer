toggleIncreasedReloadSpeed = not toggleIncreasedReloadSpeed

if toggleIncreasedReloadSpeed then
    function NewRaycastWeaponBase:reload_speed_multiplier()
        return 1000
    end

    managers.mission._fading_debug_output:script().log('Increased Reload Speed - Activated', Color.green)
else
    function NewRaycastWeaponBase:reload_speed_multiplier()
        return 1
    end

    managers.mission._fading_debug_output:script().log('Increased Reload Speed - Deactivated', Color.red)
end
