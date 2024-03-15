toggleAlwaysKickStart = not toggleAlwaysKickStart

local orig_init = PlayerStandard.init
local orig_on_melee_hit = Drill.on_melee_hit

if toggleAlwaysKickStart then
    function Drill:on_melee_hit(peer_id)
        self._unit:interaction():interact(managers.player:player_unit())
    end

    function PlayerStandard:init(unit)
        orig_init(self, unit)

        self._on_melee_restart_drill = true
    end

    managers.mission._fading_debug_output:script().log('Always Kick Start - Activated', Color.green)
else
    function Drill:on_melee_hit(peer_id)
        self._unit:interaction():interact(managers.player:player_unit())
    end

    function PlayerStandard:init(...)
        orig_on_melee_hit(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Always Kick Start - Deactivated', Color.red)
end
