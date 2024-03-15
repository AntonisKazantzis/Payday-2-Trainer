local managers = managers
local M_player = managers.player
local players_list = M_player._players
local set_player_state = M_player.set_player_state
local add_grenade_amount = M_player.add_grenade_amount
local alive = alive
local ply = players_list[1]

local function replenish_player()
    if alive(ply) then
        ply:base():replenish()
        set_player_state(M_player, 'standard')
        add_grenade_amount(M_player, 3)
    end
end

replenish_player()
