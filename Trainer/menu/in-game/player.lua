
toggle_god_mode = toggle_god_mode or function(info)
    lua_run("Trainer/addons/player/god_mode.lua")
end

toggle_invisibility = toggle_invisibility or function(info)
    lua_run("Trainer/addons/player/invisibility.lua")
end

toggle_no_hit_disorientation = toggle_no_hit_disorientation or function(info)
    lua_run("Trainer/addons/player/no_hit_disorientation.lua")
end

toggle_no_camera_shake = toggle_no_camera_shake or function(info)
    lua_run("Trainer/addons/player/no_camera_shake.lua")
end

toggle_no_camera_limit = toggle_no_camera_limit or function(info)
    lua_run("Trainer/addons/player/no_camera_limit.lua")
end

toggle_no_headbob = toggle_no_headbob or function(info)
    lua_run("Trainer/addons/player/no_headbob.lua")
end

toggle_no_explosion_shake = toggle_no_explosion_shake or function(info)
    lua_run("Trainer/addons/player/no_explosion_shake.lua")
end

toggle_no_flashbang = toggle_no_flashbang or function(info)
    lua_run("Trainer/addons/player/no_flashbang.lua")
end

toggle_no_gun_sway = toggle_no_gun_sway or function(info)
    lua_run("Trainer/addons/player/no_gun_sway.lua")
end

toggle_no_camera_rotation = toggle_no_camera_rotation or function(info)
    lua_run("Trainer/addons/player/no_camera_rotation.lua")
end

toggle_no_detection_in_casing = toggle_no_detection_in_casing or function(info)
    lua_run("Trainer/addons/player/no_detection_casing.lua")
end

toggle_auto_counter_cloakers = toggle_auto_counter_cloakers or function(info)
    lua_run("Trainer/addons/player/auto_counter_cloakers.lua")
end

replenish = replenish or function(info)
    lua_run("Trainer/addons/player/replenish.lua")

    managers.mission._fading_debug_output:script().log("Replenish - Activated", Color.green)
end

no_concussion_tinnitus = no_concussion_tinnitus or function(info)
    lua_run("Trainer/addons/player/no_concussion_tinnitus.lua")

    managers.mission._fading_debug_output:script().log("No Concussion Tinnitus - Activated", Color.green)
end

call_player = call_player or function()
    openmenu(call_player_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

player_options = player_options or 
	{
		{},
		{ text = "Toggle God Mode [Host/Client]", callback = toggle_god_mode },
		{ text = "Toggle Invisibility [Host/Client]", callback = toggle_invisibility },
		{ text = "Toggle No Hit Disorientation [Host/Client]", callback = toggle_no_hit_disorientation },
		{ text = "Toggle No Camera Shake [Host/Client]", callback = toggle_no_camera_shake },
		{ text = "Toggle No Camera Limit [Host/Client]", callback = toggle_no_camera_limit },
		{ text = "Toggle No Headbob [Host/Client]", callback = toggle_no_headbob },
		{ text = "Toggle No Explosion Shake [Host/Client]", callback = toggle_no_explosion_shake },
		{ text = "Toggle No Flashbang [Host/Client]", callback = toggle_no_flashbang },
		{ text = "Toggle No Gun Sway [Host/Client]", callback = toggle_no_gun_sway },
		{ text = "Toggle No Camera Rotation [Host/Client]", callback = toggle_no_camera_rotation },
		{ text = "Toggle No Detection In Casing [Host/Client]", callback = toggle_no_detection_in_casing },
		{ text = "Toggle Auto Counter Cloakers [Host/Client]", callback = toggle_auto_counter_cloakers },
		{ text = "Replenish [Host/Client]", callback = replenish },
		{ text = "No Concussion Tinnitus [Host/Client]", callback = no_concussion_tinnitus },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_options = call_player_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Options", player_options)