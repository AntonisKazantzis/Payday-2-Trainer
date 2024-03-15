toggleClimbBoost = not toggleClimbBoost

if toggleClimbBoost then
    tweak_data.player.movement_state.standard.movement.multiplier.climb = 5

    managers.mission._fading_debug_output:script().log('Climb Boost - Activated', Color.green)
else
    tweak_data.player.movement_state.standard.movement.multiplier.climb = 1

    managers.mission._fading_debug_output:script().log('Climb Boost - Deactivated', Color.red)
end
