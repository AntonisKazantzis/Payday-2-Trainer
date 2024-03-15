toggleNoSway = not toggleNoSway

local orig_init = PlayerTweakData.init

if toggleNoSway then
    function PlayerTweakData:init()
        orig_init(self)

        for k, v in pairs(self.stances) do
            v.standard.shakers.breathing.amplitude = 0
            v.crouched.shakers.breathing.amplitude = 0
            v.steelsight.shakers.breathing.amplitude = 0
        end
    end

    managers.mission._fading_debug_output:script().log("No Sway - Activated", Color.green)
else
    function PlayerTweakData:init()
        orig_init(self)
    end

    managers.mission._fading_debug_output:script().log("No Sway - Deactivated", Color.red)
end
