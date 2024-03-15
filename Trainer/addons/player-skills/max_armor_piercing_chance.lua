toggleMaxArmorPiercingChance = not toggleMaxArmorPiercingChance

local PlayerManager_upgrade_value = PlayerManager.upgrade_value

if toggleMaxArmorPiercingChance then
    function PlayerManager:upgrade_value(category, upgrade, default, ...)
        if category == "weapon" and upgrade == "armor_piercing_chance" then
            return 1
        elseif category == "weapon" and upgrade == "armor_piercing_chance_silencer" then
            return 1
        else
            return PlayerManager_upgrade_value(self, category, upgrade, default, ...)
        end
    end

    managers.mission._fading_debug_output:script().log('Max Armor Piercing Chance - Activated', Color.green)
else
    function PlayerManager:upgrade_value(...)
        PlayerManager_upgrade_value(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Max Armor Piercing Chance - Deactivated', Color.red)
end
