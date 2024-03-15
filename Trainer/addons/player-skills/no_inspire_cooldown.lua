toggleNoInspireCooldown = not toggleNoInspireCooldown

if toggleNoInspireCooldown then
    tweak_data.upgrades.values.cooldown.long_dis_revive[2] = 1

    managers.mission._fading_debug_output:script().log('No Inspire Cooldown - Activated', Color.green)
else
    tweak_data.upgrades.values.cooldown.long_dis_revive[2] = 20

    managers.mission._fading_debug_output:script().log('No Inspire Cooldown - Deactivated', Color.red)
end
