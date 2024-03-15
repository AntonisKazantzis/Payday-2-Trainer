ToggleNoPickupCooldown = not ToggleNoPickupCooldown

local orig_carry_blocked_by_cooldown = PlayerManager.carry_blocked_by_cooldown
local orig_action_interact_forbidden = PlayerStandard._action_interact_forbidden
local orig_check_use_item = PlayerStandard._check_use_item

if ToggleNoPickupCooldown then
    function PlayerStandard:_check_use_item(t, input)
        if input.btn_use_item_release and self._throw_time and t and t < self._throw_time then
            managers.player:drop_carry()
            self._throw_time = nil
            return true
        else
            return orig_check_use_item(self, t, input)
        end
    end

    function PlayerManager:carry_blocked_by_cooldown()
        return false
    end

    function PlayerStandard:_action_interact_forbidden()
        return false
    end

    managers.mission._fading_debug_output:script().log('No Pickup Cooldown - Activated', Color.green)
else
    function PlayerStandard:_check_use_item(...)
        orig_check_use_item(self, ...)
    end

    function PlayerManager:carry_blocked_by_cooldown()
        orig_carry_blocked_by_cooldown(self)
    end

    function PlayerStandard:_action_interact_forbidden()
        orig_action_interact_forbidden(self)
    end

    managers.mission._fading_debug_output:script().log('No Pickup Cooldown - Deactivated', Color.red)
end
