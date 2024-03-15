local AI_State = managers.groupai:state()
local convert_hostage_to_criminal = AI_State.convert_hostage_to_criminal
local all_enemies = managers.enemy:all_enemies()

local function convert_all_enemies()
    for _, ud in pairs(all_enemies) do
        local unit = ud.unit

        if not unit:brain()._logic_data.is_converted then
            pcall(convert_hostage_to_criminal, AI_State, unit)
        end
    end
end

convert_all_enemies()
