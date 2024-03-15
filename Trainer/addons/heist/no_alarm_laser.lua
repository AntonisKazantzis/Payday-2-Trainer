toggleNoAlarmLaser = not toggleNoAlarmLaser

local orig_on_executed = ElementLaserTrigger.on_executed

if toggleNoAlarmLaser then
    function ElementLaserTrigger:on_executed(...)
    end

    managers.mission._fading_debug_output:script().log('No All Non-Static Alarm Lasers - Activated', Color.green)
else
    function ElementLaserTrigger:on_executed(...)
        orig_on_executed(self, ...)
    end

    managers.mission._fading_debug_output:script().log('No All Non-Static Alarm Lasers - Deactivated', Color.red)
end
