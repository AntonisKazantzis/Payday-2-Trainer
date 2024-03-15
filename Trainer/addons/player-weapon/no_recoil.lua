toggleNoRecoil = not toggleNoRecoil

if toggleNoRecoil then
    function NewRaycastWeaponBase:recoil_multiplier()
        return 0
    end

    managers.mission._fading_debug_output:script().log('No Recoil - Activated', Color.green)
else
    function NewRaycastWeaponBase:recoil_multiplier()
        return 1
    end

    managers.mission._fading_debug_output:script().log('No Recoil - Deactivated', Color.red)
end
