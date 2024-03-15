if RequiredScript == "lib/network/base/basenetworksession" then
	local o_check_send_outfit = BaseNetworkSession.check_send_outfit
	function BaseNetworkSession:check_send_outfit(peer)
		Global.IS_SENDING_OUTFIT = true
		o_check_send_outfit(self, peer)
		Global.IS_SENDING_OUTFIT = false
	end
 
elseif RequiredScript == "lib/managers/blackmarketmanager" then
	local o_equipped_primary = BlackMarketManager.equipped_primary
	function BlackMarketManager:equipped_primary()
		local amcar = {
			["weapon_id"] = "amcar",
			["equipped"] = true,
			["global_values"] = {},
			["factory_id"] = "wpn_fps_ass_amcar",
			["blueprint"] = {
				[1] = "wpn_fps_m4_uupg_b_medium_vanilla",
				[2] = "wpn_fps_m4_lower_reciever",
				[3] = "wpn_fps_amcar_uupg_body_upperreciever",
				[4] = "wpn_fps_amcar_uupg_fg_amcar",
				[5] = "wpn_fps_upg_m4_m_straight_vanilla",
				[6] = "wpn_fps_upg_m4_s_standard_vanilla",
				[7] = "wpn_fps_upg_m4_g_standard_vanilla",
				[8] = "wpn_fps_amcar_bolt_standard",
			}
		}
		return Global.IS_SENDING_OUTFIT and amcar or o_equipped_primary(self)
	end
 
	local o_equipped_secondary = BlackMarketManager.equipped_secondary
	function BlackMarketManager:equipped_secondary()
		local glock = {
			["weapon_id"] = "glock_17",
			["equipped"] = true,
			["global_values" ] = {},
			["factory_id"] = "wpn_fps_pis_g17",
			["blueprint"] = {
				[1] = "wpn_fps_pis_g17_body_standard",
				[2] = "wpn_fps_pis_g17_b_standard",
				[3] = "wpn_fps_pis_g17_m_standard",
			}
		}
		return Global.IS_SENDING_OUTFIT and glock or o_equipped_secondary(self)
	end
 
	local o_equipped_melee_weapon = BlackMarketManager.equipped_melee_weapon
	function BlackMarketManager:equipped_melee_weapon()
		return Global.IS_SENDING_OUTFIT and "weapon" or o_equipped_melee_weapon(self)
	end
 
	local o_equipped_grenade = BlackMarketManager.equipped_grenade
	function BlackMarketManager:equipped_grenade()
		if Global.IS_SENDING_OUTFIT then return "concussion", 6
		else return o_equipped_grenade(self) end
	end
 
	local o_equipped_deployable = BlackMarketManager.equipped_deployable
	function BlackMarketManager:equipped_deployable(slot)
		return Global.IS_SENDING_OUTFIT and nil or o_equipped_deployable(self, slot)
	end
 
	local o_outfit_string_mask = BlackMarketManager._outfit_string_mask
	function BlackMarketManager:_outfit_string_mask()
		return Global.IS_SENDING_OUTFIT and "character_locked nothing-nothing no_color_no_material plastic" or o_outfit_string_mask(self)
	end
 
	local o_equipped_armor = BlackMarketManager.equipped_armor
	function BlackMarketManager:equipped_armor(chk_armor_kit, chk_player_state)
		return Global.IS_SENDING_OUTFIT and "level_1" or o_equipped_armor(self, chk_armor_kit, chk_player_state)
	end
 
	local o_equipped_armor_skin = BlackMarketManager.equipped_armor_skin
	function BlackMarketManager:equipped_armor_skin()
		return Global.IS_SENDING_OUTFIT and "none" or o_equipped_armor_skin(self)
	end
 
	local o_equipped_player_style = BlackMarketManager.equipped_player_style
	function BlackMarketManager:equipped_player_style()
		return Global.IS_SENDING_OUTFIT and "none" or o_equipped_player_style(self)
	end
 
	local o_get_suit_variation = BlackMarketManager.get_suit_variation
	function BlackMarketManager:get_suit_variation(player_style)
		return Global.IS_SENDING_OUTFIT and "default" or o_get_suit_variation(self)
	end
 
	local o_equipped_glove_id = BlackMarketManager.equipped_glove_id
	function BlackMarketManager:equipped_glove_id()
		return Global.IS_SENDING_OUTFIT and "default" or o_equipped_glove_id(self)
	end
end