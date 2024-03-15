toggleNoCashPenalty = not toggleNoCashPenalty

local orig_get_civilian_deduction = MoneyManager.get_civilian_deduction
local orig_civilian_killed = MoneyManager.civilian_killed

if toggleNoCashPenalty then
    function MoneyManager:get_civilian_deduction()
        return 0
    end

    function MoneyManager:civilian_killed()
        return
    end

    managers.mission._fading_debug_output:script().log("No Cash Penalty - Activated", Color.green)
else
    function MoneyManager:get_civilian_deduction()
        orig_get_civilian_deduction(self)
    end

    function MoneyManager:civilian_killed()
        orig_civilian_killed(self)
    end

    managers.mission._fading_debug_output:script().log("No Cash Penalty - Deactivated", Color.red)
end
