toggleInstantInteractions = not toggleInstantInteractions

local BaseInteractionExt_get_timer = BaseInteractionExt._get_timer

if toggleInstantInteractions then
    local arr = {"driving_drive", "corpse_alarm_pager"}

    function BaseInteractionExt:_get_timer()
        for _, item in pairs(arr) do
            if self.tweak_data == item then
                return BaseInteractionExt_get_timer(self)
            end
        end

        return 0
    end

    managers.mission._fading_debug_output:script().log('Instant Interactions - Activated', Color.green)
else
    function BaseInteractionExt:_get_timer()
        return original_get_timer(self)
    end

    managers.mission._fading_debug_output:script().log('Instant Interactions - Deactivated', Color.red)
end
