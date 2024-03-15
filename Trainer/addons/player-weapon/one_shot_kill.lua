toggleOneShotKill = not toggleOneShotKill

if toggleOneShotKill then
    function RaycastWeaponBase:_get_current_damage()
        return math.huge
    end

    managers.mission._fading_debug_output:script().log('One Shot Kill - Activated', Color.green)
else
    function RaycastWeaponBase:_get_current_damage(dmg_mul)
        local damage = self._damage * (dmg_mul or 1)
        damage = damage * managers.player:temporary_upgrade_value("temporary", "combat_medic_damage_multiplier", 1)

        return damage
    end

    managers.mission._fading_debug_output:script().log('One Shot Kill - Deactivated', Color.red)
end
