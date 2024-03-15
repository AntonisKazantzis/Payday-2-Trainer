toggleDontInterruptOnDistance = not toggleDontInterruptOnDistance

if toggleDontInterruptOnDistance then
    function BaseInteractionExt:interact_dont_interupt_on_distance()
        return true
    end

    managers.mission._fading_debug_output:script().log('Dont Interrupt On Distance - Activated', Color.green)
else
    function BaseInteractionExt:interact_dont_interupt_on_distance()
        return false
    end

    managers.mission._fading_debug_output:script().log('Dont Interrupt On Distance - Deactivated', Color.red)
end
