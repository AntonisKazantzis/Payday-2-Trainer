if inGame() then
    local ColorList = {
        default = 'FF9933', -- Gold
        friendly = 'A3FFA3', -- Light Green
        hostage = 'FFFFFF', -- White
        pickup = 'FF9933', -- Gold
        civpickup = 'FF9933', -- Gold
        enepickup = 'FF9933', -- Gold
        camera = 'CC0000', -- Dark Red
        civilian = '003399', -- Dark Blue
        civilian_female = '003399', -- Dark Blue
        spooc = 'CC0000', -- Dark Red
        taser = 'CC0000', -- Dark Red
        shield = 'CC0000', -- Dark Red
        tank = 'CC0000', -- Dark Red
        sniper = 'CC0000', -- Dark Red
        gangster = 'CC0000', -- Dark Red
        security = 'CC0000', -- Dark Red
        medic = 'CC0000', -- Dark Red
        gensec = 'CC0000', -- Dark Red
        swat = 'CC0000', -- Dark Red
        heavy_swat = 'CC0000', -- Dark Red
        fbi = 'CC0000', -- Dark Red
        fbi_swat = 'CC0000', -- Dark Red
        fbi_heavy_swat = 'CC0000', -- Dark Red
        cop_female = 'CC0000', -- Dark Red
        city_swat = 'CC0000', -- Dark Red
        mobster_boss = 'CC0000', -- Dark Red
        mobster = 'CC0000', -- Dark Red
        hector_boss = 'CC0000', -- Dark Red
        hector_boss_no_armor = 'CC0000', -- Dark Red
        biker_boss = 'CC0000', -- Dark Red
        chavez_boss = 'CC0000', -- Dark Red
        triad = 'CC0000', -- Dark Red
        thug = 'CC0000', -- Dark Red
        biker = 'CC0000', -- Dark Red
        bolivians = 'CC0000', -- Dark Red
        security_mex = 'CC0000', -- Dark Red
        bolivian = 'CC0000', -- Dark Red
        bolivian_indoors = 'CC0000', -- Dark Red
        tank_mini = 'CC0000', -- Dark Red
        tank_medic = 'CC0000', -- Dark Red
        tank_hw = 'CC0000', -- Dark Red
        swat_van_turret_module = 'CC0000', -- Dark Red
        ceiling_turret_module_no_idle = 'CC0000', -- Dark Red
        aa_turret_module = 'CC0000', -- Dark Red
        Phalanx = 'CC0000', -- Dark Red
        Phalanx_minion = 'CC0000', -- Dark Red
        drug_lord_boss = 'CC0000', -- Dark Red
        drug_lord_boss_stealth = 'CC0000', -- Dark Red
        spa_vip = 'CC0000', -- Dark Red
        spa_vip_hurt = 'CC0000', -- Dark Red
        captain = 'CC0000', -- Dark Red
        cop = 'CC0000', -- Dark Red
        nathan = 'CC0000', -- Dark Red
        dealer = 'CC0000', -- Dark Red
        biker_escape = 'CC0000', -- Dark Red
        old_hoxton_mission = 'CC0000', -- Dark Red
        inside_man = 'CC0000', -- Dark Red
        triad_boss_no_armor = 'CC0000', -- Dark Red
        ranchmanager = 'CC0000', -- Dark Red
        bolivian_indoors_mex = 'CC0000', -- Dark Red
        security_mex_no_pager = 'CC0000', -- Dark Red
        cop_scared = 'CC0000', -- Dark Red
        security_undominatable = 'CC0000', -- Dark Red
        mute_security_undominatable = 'CC0000' -- Dark Red
    }
    function getUnitColor(unit)
        local unitType = unit:base()._tweak_table
        if unit:base().security_camera then
            unitType = 'camera'
        end
        if unit:base().is_converted then
            unitType = 'friendly'
        end
        if unit:base().is_hostage then
            unitType = 'hostage'
        end
        if unit:base().has_pickup then
            unitType = 'pickup'
        end
        if not unitType then
            return nil
        end
        return Color(ColorList[unitType] and ColorList[unitType] or ColorList['default'])
    end
    function markEnemies()
        if not toggleMark or not inGame() then
            return
        end
        local multi = managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1)
        if isHost() then
            for u_key, u_data in pairs(managers.groupai:state()._security_cameras) do
                if u_data.contour then
                    u_data:contour():add("mark_unit", syncMark, multi)
                end
            end
        else
            for _, unit in ipairs(SecurityCamera.cameras) do
                if unit and unit:contour() and unit:enabled() and unit:base() and not unit:base():destroyed() then
                    unit:contour():add("mark_unit", syncMark, multi)
                end
            end
        end
        for u_key, u_data in pairs(managers.enemy:all_civilians()) do
            if u_data.unit.contour and alive(u_data.unit) then
                if isHostage(u_data.unit) then
                    u_data.unit:contour():setData({
                        is_hostage = true
                    })
                end
                if isHost() and u_data.unit:character_damage():pickup() then
                    u_data.unit:contour():setData({
                        has_pickup = true
                    })
                end
                u_data.unit:contour():add("mark_enemy", syncMark, multi)
            end
        end
        for u_key, u_data in pairs(managers.enemy:all_enemies()) do
            if u_data.unit.contour and alive(u_data.unit) then
                if u_data.is_converted then
                    u_data.unit:contour():setData({
                        is_converted = true
                    })
                    -- u_data.unit:contour():add("friendly", syncMark, multi)
                else
                    if isHostage(u_data.unit) then
                        u_data.unit:contour():setData({
                            is_hostage = true
                        })
                    end
                    if isHost() and u_data.unit:character_damage():pickup() and u_data.unit:character_damage():pickup() ~=
                        "ammo" then
                        u_data.unit:contour():setData({
                            has_pickup = true
                        })
                    end
                    u_data.unit:contour():add("mark_enemy", syncMark, multi)
                end
            end
        end
    end
    function markClear()
        if not inGame() then
            return
        end
        if isHost() then
            for u_key, u_data in pairs(managers.groupai:state()._security_cameras) do
                if u_data.contour then
                    u_data:contour():removeAll()
                end
            end
        else
            for _, unit in ipairs(SecurityCamera.cameras) do
                unit:contour():removeAll()
            end
        end
        for u_key, u_data in pairs(managers.enemy:all_civilians()) do
            if u_data.unit.contour then
                u_data.unit:contour():removeAll()
            end
        end
        for u_key, u_data in pairs(managers.enemy:all_enemies()) do
            if u_data.unit.contour then
                u_data.unit:contour():removeAll()
            end
        end
    end
    if ContourExt then
        if not _nhUpdateColor then
            _nhUpdateColor = ContourExt._upd_color
        end
        function ContourExt:_upd_color()
            if toggleMark then
                local color = getUnitColor(self._unit)
                if color then
                    self._materials = self._materials or self._unit:get_objects_by_type(Idstring("material"))
                    for _, material in ipairs(self._materials) do
                        material:set_variable(Idstring("contour_color"), color)
                    end
                    return
                end
            end
            _nhUpdateColor(self)
        end
        function ContourExt:removeAll(sync)
            if not self._contour_list or not type(self._contour_list) == 'table' then
                return
            end
            for id, setup in ipairs(self._contour_list) do
                self:remove(setup.type, sync)
            end
        end
        function ContourExt:setData(data)
            if not data or not type(data) == 'table' then
                return
            end
            for k, v in pairs(data) do
                self._unit:base()[k] = v
            end
        end
    end
    if CopDamage then
        if not _copDamageDie then
            _copDamageDie = CopDamage.die
        end
        function CopDamage:die(variant)
            if toggleMark and self._unit:contour() then
                self._unit:contour():removeAll()
            end
            _copDamageDie(self, variant)
        end
    end
    if HuskCopDamage then
        if not _huskDamageDie then
            _huskDamageDie = HuskCopDamage.die
        end
        function HuskCopDamage:die(variant)
            if toggleMark and self._unit:contour() then
                self._unit:contour():removeAll()
            end
            _huskDamageDie(self, variant)
        end
    end
    if ElementSecurityCamera then
        if not _cameraDestroyed then
            _cameraDestroyed = ElementSecurityCamera.on_destroyed
        end
        function ElementSecurityCamera:on_destroyed()
            if toggleMark then
                local camera_unit = self:_fetch_unit_by_unit_id(self._values.camera_u_id)
                if camera_unit:contour() then
                    camera_unit:contour():removeAll()
                end
            end
            _cameraDestroyed(self)
        end
    end
    if GameSetup then
        if not _gameUpdate then
            _gameUpdate = GameSetup.update
        end
        local _gameUpdateLastMark
        function GameSetup:update(t, dt)
            _gameUpdate(self, t, dt)
            if not _gameUpdateLastMark or t - _gameUpdateLastMark > 4 then
                _gameUpdateLastMark = t
                markEnemies()
            end
        end
    end
    function markToggle(toggleSync)
        if not inGame() then
            return
        end
        if toggleSync then
            syncMark = not syncMark
            managers.hud:present_mid_text("Set to: " .. tostring(syncMark), "Sync Marked Enemies", 0.50)
        else
            toggleMark = not toggleMark
            if not toggleMark then
                markClear()
            else
            end
            managers.hud:present_mid_text("Set to: " .. tostring(toggleMark), "Marking Enemies", 0.50)
        end
        markEnemies()
    end
    if not toggleMark then
        toggleMark = false
    end
    if not syncMark then
        syncMark = false
    end

    markToggle()

    if toggleMark then
        managers.mission._fading_debug_output:script().log('Xray - Activated', Color.green)
    else
        managers.mission._fading_debug_output:script().log('Xray - Deactivated', Color.red)
    end
end

-- SHOW FRAMING FRAME DAY 3 ITEMS
_toggleItemFinder = not _toggleItemFinder
if _toggleItemFinder then
    for k, v in pairs(managers.mission._scripts.default._elements) do
        if v._values and v._values.trigger_list and v._values.trigger_list[1] and
            (v._values.trigger_list[1].notify_unit_sequence == "state_outline_enabled" or
                v._values.trigger_list[1].notify_unit_sequence == "enable_outline") then
            v:on_executed()
        end
    end
else
    for k, v in pairs(managers.mission._scripts.default._elements) do
        if v._values and v._values.trigger_list and v._values.trigger_list[1] and
            (v._values.trigger_list[1].notify_unit_sequence == "state_outline_disabled" or
                v._values.trigger_list[1].notify_unit_sequence == "disable_outline") then
            v:on_executed()
        end
    end
end
