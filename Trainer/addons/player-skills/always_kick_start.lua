toggleAlwaysKickStart = not toggleAlwaysKickStart

local PlayerStandard_init = PlayerStandard.init
local Drill_on_melee_hit = Drill.on_melee_hit

if toggleAlwaysKickStart then
    function Drill:on_melee_hit(peer_id)
        self._unit:interaction():interact(managers.player:player_unit())
    end

    function PlayerStandard:init(unit)
        PlayerStandard_init(self, unit)

        self._on_melee_restart_drill = true
    end

    managers.mission._fading_debug_output:script().log('Always Kick Start - Activated', Color.green)
else
    function Drill:on_melee_hit(peer_id)
        self._unit:interaction():interact(managers.player:player_unit())
    end

    function PlayerStandard:init(...)
        Drill_on_melee_hit(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Always Kick Start - Deactivated', Color.red)
end
