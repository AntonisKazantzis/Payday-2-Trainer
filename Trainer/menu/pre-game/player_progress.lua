set_infamy_1 = set_infamy_1 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(25)
    end

    set_infamy_level()
end

set_infamy_2 = set_infamy_2 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(50)
    end

    set_infamy_level()
end

set_infamy_4 = set_infamy_3 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(75)
    end

    set_infamy_level()
end

set_infamy_4 = set_infamy_4 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(100)
    end

    set_infamy_level()
end

set_infamy_5 = set_infamy_5 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(150)
    end

    set_infamy_level()
end

set_infamy_6 = set_infamy_6 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(200)
    end

	set_infamy_level()
end

set_infamy_7 = set_infamy_7 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(300)
    end

    set_infamy_level()
end

set_infamy_8 = set_infamy_8 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(400)
    end

    set_infamy_level()
end

set_infamy_9 = set_infamy_9 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(500)
    end

    set_infamy_level()
end

reset_infamy = reset_infamy or function(info)

    local function reset_infamy_level()
        managers.experience:set_current_rank(0)
    end

    reset_infamy_level()
end

set_reputation_1 = set_reputation_1 or function(info)

    local function change_level()
        managers.experience:_set_current_level(20)
    end

    change_level()
end

set_reputation_2 = set_reputation_2 or function(info)

    local function change_level()
        managers.experience:_set_current_level(30)
    end

    change_level()
end

set_reputation_3 = set_reputation_3 or function(info)

    local function change_level()
        managers.experience:_set_current_level(40)
    end

    change_level()
end

set_reputation_4 = set_reputation_4 or function(info)

    local function change_level()
        managers.experience:_set_current_level(50)
    end

    change_level()
end

set_reputation_5 = set_reputation_5 or function(info)

    local function change_level()
        managers.experience:_set_current_level(60)
    end

    change_level()
end

set_reputation_6 = set_reputation_6 or function(info)

    local function change_level()
        managers.experience:_set_current_level(70)
    end

    change_level()
end

set_reputation_7 = set_reputation_7 or function(info)

    local function change_level()
        managers.experience:_set_current_level(80)
    end

    change_level()
end

set_reputation_8 = set_reputation_8 or function(info)

    local function change_level()
        managers.experience:_set_current_level(90)
    end

    change_level()
end

set_reputation_9 = set_reputation_9 or function(info)

    local function change_level()
        managers.experience:_set_current_level(100)
    end

    change_level()
end

reset_reputation = reset_reputation or function(info)

    local function reset_level()
        managers.experience:_set_current_level(0)
    end

    reset_level()
end

add_money_1 = add_money_1 or function(info)

    local function add_money()
        managers.money:_add_to_total(1000000)
    end

    add_money()
end

add_money_2 = add_money_2 or function(info)

    local function add_money()
        managers.money:_add_to_total(10000000)
    end
	
    add_money()
end

add_money_3 = add_money_3 or function(info)

    local function add_money()
        managers.money:_add_to_total(100000000)
    end
	
    add_money()
end

add_money_4 = add_money_4 or function(info)

    local function add_money()
        managers.money:_add_to_total(1000000000)
    end
	
    add_money()
end

add_money_5 = add_money_5 or function(info)

    local function add_money()
        managers.money:_add_to_total(10000000000)
    end
	
    add_money()
end

add_money_6 = add_money_6 or function(info)

    local function add_money()
        managers.money:_add_to_total(100000000000)
    end
	
    add_money()
end

add_money_7 = add_money_7 or function(info)

    local function add_money()
        managers.money:_add_to_total(1000000000000)
    end
	
    add_money()
end

add_money_8 = add_money_8 or function(info)

    local function add_money()
        managers.money:_add_to_total(10000000000000)
    end
	
    add_money()
end

add_money_9 = add_money_9 or function(info)

    local function add_money()
        managers.money:_add_to_total(100000000000000)
    end
	
    add_money()
end

reset_money = reset_money or function(info)

    local function reset_money()
        managers.money:reset()
    end
	
    reset_money()
end

set_skill_points = set_skill_points or function(info)

    local function set_skillpoints()
        managers.skilltree:_set_points(120)
    end
	
    set_skillpoints()
end

reset_skill_points = reset_skill_points or function(info)

    local function reset_skillpoints()
        managers.skilltree:_set_points(0)
    end
	
    reset_skillpoints()
end

