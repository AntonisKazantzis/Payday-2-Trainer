toggleNoPagerOnDomination = not toggleNoPagerOnDomination

local orig_chk_begin_alarm_pager = CopLogicIntimidated._chk_begin_alarm_pager

if toggleNoPagerOnDomination then
    function CopLogicIntimidated._chk_begin_alarm_pager(data)
        if managers.groupai:state():whisper_mode() and data.unit:unit_data().has_alarm_pager then
        end
    end

    managers.mission._fading_debug_output:script().log("No Pager On Domination - Activated", Color.green)
else
    function CopLogicIntimidated._chk_begin_alarm_pager(...)
        orig_chk_begin_alarm_pager(self, ...)
    end

    managers.mission._fading_debug_output:script().log("No Pager On Domination - Deactivated", Color.red)
end
