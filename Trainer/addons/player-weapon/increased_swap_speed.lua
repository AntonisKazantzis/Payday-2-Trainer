toggleIncreasedSwapSpeed = not toggleIncreasedSwapSpeed

if toggleIncreasedSwapSpeed then
    function PlayerStandard:_get_swap_speed_multiplier()
        return 100
    end

    managers.mission._fading_debug_output:script().log('Instant Swap Speed - Activated', Color.green)
else
    function PlayerStandard:_get_swap_speed_multiplier()
        return 1
    end

    managers.mission._fading_debug_output:script().log('Instant Swap Speed - Deactivated', Color.red)
end
