max_safehouse_rooms = max_safehouse_rooms or function(info)
    local M_safehouse = managers.custom_safehouse
    local G_safehouse = Global.custom_safehouse_manager

    local function max_rooms_tier()
        for room_id, data in pairs(G_safehouse.rooms) do
            local max_tier = data.tier_max

            local current_tier = M_safehouse:get_room_current_tier(room_id)
            while max_tier > current_tier do
                current_tier = current_tier + 1

                local unlocked_tiers = M_safehouse._global.rooms[room_id].unlocked_tiers
                tab_insert(unlocked_tiers, current_tier)
            end

            M_safehouse:set_room_tier(room_id, max_tier)
        end
    end

    max_rooms_tier()
end

local function setContinentalCoins(value)
    return function(info)
        Global.custom_safehouse_manager.total = Application:digest_value(value, true)
    end
end

reset_continental_coins = reset_continental_coins or function(info)

    local function reset_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(0, true)
    end

    reset_continental_coins()
end

disable_safehouse_raid = disable_safehouse_raid or function(info)

    function CustomSafehouseManager:is_being_raided()
        return false
    end
end

complete_all_trophies = complete_all_trophies or function(info)
    local function unlock_safehouse_trophies()
        local M_safehouse = managers.custom_safehouse
        local trophies = M_safehouse:trophies()

        for _, trophy in pairs(trophies) do
            for objective_id in pairs(trophy.objectives) do
                local objective = trophy.objectives[objective_id]
                objective.verify = false
                M_safehouse:on_achievement_progressed(objective.progress_id, objective.max_progress)
            end
        end
    end

    unlock_safehouse_trophies()
end

complete_all_achievements = complete_all_achievements or function(info)
    local M_achievement = managers.achievement
    local _award = M_achievement.award
    local _award_steam = M_achievement.award_steam
    local _award_epic = M_achievement.award_epic

    local function complete_achievements()
        for id in pairs(M_achievement.achievements) do
            _award(M_achievement, id)
            _award_steam(M_achievement, id)
            _award_epic(M_achievement, id)
        end
    end

    complete_achievements()
end

lock_all_achievements = lock_all_achievements or function(info)
	local M_achievement = managers.achievement
	
    local function lock_achievements()
		M_achievement:clear_all_steam()
	end

    lock_achievements()
end

call_safehouse = call_safehouse or function()
    openmenu(call_safehouse_options)
end

call_set_continental_coins = call_set_continental_coins or function()
    openmenu(call_set_continental_coins_options)
end

back_to_player_progress_options = back_to_player_progress_options or function()
    openmenu(call_player_progress_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

set_continental_coins_options = set_continental_coins_options or 
	{
		{},
		{ text = "Add 1 Milion Continental Coins", callback = setContinentalCoins(1000000) },
		{ text = "Add 10 Milion Continental Coins", callback = setContinentalCoins(10000000) },
		{ text = "Add 100 Milion Continental Coins", callback = setContinentalCoins(100000000) },
		{ text = "Add 1 Bilion Continental Coins", callback = setContinentalCoins(100000000) },
		{ text = "Add 10 Bilion Continental Coins", callback = setContinentalCoins(1000000000) },
		{ text = "Add 100 Bilion Continental Coins", callback = setContinentalCoins(10000000000) },
		{ text = "Add 1 Trilion Continental Coins", callback = setContinentalCoins(100000000000) },
		{ text = "Add 10 Trilion Continental Coins", callback = setContinentalCoins(1000000000000) },
		{ text = "Add 100 Trilion Continental Coins", callback = setContinentalCoins(10000000000000) },
		{},
		{ text = "Reset Continental Coins", callback = reset_continental_coins },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_continental_coins_options = call_set_continental_coins_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Set Continental Coins Options", set_continental_coins_options)

safehouse_options = safehouse_options or 
	{
		{},
		{ text = "Max Safehouse Rooms", callback = max_safehouse_rooms },
		{ text = "Set Continental Coins Menu", callback = call_set_continental_coins },
		{ text = "Disable Safe House Raid", callback = disable_safehouse_raid },
		{ text = "Complete All Trophies", callback = complete_all_trophies },
		{ text = "Complete All Achievements", callback = complete_all_achievements },
		{ text = "Lock All Achievements", callback = lock_all_achievements },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_safehouse_options = call_safehouse_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Safehouse Options", safehouse_options)