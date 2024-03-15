toggleInfiniteBodyBags = not toggleInfiniteBodyBags

local PlayerManager_on_used_body_bag = PlayerManager.on_used_body_bag

if toggleInfiniteBodyBags then
    function PlayerManager:on_used_body_bag()
        self:_set_body_bags_amount(self._local_player_body_bags)
    end

    managers.mission._fading_debug_output:script().log('Infinite Bodybags - Activated', Color.green)
else
    function PlayerManager:on_used_body_bag()
        PlayerManager_on_used_body_bag(self)
    end

    managers.mission._fading_debug_output:script().log('Infinite Bodybags - Deactivated', Color.red)
end
