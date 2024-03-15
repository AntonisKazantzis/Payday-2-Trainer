toggleInfiniteFollowingHostages = not toggleInfiniteFollowingHostages

if toggleInfiniteFollowingHostages then
    tweak_data.player.max_nr_following_hostages = 1000

    managers.mission._fading_debug_output:script().log('Infinite Following Hostages - Activated', Color.green)
else
    tweak_data.player.max_nr_following_hostages = 2

    managers.mission._fading_debug_output:script().log('Infinite Following Hostages - Deactivated', Color.red)
end
