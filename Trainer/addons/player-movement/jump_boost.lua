toggleJumpBoost = not toggleJumpBoost

local PlayerStandard_perform_jump = PlayerStandard._perform_jump

if toggleJumpBoost then
    function PlayerStandard:_perform_jump(jump_vec, ...)
        local v = math.UP * 470

        if not self._running then
            v = math.UP * 470 * 3
        end

        self._unit:mover():set_velocity(v)
    end

    managers.mission._fading_debug_output:script().log('Jump Boost - Activated', Color.green)
else
    function PlayerStandard:_perform_jump(...)
        PlayerStandard_perform_jump(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Jump Boost - Deactivated', Color.red)
end
