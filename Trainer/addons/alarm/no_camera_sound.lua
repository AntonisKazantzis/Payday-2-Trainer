toggleNoCameraSound = not toggleNoCameraSound

local orig_set_suspicion_sound = SecurityCamera._set_suspicion_sound

if toggleNoCameraSound then
    function SecurityCamera:_set_suspicion_sound(...)
    end

    managers.mission._fading_debug_output:script().log('No Camera Sound - Activated', Color.green)
else
    function SecurityCamera:_set_suspicion_sound(...)
        orig_set_suspicion_sound(self, ...)
    end
    managers.mission._fading_debug_output:script().log('No Camera Sound - Deactivated', Color.red)

end
