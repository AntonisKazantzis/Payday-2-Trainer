complete_all_side_jobs = complete_all_side_jobs or function(info)
    lua_run("Trainer/addons/pre-game/complete_all_side_jobs.lua")

    managers.mission._fading_debug_output:script().log("Complete All Side Jobs - Activated", Color.green)
end

free_job_purchases = free_job_purchases or function(info)
    lua_run("Trainer/addons/pre-game/free_job_purchases.lua")

    managers.mission._fading_debug_output:script().log("Free Job Purchases - Activated", Color.green)
end

call_contract = call_contract or function()
    openmenu(call_contract_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

contract_options = contract_options or 
	{
		{},
		{ text = "Complete Side Jobs", callback = complete_all_side_jobs },
		{ text = "Free Jobs Purchased", callback = free_job_purchases },
		{},
		{ text = "Back", callback = back_to_main_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_contract_options = call_contract_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Contract Options", contract_options)