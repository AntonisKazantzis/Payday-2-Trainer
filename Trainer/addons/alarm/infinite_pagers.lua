toggleInfinitePagers = not toggleInfinitePagers

local orig_on_successful_alarm_pager_bluff = GroupAIStateBase.on_successful_alarm_pager_bluff

if toggleInfinitePagers then
    function GroupAIStateBase:on_successful_alarm_pager_bluff()
    end

    managers.mission._fading_debug_output:script().log('Infinite Pagers - Activated', Color.green)
else
    function GroupAIStateBase:on_successful_alarm_pager_bluff()
        orig_on_successful_alarm_pager_bluff(self)
    end

    managers.mission._fading_debug_output:script().log('Infinite Pagers - Deactivated', Color.red)
end
