toggleMaxCritChance = not toggleMaxCritChance

local UpgradesTweakData_init_pd2_values = UpgradesTweakData._init_pd2_values

if toggleMaxCritChance then
    function UpgradesTweakData:_init_pd2_values()
        UpgradesTweakData_init_pd2_values(self, tweak_data)
        self.values.player.detection_risk_add_crit_chance = {{1, 1, "below", 999, 1}, {1, 1, "below", 999, 1}}
    end

    managers.mission._fading_debug_output:script().log('Max Crit Chance - Activated', Color.green)
else
    function UpgradesTweakData:_init_pd2_values()
        UpgradesTweakData_init_pd2_values(self, tweak_data)
        self.values.player.detection_risk_add_crit_chance = {{0.03, 3, "below", 35, 0.3}, {0.03, 1, "below", 35, 0.3}}
    end

    managers.mission._fading_debug_output:script().log('Max Crit Chance - Deactivated', Color.red)
end
