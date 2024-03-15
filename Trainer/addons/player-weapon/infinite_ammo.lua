toggleInfiniteAmmo = not toggleInfiniteAmmo

local NewRaycastWeaponBase_fire = NewRaycastWeaponBase.fire

if toggleInfiniteAmmo then
    function NewRaycastWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, sup2t_mul,
        target_unit)
        local result = NewRaycastWeaponBase_fire(self, from_pos, direction, dmg_mul, shoot_player, spread_mul,
            autohit_mul, sup2t_mul, target_unit)

        if managers.player:player_unit() == self._setup.user_unit then
            self.set_ammo(self, 1.0)
        end

        return result
    end

    managers.mission._fading_debug_output:script().log("Infinite Ammo - Activated", Color.green)
else
    function NewRaycastWeaponBase:fire(...)
        local ray_res = NewRaycastWeaponBase.super.fire(self, ...)

        if self._fire_mode == ids_burst and self._bullets_fired > 1 and not self:weapon_tweak_data().sounds.fire_single then
            self:_fire_sound()
        end

        return ray_res
    end

    managers.mission._fading_debug_output:script().log("Infinite Ammo - Deactivated", Color.red)
end
