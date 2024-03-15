toggle_infinite_favors = toggle_infinite_favors or function(info)
    lua_run("Trainer/addons/player/infinite_favors.lua")
end

toggle_infinite_drawing_points = toggle_infinite_drawing_points or function(info)
    lua_run("Trainer/addons/player/infinite_drawing_points.lua")
end

call_preplanning = call_preplanning or function()
    openmenu(call_preplanning_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

preplanning_options = preplanning_options or 
	{
		{},
		{ text = "Toggle Infinite Favors [Host/Client]", callback = toggle_infinite_favors },
		{ text = "Toggle Infinite Drawing Points [Host/Client]", callback = toggle_infinite_drawing_points },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_preplanning_options = call_preplanning_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Preplanning Options", preplanning_options)