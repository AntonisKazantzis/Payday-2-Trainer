toggle_interaction_distance_boost = toggle_interaction_distance_boost or function(info)
    lua_run("Trainer/addons/player-interaction/interaction_distance_boost.lua")
end

toggle_zipline_speed_boost = toggle_zipline_speed_boost or function(info)
    lua_run("Trainer/addons/player-interaction/zipline_speed_boost.lua")
end

toggle_drill_speed_boost = toggle_drill_speed_boost or function(info)
    lua_run("Trainer/addons/player-interaction/drill_speed_boost.lua")
end

toggle_interact_with_anything = toggle_interact_with_anything or function(info)
    lua_run("Trainer/addons/player-interaction/interact_with_anything.lua")
end

toggle_interact_in_casing = toggle_interact_in_casing or function(info)
    lua_run("Trainer/addons/player-interaction/interact_in_casing.lua")
end

toggle_no_pickup_cooldown = toggle_no_pickup_cooldown or function(info)
    lua_run("Trainer/addons/player-interaction/no_pickup_cooldown.lua")
end

toggle_interact_through_walls = toggle_interact_through_walls or function(info)
    lua_run("Trainer/addons/player-interaction/interact_through_walls.lua")
end

toggle_no_interruption_on_distance = toggle_no_interruption_on_distance or function(info)
    lua_run("Trainer/addons/player-interaction/no_interruption_on_distance.lua")
end

toggle_instant_interactions = toggle_instant_interactions or function(info)
    lua_run("Trainer/addons/player-interaction/instant_interactions.lua")
end

call_player_interaction = call_player_interaction or function()
    openmenu(call_player_interaction_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

player_interaction_options = player_interaction_options or
	{
		{},
		{ text = "Toggle Interaction Distance Boost [Host/Client]", callback = toggle_interaction_distance_boost },
		{ text = "Toggle Zipline Speed Boost [Host/Client]", callback = toggle_zipline_speed_boost },
		{ text = "Toggle Drill Speed Boost [Host/Client]", callback = toggle_drill_speed_boost },
		{ text = "Toggle Interact With Anything [Host/Client]", callback = toggle_interact_with_anything },
		{ text = "Toggle Interact In Casing [Host/Client]", callback = toggle_interact_in_casing },
		{ text = "Toggle No Pickup Cooldown [Host/Client]", callback = toggle_no_pickup_cooldown },
		{ text = "Toggle Interact Through Walls [Host/Client]", callback = toggle_interact_through_walls },
		{ text = "Toggle No Interruption On Distance [Host/Client]", callback = toggle_no_interruption_on_distance },
		{ text = "Toggle Instant Interactions [Host/Client]", callback = toggle_instant_interactions },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_interaction_options = call_player_interaction_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Interaction Options", player_interaction_options)