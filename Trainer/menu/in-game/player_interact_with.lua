local pairs = pairs
local insert = table.insert
local M_player = managers.player
local ply_list = M_player._players
local M_interaction = managers.interaction

function interactbytweak(...)
    local player = ply_list[1]
    if not player then
        return
    end
    local interactives = {}
    local tweaks = {}
    for _, arg in pairs({...}) do
        tweaks[arg] = true
    end
    for key, unit in pairs(M_interaction._interactive_units) do
        local interaction = unit.interaction
        interaction = interaction and interaction(unit)
        if interaction and tweaks[interaction.tweak_data] then
            insert(interactives, interaction)
        end
    end
    for _, i in pairs(interactives) do
        i:interact(player)
    end
end

local function grabsmallloot()
    interactbytweak("cut_glass", "crate_loot", "crate_loot_crowbar", "safe_loot_pickup", "diamond_pickup",
        "tiara_pickup", "money_wrap_single_bundle", "invisible_interaction_open", "mus_pku_artifact")
end

grab_all_small_loot = grab_all_small_loot or function()
    grabsmallloot()

    managers.mission._fading_debug_output:script().log("Grab All Small Loot - Activated", Color.green)
end

local function graballbigloot()

    interactbytweak("trai_printing_plates_carry", "diamond_pickup", "red_diamond_pickup", "diamonds_pickup_full",
        "diamonds_pickup", "shape_charge_plantable", "gen_pku_cocaine_pure", "money_small", "money_scanner",
        "money_luggage", "money_wrap", "money_bag", "corpse_dispose", "hold_pku_drk_bomb_part", "hold_take_server",
        "weapon", "ammo", "painting", "old_wine", "ordinary_wine", "drk_bomb_part", "evidence_bag", "coke", "coke_pure",
        "diamond_necklace", "diamonds", "artifact_statue", "prototype", "yayo", "meth_half", "samurai_armor", "turret",
        "roman_armor", "samurai_suit", "weapons", "carry_drop", "painting_carry_drop", "money_wrap", "gen_pku_jewelry",
        "taking_meth", "gen_pku_cocaine", "take_weapons", "gold_pile", "hold_take_painting",
        "invisible_interaction_open", "gen_pku_artifact", "gen_pku_artifact_statue", "gen_pku_artifact_painting")

end

grab_all_big_loot = grab_all_big_loot or function()
    graballbigloot()

    managers.mission._fading_debug_output:script().log("Grab All Big Loot - Activated", Color.green)
end

local function quicklyrobstuff()
    interactbytweak("weapon_case", "cash_register", "requires_ecm_jammer_atm", "pick_lock_hard",
        "pick_lock_hard_no_skill", "pick_lock_deposit_transport", "gage_assignment")
end

quickly_rob_stuff = quickly_rob_stuff or function()
    quicklyrobstuff()

    managers.mission._fading_debug_output:script().log("Quickly Rob Stuff - Activated", Color.green)
end

local function openalldoors()
    interactbytweak("cas_open_door", "open_door_with_keys", "requires_ecm_jammer_double", "requires_ecm_jammer",
        "cas_security_door", "cas_open_securityroom_door", "pick_lock_easy_no_skill", "pick_lock_hard_no_skill",
        "pick_lock_hard", "open_from_inside", "open_train_cargo_door")
end

open_all_doors = open_all_doors or function()
    openalldoors()

    managers.mission._fading_debug_output:script().log("Open All Doors - Activated", Color.green)
end

local function drillupgall()
    interactbytweak("drill", "drill_upgrade", "drill_jammed", "lance_upgrade", "lance_jammed", "huge_lance_jammed")
end

upgrade_fix_drills = upgrade_fix_drills or function()
    drillupgall()

    managers.mission._fading_debug_output:script().log("Upgrade/Fix All Drills - Activated", Color.green)
end

local function barricadestuff()
    interactbytweak("stash_planks", "need_boards")
end

barricade_stuff = barricade_stuff or function()
    barricadestuff()

    managers.mission._fading_debug_output:script().log("Barricade Stuff - Activated", Color.green)
end

local function openatms()
    interactbytweak("requires_ecm_jammer_atm")
end

open_all_atms = open_all_atms or function()
    openatms()
    
    managers.mission._fading_debug_output:script().log("Open All ATMs - Activated", Color.green)
end

local function testopenallvaults()
    interactbytweak("pick_lock_hard", "pick_lock_hard_no_skill", "pick_lock_deposit_transport")
end

open_all_vaults = open_all_vaults or function()
    testopenallvaults()

    managers.mission._fading_debug_output:script().log("Open All Vaults - Activated", Color.green)
end

local function graballgagepackages()
    interactbytweak("gage_assignment")
end

grab_all_gage_assignments = grab_all_gage_assignments or function()
    graballgagepackages()

    managers.mission._fading_debug_output:script().log("Grab All Gage Assignments - Activated", Color.green)
end

grab_everything = grab_everything or function()
    local function grabeverything()
        grabsmallloot()
        graballbigloot()
        graballgagepackages()
    end

    grabeverything()

    managers.mission._fading_debug_output:script().log("Grab Eveything - Activated", Color.green)
end

call_player_interact_with = call_player_interact_with or function()
    openmenu(call_player_interact_with_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

player_interact_with_options = player_interact_with_options or 
	{
		{},
		{ text = "Grab All Small Loot [Host/Client]", callback = grab_all_small_loot },
		{ text = "Grab All Big Loot [Host/Client]", callback = grab_all_big_loot },
		{ text = "Quickly Rob Stuff [Host/Client]", callback = quickly_rob_stuff },
		{ text = "Upgrade Or Fix All Drills [Host/Client]", callback = upgrade_fix_drills },
		{ text = "Open All Doors [Host/Client]", callback = open_all_doors },
		{ text = "Barricade Stuff [Host/Client]", callback = barricade_stuff },
		{ text = "Open All ATMs [Host/Client]", callback = open_all_atms },
		{ text = "Open All Vaults [Host/Client]", callback = open_all_vaults },
		{ text = "Grab All Gage Assignments [Host/Client]", callback = grab_all_gage_assignments },
		{ text = "Grab Everything [Host/Client]", callback = grab_everything },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_interact_with_options = call_player_interact_with_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Interact With Options", player_interact_with_options)