togglePrevents = not togglePrevents

local orig_action_request = CopMovement.action_request

if togglePrevents then
    function CopMovement:action_request(action_desc, ...)
        if action_desc.variant == "run" then
            return false
        end

        return orig_action_request(self, action_desc, ...)
    end

    managers.mission._fading_debug_output:script().log('Prevent Panic Buttons & Intel Burning - Activated', Color.green)
else
    function CopMovement:action_request(...)
        orig_action_request(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Prevent Panic Buttons & Intel Burning - Deactivated', Color.red)
end
