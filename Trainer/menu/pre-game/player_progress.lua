local function setInfamyLevel(rank)
    return function(info)
        managers.experience:set_current_rank(rank)
    end
end

local function setReputationLevel(level)
    return function(info)
        managers.experience:_set_current_level(level)
    end
end

local function addMoney(amount)
    return function(info)
        managers.money:_add_to_total(amount)
    end
end

reset_money = reset_money or function(info)

    local function reset_money()
        managers.money:reset()
    end
	
    reset_money()
end

local function setSkillPoints(points)
    return function(info)
        managers.skilltree:_set_points(points)
    end
end

local function setCrimeSpreeLevel(spreeLevel)
    return function(info)
        function CrimeSpreeManager:spree_level()
            return self:in_progress() and spreeLevel or -1
        end
    end
end

give_all_perk_decks = give_all_perk_decks or function(info)

    local function give_all_perks()
        Global.skilltree_manager.specializations.total_points = 315100
        Global.skilltree_manager.specializations.points = 315100

        for spec, _ in pairs(Global.skilltree_manager.specializations) do
            if type(spec) == "number" then
                managers.skilltree.spend_specialization_points(managers.skilltree, 13700, spec)
            end
        end

    end
	
    give_all_perks()
end

reset_all_perk_decks = reset_all_perk_decks or function(info)

    local function reset_all_perks()
        managers.skilltree:reset_specializations()
    end
	
    reset_all_perks()
end

call_set_infamy = call_set_infamy or function()
    openmenu(call_set_infamy_options)
end

call_set_reputation = call_set_reputation or function()
    openmenu(call_set_reputation_options)
end

call_add_money = call_add_money or function()
    openmenu(call_add_money_options)
end

call_set_skill_points = call_set_skill_points or function()
    openmenu(call_set_skill_points_options)
end

call_set_crime_spree = call_set_crime_spree or function()
    openmenu(call_set_crime_spree_options)
end

call_give_perk_decks = call_give_perk_decks or function()
    openmenu(call_give_all_perk_decks_options)
end

call_player_progress = call_player_progress or function()
    openmenu(call_player_progress_options)
end

