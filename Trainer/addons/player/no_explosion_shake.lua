toggleNoExplosionShake = not toggleNoExplosionShake

local orig_player_feedback = ExplosionManager.player_feedback

if toggleNoExplosionShake then
    function ExplosionManager:player_feedback()
    end

    managers.mission._fading_debug_output:script().log("No Explosion Shake - Activated", Color.green)
else
    function ExplosionManager:player_feedback()
        orig_player_feedback(self)
    end

    managers.mission._fading_debug_output:script().log("No Explosion Shake - Deactivated", Color.red)
end
