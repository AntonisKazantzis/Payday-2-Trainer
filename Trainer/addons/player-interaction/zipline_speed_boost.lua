ToggleZiplineSpeedBoost = not ToggleZiplineSpeedBoost

local ZipLine_update = ZipLine.update

if ToggleZiplineSpeedBoost then
    function ZipLine:update(unit, t, dt, ...)
        if not self._enabled then
            return
        end

        if self._usage_type == "bag" then
            self._speed = 10000
        elseif self._usage_type == "person" then
            self._speed = 10000
        end

        self:_update_total_time()
        self:_update_sled(t, dt)
        self:_update_sounds(t, dt)

        if ZipLine.DEBUG then
            self:debug_draw(t, dt)
        end
    end

    managers.mission._fading_debug_output:script().log('Zipline Speed Boost - Activated', Color.green)
else
    function ZipLine:update(...)
        ZipLine_update(self, ...)
    end

    managers.mission._fading_debug_output:script().log('Zipline Speed Boost - Deactivated', Color.red)
end
