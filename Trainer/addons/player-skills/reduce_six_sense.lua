toggleReduceSixSense = not toggleReduceSixSense

if toggleReduceSixSense then
    tweak_data.player.omniscience.start_t = 0
    tweak_data.player.omniscience.interval_t = 1
    tweak_data.player.omniscience.sense_radius = 1000
    tweak_data.player.omniscience.target_resense_t = 15

    managers.mission._fading_debug_output:script().log('Reduce Six Sense - Activated', Color.green)
else
    tweak_data.player.omniscience.start_t = 3.5
    tweak_data.player.omniscience.interval_t = 1
    tweak_data.player.omniscience.sense_radius = 1000
    tweak_data.player.omniscience.target_resense_t = 15

    managers.mission._fading_debug_output:script().log('Reduce Six Sense - Deactivated', Color.red)
end
