toggleMoveWhileInteracting = not toggleMoveWhileInteracting

orig_determine_move_direction = orig_determine_move_direction or PlayerStandard._determine_move_direction

if toggleMoveWhileInteracting then
    function PlayerStandard:_determine_move_direction()
        local interact_expire = self._interact_expire_t
        self._interact_expire_t = false
        orig_determine_move_direction(self)
        self._interact_expire_t = interact_expire
    end
    
    managers.mission._fading_debug_output:script().log("Move While Interacting - Activated", Color.green)
else
    function PlayerStandard:_determine_move_direction()
        orig_determine_move_direction(self)
    end
    
    managers.mission._fading_debug_output:script().log("Move While Interacting - Deactivated", Color.red)
end
