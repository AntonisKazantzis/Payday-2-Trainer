local orig_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
	local retn = orig_init(self, tweak_data)
	for _,weapon in pairs(self) do
		if type(weapon) == "table" and weapon.categories then
			weapon.can_shoot_through_enemy = true
			weapon.can_shoot_through_shield = true
			weapon.can_shoot_through_wall = true
		end
	end
	return retn
end