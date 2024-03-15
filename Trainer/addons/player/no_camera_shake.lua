toggleNoCameraShake = not toggleNoCameraShake

local orig_play_shaker = PlayerCameraManager.play_shaker

if toggleNoCameraShake then
    function PlayerCamera:play_shaker()
    end

    managers.mission._fading_debug_output:script().log("No Camera Shake - Activated", Color.green)
else
    function PlayerCamera:play_shaker()
        orig_play_shaker(self)
    end

    managers.mission._fading_debug_output:script().log("No Camera Shake - Deactivated", Color.red)
end
