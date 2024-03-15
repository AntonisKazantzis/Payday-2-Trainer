toggleNoDetectionInCasing = not toggleNoDetectionInCasing

local orig_init = PlayerMaskOff.init

PlayerMaskOff = PlayerMaskOff or class(PlayerStandard)

if toggleNoDetectionInCasing then
    function PlayerMaskOff:init(unit)
        PlayerMaskOff.super.init(self, unit)
        self._mask_off_attention_settings = {"pl_civilian"}
    end

    managers.mission._fading_debug_output:script().log("No Detection In Casing - Activated", Color.green)
else
    function PlayerMaskOff:init(...)
        orig_init(self, ...)
    end

    managers.mission._fading_debug_output:script().log("No Detection In Casing - Deactivated", Color.red)
end
