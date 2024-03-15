toggleInfiniteEquipment = not toggleInfiniteEquipment

local PlayerManager_remove_equipment = PlayerManager.remove_equipment

if toggleInfiniteEquipment then
    function PlayerManager:remove_equipment(...)
    end

    managers.mission._fading_debug_output:script().log('Infinite Equipment - Activated', Color.green)
else
    function PlayerManager:remove_equipment(...)
        PlayerManager_remove_equipment(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Infinite Equipment - Deactivated', Color.red)
end
