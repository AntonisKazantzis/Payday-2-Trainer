toggleNoPagers = not toggleNoPagers

local orig_post_init = CopBrain.post_init
local cop_data = {"security", "city_swat", "gensec", "bolivian", "bolivian_indoors"}

if toggleNoPagers then
    function CopBrain:post_init(...)
        orig_post_init(self, ...)

        for k, v in pairs(cop_data) do
            self._unit:unit_data().has_alarm_pager = false
        end
    end

    managers.mission._fading_debug_output:script().log("No Pagers - Activated", Color.green)
else
    function CopBrain:post_init(...)
        orig_post_init(self, ...)
    end

    managers.mission._fading_debug_output:script().log("No Pagers - Deactivated", Color.red)
end
