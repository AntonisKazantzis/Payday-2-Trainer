local p2t_require = p2t_require

p2t_require("Trainer/tools/simplemenu")
p2t_require("Trainer/tools/tools")
p2t_require("Trainer/setup/save_config")

function openmenu(menu)
    menu:show()
end

if inGame() and not InOverlay() then
	p2t_require("Trainer/menu/in-game/player_interact_with")
	p2t_require("Trainer/menu/in-game/player_interaction")
	p2t_require("Trainer/menu/in-game/player_equipment")
	p2t_require("Trainer/menu/in-game/player_movement")
	p2t_require("Trainer/menu/in-game/player_weapon")
	p2t_require("Trainer/menu/in-game/player_skill")
	p2t_require("Trainer/menu/in-game/preplanning")
	p2t_require("Trainer/menu/in-game/player")
	p2t_require("Trainer/menu/in-game/alarm")
	p2t_require("Trainer/menu/in-game/heist")

    in_game = in_game or 
	{
		{},
		{ text = "Player Interact With Options", callback = call_player_interact_with }, 
		{ text = "Player Interaction Options", callback = call_player_interaction }, 
        { text = "Player Equipment Options", callback = call_player_equipment }, 
		{ text = "Player Movement Options", callback = call_player_movement }, 
		{ text = "Player Weapon Options", callback = call_player_weapon }, 
		{ text = "Player Skill Options", callback = call_player_skill }, 
        { text = "Preplanning Options", callback = call_preplanning }, 
		{ text = "Player Options", callback = call_player }, 
		{ text = "Alarm Options", callback = call_alarm }, 
		{ text = "Heist Options", callback = call_heist }, 
		{},

		{ text = "Cancel", is_cancel_button = true, is_focused_button = true }
	}
    if not mymenu then
        mymenu = mymenu or SimpleMenu:new("Payday 2 Trainer By Lucifer", "In Game Main Options", in_game)
    end

    mymenu:show()
else
	p2t_require("Trainer/menu/pre-game/player_progress")
	p2t_require("Trainer/menu/pre-game/complete_all_side_jobs")
	p2t_require("Trainer/menu/pre-game/unlock_all")
	p2t_require("Trainer/menu/pre-game/safehouse")
	p2t_require("Trainer/menu/pre-game/config")

    pre_game = pre_game or 
	{
		{},
		{ text = "Player Progress Options", callback = call_player_progress }, 
		{ text = "Complete All Side Jobs", callback = complete_all_side_jobs },
        { text = "Unlock All Options", callback = call_unlock_all }, 
		{ text = "SafeHouse Options", callback = call_safehouse }, 
        { text = "Config Options", callback = call_config }, 
		{},

		{ text = "Cancel", is_cancel_button = true, is_focused_button = true }
	}
    if not mymenu then
        mymenu = mymenu or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Pre Game Main Options", pre_game)
    end

    mymenu:show()
end