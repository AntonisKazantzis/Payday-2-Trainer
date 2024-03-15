toggleStopCallingPolice = not toggleStopCallingPolice

local GroupAIStateBase_on_police_called = GroupAIStateBase.on_police_called

if toggleStopCallingPolice then
    function GroupAIStateBase:on_police_called(...)
    end

    managers.mission._fading_debug_output:script().log(
        'Makes Gaurds And People In General Stop Calling The Police - Activated', Color.green)
else
    function GroupAIStateBase:on_police_called(...)
        GroupAIStateBase_on_police_called(self, ...)
    end

    managers.mission._fading_debug_output:script().log(
        'Makes Gaurds And People In General Stop Calling The Police - Deactivated', Color.red)
end
