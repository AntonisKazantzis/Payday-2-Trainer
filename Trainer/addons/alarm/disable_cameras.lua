toggleDisableCameras = not toggleDisableCameras

local orig_set_detection_enabled = SecurityCamera.set_detection_enabled

if toggleDisableCameras then
    for _, unit in pairs(SecurityCamera.cameras) do
        if unit:base()._last_detect_t ~= nil then
            unit:base():set_update_enabled(state)
        end
    end

    function SecurityCamera:set_detection_enabled(...)
    end

    managers.mission._fading_debug_output:script().log('Disable Cameras - Activated', Color.green)
else
    for _, unit in pairs(SecurityCamera.cameras) do
        if unit:base()._last_detect_t ~= nil then
            unit:base():set_update_enabled(true)
        end
    end

    function SecurityCamera:set_detection_enabled(...)
        orig_set_detection_enabled(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Disable Cameras - Deactivated', Color.red)
end
