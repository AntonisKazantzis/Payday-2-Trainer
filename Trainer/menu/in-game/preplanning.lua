toggle_infinite_favors = toggle_infinite_favors or function(info)
    lua_run("Trainer/addons/pre-planning/infinite_favors.lua")
end

toggle_infinite_drawing_points = toggle_infinite_drawing_points or function(info)
    lua_run("Trainer/addons/pre-planning/infinite_drawing_points.lua")
end

all_crew_boosts = all_crew_boosts or function(info)
    lua_run("Trainer/addons/pre-planning/all_crew_boosts.lua")

	managers.mission._fading_debug_output:script().log("All Crew Boosts - Activated", Color.green)
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
		{ text = "All Crew Boosts [Host]", callback = all_crew_boosts },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_preplanning_options = call_preplanning_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Preplanning Options", preplanning_options)