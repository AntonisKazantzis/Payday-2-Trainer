toggleRunBoost = not toggleRunBoost

if toggleRunBoost then
    tweak_data.player.movement_state.standard.movement.multiplier.run = 3

    managers.mission._fading_debug_output:script().log('Run Boost - Activated', Color.green)
else
    tweak_data.player.movement_state.standard.movement.multiplier.run = 1

    managers.mission._fading_debug_output:script().log('Run Boost - Deactivated', Color.red)
end
