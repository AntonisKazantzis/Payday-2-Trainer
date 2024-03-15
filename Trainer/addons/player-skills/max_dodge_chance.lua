toggleMaxDodgeChance = not toggleMaxDodgeChance

local PlayerManager_upgrade_value = PlayerManager.upgrade_value

if toggleMaxDodgeChance then
    function PlayerManager:upgrade_value(category, upgrade, default, ...)
        if category == "player" and upgrade == "passive_dodge_chance" then
            return 1
        elseif category == "player" and upgrade == "run_dodge_chance" then
            return 1
        else
            return PlayerManager_upgrade_value(self, category, upgrade, default, ...)
        end
    end

    managers.mission._fading_debug_output:script().log('Max Dodge Chance - Activated', Color.green)
else
    function PlayerManager:upgrade_value(...)
        PlayerManager_upgrade_value(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Max Dodge Chance - Deactivated', Color.red)
end