back_to_player_progress_options = back_to_player_progress_options or function()
    openmenu(call_player_progress_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

set_infamy_options = set_infamy_options or 
	{
		{},
		{ text = "Longest Infamy Level", callback = setInfamyLevel(388) },
		{},
		{ text = "Set 25 Infamy Level", callback = setInfamyLevel(25) },
		{ text = "Set 50 Infamy Level", callback = setInfamyLevel(50) },
		{ text = "Set 75 Infamy Level", callback = setInfamyLevel(75) },
		{ text = "Set 100 Infamy Level", callback = setInfamyLevel(100) },
		{ text = "Set 150 Infamy Level", callback = setInfamyLevel(150) },
		{ text = "Set 200 Infamy Level", callback = setInfamyLevel(200) },
		{ text = "Set 300 Infamy Level", callback = setInfamyLevel(300) },
		{ text = "Set 400 Infamy Level", callback = setInfamyLevel(400) },
		{ text = "Set 500 Infamy Level", callback = setInfamyLevel(500) },
        {},
		{ text = "Reset Infamy", callback = setInfamyLevel(0) },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_infamy_options = call_set_infamy_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Set Infamy Rank Options", set_infamy_options)

set_reputation_options = set_reputation_options or 
	{
		{},
		{ text = "Set 20 Reputation Level", callback = setReputationLevel(20) },
		{ text = "Set 30 Reputation Level", callback = setReputationLevel(30) },
		{ text = "Set 40 Reputation Level", callback = setReputationLevel(40) },
		{ text = "Set 50 Reputation Level", callback = setReputationLevel(50) },
		{ text = "Set 60 Reputation Level", callback = setReputationLevel(60) },
		{ text = "Set 70 Reputation Level", callback = setReputationLevel(70) },
		{ text = "Set 80 Reputation Level", callback = setReputationLevel(80) },
		{ text = "Set 90 Reputation Level", callback = setReputationLevel(90) },
		{ text = "Set 100 Reputation Level", callback = setReputationLevel(100) },
        {},
		{ text = "Reset Reputation", callback = setReputationLevel(0) },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_reputation_options = call_set_reputation_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Set Reputation Options", set_reputation_options)

add_money_options = add_money_options or 
	{
		{},
		{ text = "Add 1 Milion $ Money", callback = addMoney(1000000) },
		{ text = "Add 10 Milion $ Money", callback = addMoney(10000000) },
		{ text = "Add 100 Milion $ Money", callback = addMoney(100000000) },
		{ text = "Add 1 Bilion $ Money", callback = addMoney(1000000000) },
		{ text = "Add 10 Bilion $ Money", callback = addMoney(10000000000) },
		{ text = "Add 100 Bilion $ Money", callback = addMoney(100000000000) },
		{ text = "Add 1 Trilion $ Money", callback = addMoney(1000000000000) },
		{ text = "Add 10 Trilion $ Money", callback = addMoney(10000000000000) },
		{ text = "Add 100 Trilion $ Money", callback = addMoney(100000000000000) },
        {},
		{ text = "Reset Money", callback = reset_money },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_add_money_options = call_add_money_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Add Money Options", add_money_options)

set_skill_points_options = set_skill_points_options or 
	{
		{},
		{ text = "Max Skill Points", callback = setSkillPoints(255) },
		{ text = "Normal Skill Points", callback = setSkillPoints(120) },
		{ text = "Reset Skill Points", callback = setSkillPoints(0) },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_skill_points_options = call_set_skill_points_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Set Skills Options", set_skill_points_options)

set_crime_spree_options = set_crime_spree_options or 
    {
        {},
        { text = "Add 1 Thousand Crime Spree Level", callback = setCrimeSpreeLevel(1000) },
        { text = "Add 10 Thousand Crime Spree Level", callback = setCrimeSpreeLevel(10000) },
        { text = "Add 100 Thousand Crime Spree Level", callback = setCrimeSpreeLevel(100000) },
        { text = "Add 400 Thousand Crime Spree Level", callback = setCrimeSpreeLevel(400000) },
        { text = "Add 600 Thousand Crime Spree Level", callback = setCrimeSpreeLevel(600000) },
        { text = "Add 800 Thousand Crime Spree Level", callback = setCrimeSpreeLevel(800000) },
        { text = "Add 1 Milion Crime Spree Level", callback = setCrimeSpreeLevel(1000000) },
        { text = "Add 10 Milion Crime Spree Level", callback = setCrimeSpreeLevel(10000000) },
        { text = "Add 100 Milion Crime Spree Level", callback = setCrimeSpreeLevel(100000000) },
        {},
        { text = "Reset Crime Spree Level", callback = setCrimeSpreeLevel(0) },
        {},
        { text = "Back", callback = back_to_player_progress_options },
        { text = "Cancel", is_cancel_button = true, is_focused_button = true },
    }
call_set_crime_spree_options = call_set_crime_spree_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Set Crime Spree Options", set_crime_spree_options)

give_perk_decks_options = give_perk_decks_options or 
	{
		{},
		{ text = "Give All Perk Decks", callback = give_all_perk_decks },
		{ text = "Reset All Perk Decks", callback = reset_all_perk_decks },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_give_all_perk_decks_options = call_give_all_perk_decks_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Give All Perk Decks Options", give_perk_decks_options)

player_progress_options = player_progress_options or 
	{
		{},
		{ text = "Set Infamy Menu", callback = call_set_infamy },
		{ text = "Set Reputation Menu", callback = call_set_reputation },
		{ text = "Add Money Menu", callback = call_add_money },
		{ text = "Set Skill Points Menu", callback = call_set_skill_points },
		{ text = "Set Crime Spree Menu", callback = call_set_crime_spree },
		{ text = "Give All Perk Decks Menu", callback = call_give_perk_decks },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_progress_options = call_player_progress_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Progress Options", player_progress_options)