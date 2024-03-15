toggleInfiniteCableTies = not toggleInfiniteCableTies

if toggleInfiniteCableTies then
    tweak_data.upgrades.values.cable_tie.quantity_1 = {98}

    managers.mission._fading_debug_output:script().log('Infinite Cable Ties - Activated', Color.green)
else
    tweak_data.upgrades.values.cable_tie.quantity_1 = {6}

    managers.mission._fading_debug_output:script().log('Infinite Cable Ties - Deactivated', Color.red)
end
