toggleNoHitDisorientation = not toggleNoHitDisorientation

local orig_hit_feedback_front = CoreEnvironmentControllerManager.hit_feedback_front
local orig_hit_feedback_back = CoreEnvironmentControllerManager.hit_feedback_back
local orig_hit_feedback_right = CoreEnvironmentControllerManager.hit_feedback_right
local orig_hit_feedback_left = CoreEnvironmentControllerManager.hit_feedback_left
local orig_hit_feedback_up = CoreEnvironmentControllerManager.hit_feedback_up
local orig_hit_feedback_down = CoreEnvironmentControllerManager.hit_feedback_down

if toggleNoHitDisorientation then
    function CoreEnvironmentControllerManager:hit_feedback_front()
    end

    function CoreEnvironmentControllerManager:hit_feedback_back()
    end

    function CoreEnvironmentControllerManager:hit_feedback_right()
    end

    function CoreEnvironmentControllerManager:hit_feedback_left()
    end

    function CoreEnvironmentControllerManager:hit_feedback_up()
    end

    function CoreEnvironmentControllerManager:hit_feedback_down()
    end

    managers.mission._fading_debug_output:script().log("No Hit Disorientation - Activated", Color.green)
else
    function CoreEnvironmentControllerManager:hit_feedback_front()
        orig_hit_feedback_front(self)
    end

    function CoreEnvironmentControllerManager:hit_feedback_back()
        orig_hit_feedback_back(self)
    end

    function CoreEnvironmentControllerManager:hit_feedback_right()
        orig_hit_feedback_right(self)
    end

    function CoreEnvironmentControllerManager:hit_feedback_left()
        orig_hit_feedback_left(self)
    end

    function CoreEnvironmentControllerManager:hit_feedback_up()
        orig_hit_feedback_up(self)
    end

    function CoreEnvironmentControllerManager:hit_feedback_down()
        orig_hit_feedback_down(self)
    end

    managers.mission._fading_debug_output:script().log("No Hit Disorientation - Deactivated", Color.red)
end
