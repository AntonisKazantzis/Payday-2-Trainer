toggleInstantMaskOn = not toggleInstantMaskOn

if toggleInstantMaskOn then
    tweak_data.player.put_on_mask_time = 0

    managers.mission._fading_debug_output:script().log("Instant Mask On - Activated", Color.green)
else
    tweak_data.player.put_on_mask_time = 3

    managers.mission._fading_debug_output:script().log("Instant Mask On - Deactivated", Color.red)
end
