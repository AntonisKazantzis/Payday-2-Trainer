local AI_State = managers.groupai:state()
local convert_hostage_to_criminal = AI_State.convert_hostage_to_criminal
local all_enemies = managers.enemy:all_enemies()
local p2t_require = p2t_require
local pcall = pcall
local pairs = pairs

if not p2t_config.infinite_converts then
    p2t_require("Trainer/addons/player-skills/infinite_converts")
end

local function convert_all_enemies()
    for _, ud in pairs(all_enemies) do
        local unit = ud.unit
        local brain = unit:brain()

        if brain and brain._logic_data and not brain._logic_data.is_converted then
            pcall(convert_hostage_to_criminal, AI_State, unit)
        end
    end
end

convert_all_enemies()
