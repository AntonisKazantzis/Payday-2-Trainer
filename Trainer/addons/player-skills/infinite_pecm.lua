toggleInfinitePECM = not toggleInfinitePECM

if toggleInfinitePECM then
    tweak_data.projectiles.pocket_ecm_jammer.base_cooldown = 5

    managers.mission._fading_debug_output:script().log('Infinite PECM - Activated', Color.green)
else
    tweak_data.projectiles.pocket_ecm_jammer.base_cooldown = 100

    managers.mission._fading_debug_output:script().log('Infinite PECM - Deactivated', Color.red)
end
