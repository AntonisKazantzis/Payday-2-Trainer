toggleNoCameraRotation = not toggleNoCameraRotation

local orig_enter = PlayerCarry.enter

if toggleNoCameraRotation then
    function PlayerCarry:enter(...)
        PlayerCarry.super.enter(self, ...)
        self._unit:camera():camera_unit():base():set_target_tilt(0)
    end

    managers.mission._fading_debug_output:script().log('No Camera Rotation When Holding A Bag - Activated', Color.green)
else
    function PlayerCarry:enter(...)
        orig_enter(self, ...)
    end

    managers.mission._fading_debug_output:script().log('No Camera Rotation When Holding A Bag - Deactivated', Color.red)
end
