local Vector3 = Vector3
local managers = managers
local M_player = managers.player
local M_enemy = managers.enemy

local function dmg_melee(unit)
    if unit then
        local action_data = {
            damage = math.huge,
            damage_effect = unit:character_damage()._HEALTH_INIT * 2,
            attacker_unit = M_player:player_unit(),
            attack_dir = Vector3(0, 0, 0),
            name_id = 'rambo',
            col_ray = {
                position = unit:position(),
                body = unit:body("body")
            }
        }
        unit:unit_data().has_alarm_pager = false
        unit:character_damage():damage_melee(action_data)
    end
end

for _, ud in pairs(M_enemy:all_enemies()) do
    pcall(dmg_melee, ud.unit)
end
