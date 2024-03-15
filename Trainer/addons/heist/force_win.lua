local pairs = pairs
local Application = Application
local digest_value = Application.digest_value
local Global = Global
local G_game_settings = Global.game_settings
local managers = managers
local M_network = managers.network
local M_loot = managers.loot
local secure_small_loot = M_loot.secure_small_loot
local get_secured_bonus_bags_amount = M_loot.get_secured_bonus_bags_amount
local tweak_data = tweak_data
local T_levels = tweak_data.levels
local T_money = tweak_data.money_manager
local T_M_bag_values = tweak_data.money_manager.bag_values

local BEST_BAG = false

local get_the_most_expensive_bag = function()
    local best_val = 0
    local best_bag = ''
    local A = Application
    local digest_value = digest_value

    for name, val in pairs(T_M_bag_values) do
        val = digest_value(A, val, false)
        if (val > best_val) then
            best_val = val
            best_bag = name
        end
    end

    if (best_bag == '') then
        best_bag = 'hope_diamond'
    end

    BEST_BAG = best_bag

    return best_bag
end

local secure_rupies = function()
    local level = G_game_settings.level_id

    if (level) then
        local bag_limit = T_levels[level].max_bags or 20
        local best_bag = BEST_BAG or get_the_most_expensive_bag()
        local secure = M_loot.secure

        for i = get_secured_bonus_bags_amount(M_loot) + 1, bag_limit do
            secure(M_loot, best_bag, 1, true)
        end
    end
end

local add_some_cash = function()
    for i = 1, 50 do
        secure_small_loot(M_loot, "gen_atm", 3)
    end
end

local you_winner = function()

    secure_rupies()
    add_some_cash()

    local num_winners = M_network:session():amount_of_alive_players()

    M_network._session:send_to_peers("mission_ended", true, num_winners)

    game_state_machine:change_state_by_name("victoryscreen", {
        num_winners = num_winners,
        personal_win = true
    })
end

you_winner()