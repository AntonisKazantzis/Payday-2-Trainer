toggleInfiniteFavors = not toggleInfiniteFavors

local orig_get_current_budget = PrePlanningManager.get_current_budget

if toggleInfiniteFavors then
    function PrePlanningManager:get_current_budget()
        return 0, 999
    end

    managers.mission._fading_debug_output:script().log("Infinite Favors - Activated", Color.green)
else
    function PrePlanningManager:get_current_budget()
        orig_get_current_budget(self)
    end

    managers.mission._fading_debug_output:script().log("Infinite Favors - Deactivated", Color.red)
end
