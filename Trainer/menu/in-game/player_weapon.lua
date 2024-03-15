toggle_no_recoil = toggle_no_recoil or function(info)
    lua_run("Trainer/addons/player-weapon/no_recoil.lua")
end

toggle_no_spread = toggle_no_spread or function(info)
    lua_run("Trainer/addons/player-weapon/no_spread.lua")
end

toggle_infinite_ammo = toggle_infinite_ammo or function(info)
    lua_run("Trainer/addons/player-weapon/infinite_ammo.lua")
end

toggle_increased_reload_speed = toggle_increased_reload_speed or function(info)
    lua_run("Trainer/addons/player-weapon/increased_reload_speed.lua")
end

toggle_increased_fire_rate = toggle_increased_fire_rate or function(info)
    lua_run("Trainer/addons/player-weapon/increased_fire_rate.lua")
end

toggle_increased_swap_speed = toggle_increased_swap_speed or function(info)
    lua_run("Trainer/addons/player-weapon/increased_swap_speed.lua")
end

toggle_one_shot_kill = toggle_one_shot_kill or function(info)
    lua_run("Trainer/addons/player-weapon/one_shot_kill.lua")
end

melee_tweaks = melee_tweaks or function(info)
    p2t_require("Trainer/addons/player-weapon/melee_tweaks")

    managers.mission._fading_debug_output:script().log("Melee Tweaks - Activated", Color.green)
end

call_player_weapon = call_player_weapon or function()
    openmenu(call_player_weapon_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

player_weapon_options = player_weapon_options or 
	{
		{},
		{ text = "Toggle No Recoil [Host/Client]", callback = toggle_no_recoil },
		{ text = "Toggle No Spread [Host/Client]", callback = toggle_no_spread },
		{ text = "Toggle Infinite Ammo [Host/Client]", callback = toggle_infinite_ammo },
		{ text = "Toggle Increased Reload Speed [Host/Client]", callback = toggle_increased_reload_speed },
		{ text = "Toggle Increased Fire Rate [Host/Client]", callback = toggle_increased_fire_rate },
		{ text = "Toggle Increased Swap Speed [Host/Client]", callback = toggle_increased_swap_speed },
		{ text = "Toggle One Shot Kill [Host/Client]", callback = toggle_one_shot_kill },
		{ text = "Melee Tweaks [Host/Client]", callback = melee_tweaks },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_weapon_options = call_player_weapon_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Weapon Options", player_weapon_options)