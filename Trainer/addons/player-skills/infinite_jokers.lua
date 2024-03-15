toggleInfiniteJokers = not toggleInfiniteJokers

local PlayerManager_upgrade_value = PlayerManager.upgrade_value

if toggleInfiniteJokers then
    function PlayerManager:upgrade_value(category, upgrade, default)
        if category == "player" and upgrade == "convert_enemies" then
            return true
        elseif category == "player" and upgrade == "convert_enemies_max_minions" then
            return 500
        else
            return PlayerManager_upgrade_value(self, category, upgrade, default)
        end
    end

    managers.mission._fading_debug_output:script().log('Infinite Jokers - Activated', Color.green)
else
    function PlayerManager:upgrade_value(category, upgrade, default)
        if category == "player" and upgrade == "convert_enemies" then
            return true
        elseif category == "player" and upgrade == "convert_enemies_max_minions" then
            return 2
        else
            return PlayerManager_upgrade_value(self, category, upgrade, default)
        end
    end

    managers.mission._fading_debug_output:script().log('Infinite Jokers - Deactivated', Color.red)
end
