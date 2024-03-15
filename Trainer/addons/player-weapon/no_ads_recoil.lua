local norecoil_blacklist = {
	--Special
	["flamethrower_mk2"] = true,
	["system"] = true,
	["china"] = true,
	
	--Shotguns
	["r870_shotgun"] = true,
	["ksg"] = true,
	["boot"] = true,
	["m37"] = true,
	["m1897"] = true,
	["m590"] = true,
	
	--Sniper Rifles
	["winchester1874"] = true,
	["mosin"] = true,
	["m95"] = true,
	["r93"] = true,
	["msr"] = true,
	["model70"] = true,
	["r700"] = true,
	["sbl"] = true,
	["desertfox"] = true,
	["scout"] = true,
	
	--Pistols
	["peacemaker"] = true,
	["model3"] = true
}

Hooks:PostHook(PlayerStandard, "_check_action_primary_attack", "norecoil_shooting", function(self)
	local weap_base = self._equipped_unit:base()
	local weap_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
	local is_bow = table.contains(weap_base:weapon_tweak_data().categories, "bow")
	if self._shooting and self._state_data.in_steelsight and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] then
		self._ext_camera:play_redirect(self:get_animation("idle"))
	end
end)

Hooks:PostHook(PlayerStandard, "_check_stop_shooting", "norecoil_stop_shooting", function(self)
	local weap_base = self._equipped_unit:base()
	local weap_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
	local is_bow = table.contains(weap_base:weapon_tweak_data().categories, "bow")
	if self._state_data.in_steelsight and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] then
		self._ext_camera:play_redirect(self:get_animation("idle"))
	end
end)