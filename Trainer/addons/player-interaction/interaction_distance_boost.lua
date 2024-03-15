toggleInteractionDistanceBoost = not toggleInteractionDistanceBoost

local BaseInteractionExt_interact_distance = BaseInteractionExt.interact_distance

if toggleInteractionDistanceBoost then
    function BaseInteractionExt:interact_distance()
        if self.tweak_data == "access_camera" or self.tweak_data == "shaped_sharge" or tostring(self._unit:name()) ==
            "Idstring(@ID14f05c3d9ebb44b6@)" or self.tweak_data == "burning_money" or self.tweak_data ==
            "stn_int_place_camera" or self.tweak_data == "trip_mine" then
            return self._tweak_data.interact_distance or tweak_data.interaction.INTERACT_DISTANCE
        end

        return 1000
    end

    managers.mission._fading_debug_output:script().log('Interaction Distance Boost - Activated', Color.green)
else
    function BaseInteractionExt:interact_distance()
        BaseInteractionExt_interact_distance(self)
    end

    managers.mission._fading_debug_output:script().log('Interaction Distance Boost - Deactivated', Color.red)
end
