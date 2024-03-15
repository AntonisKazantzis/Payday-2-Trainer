toggleNoArmorSpeedPenalty = not toggleNoArmorSpeedPenalty

local orig_movement_speed_multiplier = PlayerManager.movement_speed_multiplier

if toggleNoArmorSpeedPenalty then
    function PlayerManager:movement_speed_multiplier(...)
        orig_movement_speed_multiplier(self, ...)
        self.armor_penalty = 0
    end

    managers.mission._fading_debug_output:script().log('No Armor Speed Penalty - Activated', Color.green)
else
    function PlayerManager:movement_speed_multiplier(...)
        orig_movement_speed_multiplier(self, ...)
    end

    managers.mission._fading_debug_output:script().log('No Armor Speed Penalty - Deactivated', Color.red)
end
