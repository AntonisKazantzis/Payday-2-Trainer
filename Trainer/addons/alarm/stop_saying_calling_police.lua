toggleStopSayingCallingPolice = not toggleStopSayingCallingPolice

local orig_say_call_the_police = CopLogicArrest._say_call_the_police

if toggleStopSayingCallingPolice then
    function CopLogicArrest._say_call_the_police(...)
    end

    managers.mission._fading_debug_output:script().log(
        'Stops The Police From Saying They Are Calling The Police All The Time - Activated', Color.green)
else
    function CopLogicArrest._say_call_the_police(...)
        orig_say_call_the_police(self, ...)
    end

    managers.mission._fading_debug_output:script().log(
        'Stops The Police From Saying They Are Calling The Police All The Time - Deactivated', Color.red)
end
