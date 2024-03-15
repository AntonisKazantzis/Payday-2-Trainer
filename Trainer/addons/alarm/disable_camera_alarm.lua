toggleDisableCameraAlarm = not toggleDisableCameraAlarm

local orig_sound_the_alarm = SecurityCamera._sound_the_alarm

if toggleDisableCameraAlarm then
    function SecurityCamera:_sound_the_alarm(...)
    end

    managers.mission._fading_debug_output:script().log('Disable Camera Alarm - Activated', Color.green)
else
    function SecurityCamera:_sound_the_alarm(...)
        orig_sound_the_alarm(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Disable Camera Alarm - Deactivated', Color.red)
end
