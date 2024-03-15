ToggleDrillSpeedBoost = not ToggleDrillSpeedBoost

local TimerGui_start = TimerGui._start
local ZipLine_set_jamming_values = ZipLine._set_jamming_values

if ToggleDrillSpeedBoost then
    function TimerGui:_set_jamming_values()
        return
    end

    function TimerGui:start(timer, ...)
        timer = 0.01

        if self._jammed then
            self:_set_jammed(false)

            return
        end

        if not self._powered then
            self:_set_powered(true)

            return
        end

        if self._started then
            return
        end

        self:_start(timer)

        if managers.network:session() then
            managers.network:session():send_to_peers_synched("start_timer_gui", self._unit, timer)
        end
    end

    managers.mission._fading_debug_output:script().log('Drill Speed Boost - Activated', Color.green)
else
    function TimerGui:_set_jamming_values()
        ZipLine_set_jamming_values(self)
    end

    function TimerGui:start(...)
        TimerGui_start(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Drill Speed Boost - Deactivated', Color.red)
end
