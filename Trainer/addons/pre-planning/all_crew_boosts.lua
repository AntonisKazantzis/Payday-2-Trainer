local boosts = {
    ["crew_add_health"] 			= {value = 6,	active = true}, -- Health increased by 60
	["crew_add_armor"] 				= {value = 3,	active = true}, -- Armor increased by 30
	["crew_add_dodge"] 				= {value = 0.05,active = true}, -- Dodge increased by 5
	["crew_add_concealment"] 		= {value = 3,	active = true}, -- Gain 3 more concealment
	["crew_add_stamina"] 			= {value = 50,	active = true}, -- Stamina increased by 50
	["crew_reduce_speed_penalty"] 	= {value = 0.5,	active = true},	-- Armor speed penalty reduced by 50%
	["crew_faster_reload"] 			= {value = 1.5,	active = true}, -- Reload 50% faster
	["crew_faster_swap"] 			= {value = 1.5,	active = true}, -- Swap weapons 50% faster
	["crew_throwable_regen"] 		= {value = 34,	active = true}, -- Gain an extra throwable for every 35 kills
	["crew_health_regen"] 			= {value = 0.5,	active = true}  -- Heal 5 health every 5 seconds
}
 
local old_upgrade = PlayerManager.upgrade_value

function PlayerManager:upgrade_value(category, upgrade, default)
	return (boosts[upgrade] and boosts[upgrade].active and boosts[upgrade].value) or old_upgrade(self, category, upgrade, default)
end