toggleNoCameraLimit = not toggleNoCameraLimit

local orig_set_limits = FPCameraPlayerBase.set_limits

if toggleNoCameraLimit then
    function FPCameraPlayerBase:set_limits(...)
    end

    managers.mission._fading_debug_output:script().log('No Camera Limit - Activated', Color.green)
else
    function FPCameraPlayerBase:set_limits(...)
        orig_set_limits(self, ...)
    end

    managers.mission._fading_debug_output:script().log('No Camera Limit - Deactivated', Color.red)
end
