toggleInfiniteEcm = not toggleInfiniteEcm

local orig_update = ECMJammerBase.update

if toggleInfiniteEcm then
    function ECMJammerBase:update()
        self._battery_life = self._max_battery_life
    end

    managers.mission._fading_debug_output:script().log('Infinite ECM - Activated', Color.green)
else
    function ECMJammerBase:update()
        orig_update(self)
    end

    managers.mission._fading_debug_output:script().log('Infinite ECM - Deactivated', Color.red)
end
