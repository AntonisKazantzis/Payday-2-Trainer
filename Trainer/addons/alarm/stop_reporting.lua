toggleStopReporting = not toggleStopReporting

local orig_clbk_chk_call_the_police = CivilianLogicFlee.clbk_chk_call_the_police

if toggleStopReporting then
    function CivilianLogicFlee.clbk_chk_call_the_police(...)
    end

    managers.mission._fading_debug_output:script().log('Stops Civilians From Reporting You To The Police - Activated',
        Color.green)
else
    function CivilianLogicFlee.clbk_chk_call_the_police(...)
        orig_clbk_chk_call_the_police(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Stops Civilians From Reporting You To The Police - Deactivated',
        Color.red)
end
