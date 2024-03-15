toggle_infinite_equipment = toggle_infinite_equipment or function(info)
    lua_run("Trainer/addons/player-equipment/infinite_equipment.lua")
end

toggle_instant_deploy = toggle_instant_deploy or function(info)
    lua_run("Trainer/addons/player-equipment/instant_deploy.lua")
end

toggle_infinite_cable_ties = toggle_infinite_cable_ties or function(info)
    lua_run("Trainer/addons/player-equipment/infinite_cable_ties.lua")
end

toggle_infinite_bodybags = toggle_infinite_bodybags or function(info)
    lua_run("Trainer/addons/player-equipment/infinite_bodybags.lua")
end

toggle_instant_mask_on = toggle_instant_mask_on or function(info)
    lua_run("Trainer/addons/player-equipment/instant_mask_on.lua")
end

call_player_equipment = call_player_equipment or function()
    openmenu(call_player_equipment_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

player_equipment_options = player_equipment_options or 
	{
		{},
		{ text = "Toggle Infinite Equipment [Host/Client]", callback = toggle_infinite_equipment },
		{ text = "Toggle Instant Deploy [Host/Client]", callback = toggle_instant_deploy },
		{ text = "Toggle Infinite Cable Ties [Host/Client]", callback = toggle_infinite_cable_ties },
		{ text = "Toggle Infinite Bodybags [Host/Client]", callback = toggle_infinite_bodybags },
		{ text = "Toggle Instant Mask On [Host/Client]", callback = toggle_instant_mask_on },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_equipment_options = call_player_equipment_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Equipment Options", player_equipment_options)