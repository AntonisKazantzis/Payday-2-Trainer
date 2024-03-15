toggle_reduce_six_sense = toggle_reduce_six_sense or function(info)
    lua_run("Trainer/addons/player-skills/reduce_six_sense.lua")
end

toggle_always_kick_start = toggle_always_kick_start or function(info)
    lua_run("Trainer/addons/player-skills/always_kick_start.lua")
end

toggle_infinite_pecm = toggle_infinite_pecm or function(info)
    lua_run("Trainer/addons/player-skills/infinite_pecm.lua")
end

toggle_no_inspire_cooldown = toggle_no_inspire_cooldown or function(info)
    lua_run("Trainer/addons/player-skills/no_inspire_cooldown.lua")
end

toggle_max_dodge_chance = toggle_max_dodge_chance or function(info)
    lua_run("Trainer/addons/player-skills/max_dodge_chance.lua")
end

toggle_max_armor_piercing_chance = toggle_max_armor_piercing_chance or function(info)
    lua_run("Trainer/addons/player-skills/max_armor_piercing_chance.lua")
end

toggle_max_crit_chance = toggle_max_crit_chance or function(info)
    lua_run("Trainer/addons/player-skills/max_crit_chance.lua")
end

toggle_infinite_converts = toggle_infinite_converts or function(info)
    lua_run("Trainer/addons/player-skills/infinite_converts.lua")
end

toggle_infinite_following_hostages = toggle_infinite_following_hostages or function(info)
    lua_run("Trainer/addons/player-skills/infinite_following_hostages.lua")
end

toggle_infinite_ecm = toggle_infinite_ecm or function(info)
    lua_run("Trainer/addons/player-skills/infinite_ecm.lua")
end

call_player_skill = call_player_skill or function()
    openmenu(call_player_skill_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

player_skill_options = player_skill_options or 
	{
		{},
		{ text = "Toggle Reduce Six Sense [Host/Client]", callback = toggle_reduce_six_sense },
		{ text = "Toggle Always Kick Start [Host/Client]", callback = toggle_always_kick_start },
		{ text = "Toggle Infinite Pocket ECM [Host/Client]", callback = toggle_infinite_pecm },
		{ text = "Toggle No Inspire Cooldown [Host/Client]", callback = toggle_no_inspire_cooldown },
		{ text = "Toggle Max Dodge Chance [Host/Client]", callback = toggle_max_dodge_chance },
		{ text = "Toggle Max Armor Piercing Chance [Host/Client]", callback = toggle_max_armor_piercing_chance },
		{ text = "Toggle Max Crit Chance [Host/Client]", callback = toggle_max_crit_chance },
		{ text = "Toggle Infinite Converts [Host/Client]", callback = toggle_infinite_converts },
		{ text = "Toggle Infinite Following Hostages [Host/Client]", callback = toggle_infinite_following_hostages },
		{ text = "Toggle Infinite ECM [Host/Client]", callback = toggle_infinite_ecm },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_skill_options = call_player_skill_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Preplanning Options", player_skill_options)