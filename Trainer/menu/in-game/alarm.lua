toggle_infinite_pagers = toggle_infinite_pagers or function(info)
    lua_run("Trainer/addons/alarm/infinite_pagers.lua")
end

toggle_stop_calling_police = toggle_stop_calling_police or function(info)
    lua_run("Trainer/addons/alarm/stop_calling_police.lua")
end

toggle_stop_reporting = toggle_stop_reporting or function(info)
    lua_run("Trainer/addons/alarm/stop_reporting.lua")
end

toggle_disable_camera_alarm = toggle_disable_camera_alarm or function(info)
    lua_run("Trainer/addons/alarm/disable_camera_alarm.lua")
end

toggle_no_camera_sound = toggle_no_camera_sound or function(info)
    lua_run("Trainer/addons/alarm/no_camera_sound.lua")
end

toggle_stop_saying_calling_police = toggle_stop_saying_calling_police or function(info)
    lua_run("Trainer/addons/alarm/stop_saying_calling_police.lua")
end

toggle_prevents = toggle_prevents or function(info)
    lua_run("Trainer/addons/alarm/prevents.lua")
end

toggle_disable_cameras = toggle_disable_cameras or function(info)
    lua_run("Trainer/addons/alarm/disable_cameras.lua")
end

call_alarm = call_alarm or function()
    openmenu(call_alarm_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

alarm_options = alarm_options or
	{
		{},
		{ text = "Toggle Infinite [Host]", callback = toggle_infinite_pagers },
		{ text = "Toggle Stop Calling Police [Host]", callback = toggle_stop_calling_police },
		{ text = "Toggle Stop Reporting [Host]", callback = toggle_stop_reporting },
		{ text = "Toggle Disable Camera Alarm [Host]", callback = toggle_disable_camera_alarm },
		{ text = "Toggle No Camera Sound [Host/Client]", callback = toggle_no_camera_sound },
		{ text = "Toggle Stop Saying Calling Police [Host]", callback = toggle_stop_saying_calling_police },
		{ text = "Toggle Prevents [Host]", callback = toggle_prevents },
		{ text = "Toggle Disable Cameras [Host]", callback = toggle_disable_cameras },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_alarm_options = call_alarm_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Alarm Options", alarm_options)