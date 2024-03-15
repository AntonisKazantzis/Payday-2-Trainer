toggle_jump_boost = toggle_jump_boost or function(info)
    lua_run("Trainer/addons/player-movement/jump_boost.lua")
end

toggle_run_boost = toggle_run_boost or function(info)
    lua_run("Trainer/addons/player-movement/run_boost.lua")
end

toggle_walk_boost = toggle_walk_boost or function(info)
    lua_run("Trainer/addons/player-movement/walk_boost.lua")
end

toggle_climb_boost = toggle_climb_boost or function(info)
    lua_run("Trainer/addons/player-movement/climb_boost.lua")
end

toggle_no_carry_speed_penalty = toggle_no_carry_speed_penalty or function(info)
    lua_run("Trainer/addons/player-movement/no_carry_speed_penalty.lua")
end

toggle_infinite_stamina = toggle_infinite_stamina or function(info)
    lua_run("Trainer/addons/player-movement/infinite_stamina.lua")
end

toggle_no_armor_speed_penalty = toggle_no_armor_speed_penalty or function(info)
    lua_run("Trainer/addons/player-movement/no_armor_speed_penalty.lua")
end

call_player_movement = call_player_movement or function()
    openmenu(call_player_movement_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

player_movement_options = player_movement_options or 
	{
		{},
		{ text = "Toggle Jump Boost [Host/Client]", callback = toggle_jump_boost },
		{ text = "Toggle Run Boost [Host/Client]", callback = toggle_run_boost },
		{ text = "Toggle Walk Boost [Host/Client]", callback = toggle_walk_boost },
		{ text = "Toggle Climb Boost [Host/Client]", callback = toggle_climb_boost },
		{ text = "Toggle No Carry Penalty [Host/Client]", callback = toggle_no_carry_speed_penalty },
		{ text = "Toggle Infinite Stamina [Host/Client]", callback = toggle_infinite_stamina },
		{ text = "Toggle No Armor Speed Penalty [Host/Client]", callback = toggle_no_armor_speed_penalty },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_movement_options = call_player_movement_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Movement Options", player_movement_options)