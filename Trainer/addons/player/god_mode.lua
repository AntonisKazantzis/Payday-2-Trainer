toggleGodMode = not toggleGodMode

if toggleGodMode then
    managers.player:player_unit():character_damage():set_invulnerable(true)

    managers.mission._fading_debug_output:script().log('God Mode - Activated', Color.green)
else
    managers.player:player_unit():character_damage():set_invulnerable(false)

    managers.mission._fading_debug_output:script().log('God Mode - Deactivated', Color.red)
end
