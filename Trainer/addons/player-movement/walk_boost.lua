toggleWalkBoost = not toggleWalkBoost

if toggleWalkBoost then
    tweak_data.player.movement_state.standard.movement.multiplier.walk = 5

    managers.mission._fading_debug_output:script().log('Walk Boost - Activated', Color.green)
else
    tweak_data.player.movement_state.standard.movement.multiplier.walk = 1

    managers.mission._fading_debug_output:script().log('Walk Boost - Deactivated', Color.red)
end
