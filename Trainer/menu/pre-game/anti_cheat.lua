no_verify_content = no_verify_content or function(info)
    lua_run("Trainer/addons/anti-cheat/no_verify_content.lua")

	managers.mission._fading_debug_output:script().log("No Verify Content - Activated", Color.green)
end

no_chat_spam = no_chat_spam or function(info)
    lua_run("Trainer/addons/anti-cheat/no_chat_spam.lua")

	managers.mission._fading_debug_output:script().log("No Chat Spam - Activated", Color.green)
end

dont_publish_statictics = dont_publish_statictics or function(info)
    lua_run("Trainer/addons/anti-cheat/dont_publish_statictics.lua")

	managers.mission._fading_debug_output:script().log("Dont Publish Statistics - Activated", Color.green)
end

no_cheater_tag = no_cheater_tag or function(info)
    lua_run("Trainer/addons/anti-cheat/no_cheater_tag.lua")

	managers.mission._fading_debug_output:script().log("No Cheater Tag - Activated", Color.green)
end

spoof_actions = spoof_actions or function(info)
    lua_run("Trainer/addons/anti-cheat/spoof_actions.lua")

	managers.mission._fading_debug_output:script().log("Spoof Actions - Activated", Color.green)
end

spoof_inventory = spoof_inventory or function(info)
    lua_run("Trainer/addons/anti-cheat/spoof_inventory.lua")

	managers.mission._fading_debug_output:script().log("Spoof Inventory - Activated", Color.green)
end

hide_modlist = hide_modlist or function(info)
    lua_run("Trainer/addons/anti-cheat/hide_modlist.lua")

	managers.mission._fading_debug_output:script().log("Hide Modlist - Activated", Color.green)
end

hide_trainer = hide_trainer or function(info)
    lua_run("Trainer/addons/anti-cheat/hide_trainer.lua")

	managers.mission._fading_debug_output:script().log("Hide Trainer - Activated", Color.green)
end

anti_anti_hidden_modlist = anti_anti_hidden_modlist or function(info)
    lua_run("Trainer/addons/anti-cheat/anti_anti_hidden_modlist.lua")

	managers.mission._fading_debug_output:script().log("Anti Anti Hidden Modlist - Activated", Color.green)
end

call_anti_cheat = call_anti_cheat or function()
    openmenu(call_anti_cheat_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

anti_cheat_options = anti_cheat_options or 
	{
		{},
		{ text = "No Verify Content", callback = no_verify_content },
		{ text = "No Chat Spam", callback = no_chat_spam },
		{ text = "Don't Publish Statictics", callback = dont_publish_statictics },
		{ text = "Spoof Actions", callback = spoof_actions },
		{ text = "Spoof Inventory", callback = spoof_inventory },
		{ text = "Spoof P2D Community", callback = spoof_pd2_community },
		{ text = "Hide Modlist", callback = hide_modlist },
		{ text = "Hide Trainer", callback = hide_trainer },
		{ text = "Anti Anti Hidden Modlist", callback = anti_anti_hidden_modlist },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_anti_cheat_options = call_anti_cheat_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Anti Cheat Options", anti_cheat_options)