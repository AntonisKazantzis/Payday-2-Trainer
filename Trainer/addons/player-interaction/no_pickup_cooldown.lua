ToggleNoPickupCooldown = not ToggleNoPickupCooldown

local orig_carry_blocked_by_cooldown = PlayerManager.carry_blocked_by_cooldown
local orig_action_interact_forbidden = PlayerStandard._action_interact_forbidden

if ToggleNoPickupCooldown then
    function PlayerManager:carry_blocked_by_cooldown()
        return false
    end

    function PlayerStandard:_action_interact_forbidden()
        return false
    end

    managers.mission._fading_debug_output:script().log('No Pickup Cooldown - Activated', Color.green)
else
    function PlayerManager:carry_blocked_by_cooldown()
        orig_carry_blocked_by_cooldown(self)
    end

    function PlayerStandard:_action_interact_forbidden()
        orig_action_interact_forbidden(self)
    end

    managers.mission._fading_debug_output:script().log('No Pickup Cooldown - Deactivated', Color.red)
end
