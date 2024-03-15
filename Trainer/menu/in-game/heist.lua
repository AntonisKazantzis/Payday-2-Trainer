toggle_no_cash_penalty = toggle_no_cash_penalty or function(info)
    lua_run("Trainer/addons/heist/no_cash_penalty.lua")
end

toggle_no_alarm_laser = toggle_no_alarm_laser or function(info)
    lua_run("Trainer/addons/heist/no_alarm_laser.lua")
end

toggle_no_pagers = toggle_no_pagers or function(info)
    lua_run("Trainer/addons/heist/no_pagers.lua")
end

kill_all_enemies = kill_all_enemies or function(info)
    p2t_require("Trainer/addons/heist/kill_all_enemies")

    managers.mission._fading_debug_output:script().log("Kill All Enemies - Activated", Color.green)
end

tie_all_civilians = tie_all_civilians or function(info)
    p2t_require("Trainer/addons/heist/tie_all_civilians")

    managers.mission._fading_debug_output:script().log("Tie All Civilians - Activated", Color.green)
end

convert_all_enemies = convert_all_enemies or function(info)
    p2t_require("Trainer/addons/heist/convert_all_enemies")

    managers.mission._fading_debug_output:script().log("Convert All Enemies - Activated", Color.green)
end

toggle_auto_pickup = toggle_auto_pickup or function(info)
    lua_run("Trainer/addons/heist/auto_pickup.lua")
end

carry_stacker = carry_stacker or function(info)
    p2t_require("Trainer/addons/heist/carry_stacker")

    managers.mission._fading_debug_output:script().log("Carry Stacker - Activated", Color.green)
end

force_win = force_win or function(info)
    p2t_require("Trainer/addons/heist/force_win")

    managers.mission._fading_debug_output:script().log("Force Win - Activated", Color.green)
end

no_invisible_walls = no_invisible_walls or function(info)
    p2t_require("Trainer/addons/heist/no_invisible_walls")

    managers.mission._fading_debug_output:script().log("No Invisible Walls - Activated", Color.green)
end

remote_camera_access = remote_camera_access or function(info)
    p2t_require("Trainer/addons/heist/remote_camera_access")

    managers.mission._fading_debug_output:script().log("Remote Camera Access - Activated", Color.green)
end

toggle_xray = toggle_xray or function(info)
    lua_run("Trainer/addons/heist/xray.lua")
end

call_heist = call_heist or function()
    openmenu(call_heist_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

heist_options = heist_options or 
	{
		{},
		{ text = "Toggle No Cash Penalty [Host/Client]", callback = toggle_no_cash_penalty },
		{ text = "Toggle No Alarm Laser [Host/Client]", callback = toggle_no_alarm_laser },
		{ text = "Toggle No Pagers [Host]", callback = toggle_no_pagers },
		{ text = "Kill All Enemies [Host/Client]", callback = kill_all_enemies },
		{ text = "Tie All Civilians [Host/Client]", callback = tie_all_civilians },
		{ text = "Convert All Enemies [Host/Client]", callback = convert_all_enemies },
		{ text = "Toggle Auto Pickup [Host/Client]", callback = toggle_auto_pickup },
		{ text = "Carry Stacker [Host]", callback = carry_stacker },
		{ text = "Force Win [Host]", callback = force_win },
		{ text = "No Invisible Walls [Host/Client]", callback = no_invisible_walls },
		{ text = "Remote Camera Access [Host/Client]", callback = remote_camera_access },
		{ text = "Toggle Xray [Host/Client]", callback = toggle_xray },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_heist_options = call_heist_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Heist Options", heist_options)