set_crime_spree_1 = set_crime_spree_1 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (1000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_2 = set_crime_spree_2 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (10000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_3 = set_crime_spree_3 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (100000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_4 = set_crime_spree_4 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (400000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_5 = set_crime_spree_5 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (600000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_6 = set_crime_spree_6 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (800000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_7 = set_crime_spree_7 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (10000000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_8 = set_crime_spree_8 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (10000000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_9 = set_crime_spree_9 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (100000000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

reset_crime_spree = reset_crime_spree or function(info)

    local function reset_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (0) or -1
        end

    end
	
    reset_crimespree_spree_level()
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
		{ text = "Set 25 Infamy", callback = set_infamy_1 },
		{ text = "Set 50 Infamy", callback = set_infamy_2 },
		{ text = "Set 75 Infamy", callback = set_infamy_3 },
		{ text = "Set 100 Infamy", callback = set_infamy_4 },
		{ text = "Set 150 Infamy", callback = set_infamy_5 },
		{ text = "Set 200 Infamy", callback = set_infamy_6 },
		{ text = "Set 300 Infamy", callback = set_infamy_7 },
		{ text = "Set 400 Infamy", callback = set_infamy_8 },
		{ text = "Set 500 Infamy", callback = set_infamy_9 },
		{ text = "Reset Infamy", callback = reset_infamy },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_infamy_options = call_set_infamy_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Infamy Rank Options", set_infamy_options)

set_reputation_options = set_reputation_options or 
	{
		{},
		{ text = "Set 20 Reputation", callback = set_reputation_1 },
		{ text = "Set 30 Reputation", callback = set_reputation_2 },
		{ text = "Set 40 Reputation", callback = set_reputation_3 },
		{ text = "Set 50 Reputation", callback = set_reputation_4 },
		{ text = "Set 60 Reputation", callback = set_reputation_5 },
		{ text = "Set 70 Reputation", callback = set_reputation_6 },
		{ text = "Set 80 Reputation", callback = set_reputation_7 },
		{ text = "Set 90 Reputation", callback = set_reputation_8 },
		{ text = "Set 100 Reputation", callback = set_reputation_9 },
		{ text = "Reset Reputation", callback = reset_reputation },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_reputation_options = call_set_reputation_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Reputation Options", set_reputation_options)

add_money_options = add_money_options or 
	{
		{},
		{ text = "Add 1 Milion $ Money", callback = add_money_1 },
		{ text = "Add 10 Milion $ Money", callback = add_money_2 },
		{ text = "Add 100 Milion $ Money", callback = add_money_3 },
		{ text = "Add 1 Bilion $ Money", callback = add_money_4 },
		{ text = "Add 10 Bilion $ Money", callback = add_money_5 },
		{ text = "Add 100 Bilion $ Money", callback = add_money_6 },
		{ text = "Add 1 Trilion $ Money", callback = add_money_7 },
		{ text = "Add 10 Trilion $ Money", callback = add_money_8 },
		{ text = "Add 100 Trilion $ Money", callback = add_money_9 },
		{ text = "Reset Money", callback = reset_money },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_add_money_options = call_add_money_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Add Money Options", add_money_options)

set_skill_points_options = set_skill_points_options or 
	{
		{},
		{ text = "Set 120 Skill Points", callback = set_skill_points },
		{ text = "Reset Skills", callback = reset_skill_points },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_skill_points_options = call_set_skill_points_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Skills Options", set_skill_points_options)

set_crime_spree_options = set_crime_spree_options or 
	{
		{},
		{ text = "Add 1 Thousand Crime Spree Level", callback = set_crime_spree_1 },
		{ text = "Add 10 Thousand Crime Spree Level", callback = set_crime_spree_2 },
		{ text = "Add 100 Thousand Crime Spree Level", callback = set_crime_spree_3 },
		{ text = "Add 400 Thousand Crime Spree Level", callback = set_crime_spree_4 },
		{ text = "Add 600 Thousand Crime Spree Level", callback = set_crime_spree_5 },
		{ text = "Add 800 Thousand Crime Spree Level", callback = set_crime_spree_6 },
		{ text = "Add 1 Milion Crime Spree Level", callback = set_crime_spree_7 },
		{ text = "Add 10 Milion Crime Spree Level", callback = set_crime_spree_8 },
		{ text = "Add 100 Milion Crime Spree Level", callback = set_crime_spree_9 },
		{ text = "Reset Crime Spree Level", callback = reset_crime_spree },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_crime_spree_options = call_set_crime_spree_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Crime Spree Options", set_crime_spree_options)

give_perk_decks_options = give_perk_decks_options or 
	{
		{},
		{ text = "Give All Perk Decks", callback = give_all_perk_decks },
		{ text = "Reset All Perk Decks", callback = reset_all_perk_decks },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_give_all_perk_decks_options = call_give_all_perk_decks_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Give All Perk Decks Options", give_perk_decks_options)

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
call_player_progress_options = call_player_progress_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Progress Options", player_progress_options)