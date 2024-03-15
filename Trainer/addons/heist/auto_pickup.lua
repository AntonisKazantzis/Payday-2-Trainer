toggleAutoPickup = not toggleAutoPickup

local orig_update_targeted = ObjectInteractionManager._update_targeted

ObjectInteractionManager.AUTO_PICKUP_DELAY = 0.01

if toggleAutoPickup then
    function ObjectInteractionManager:_update_targeted(...)
        orig_update_targeted(self, ...)

        if alive(self._active_unit) then
            local t = Application:time()

            if self._active_unit:base() and self._active_unit:base().small_loot and
                (t >= (self._next_auto_pickup_t or 0)) then
                self._next_auto_pickup_t = t + ObjectInteractionManager.AUTO_PICKUP_DELAY
                self:interact(managers.player:player_unit())
            end
        end
    end

    managers.mission._fading_debug_output:script().log('Auto Pickup - Activated', Color.green)
else
    function ObjectInteractionManager:_update_targeted(...)
        orig_update_targeted(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Auto Pickup - Deactivated', Color.red)
end
