---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                           Menu                                                                                    --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if not SimpleMenu then
    SimpleMenu = class()

    function SimpleMenu:init(title, message, options)
        self.dialog_data = {
            title = title,
            text = message,
            button_list = {},
            id = tostring(math.random(0, 0xFFFFFFFF))
        }
        self.visible = false
        for _, opt in ipairs(options) do
            local elem = {}
            elem.text = opt.text
            opt.data = opt.data or nil
            opt.callback = opt.callback or nil
            elem.callback_func = callback(self, self, "_do_callback", {
                data = opt.data,
                callback = opt.callback
            })
            elem.cancel_button = opt.is_cancel_button or false
            if opt.is_focused_button then
                self.dialog_data.focus_button = #self.dialog_data.button_list + 1
            end
            table.insert(self.dialog_data.button_list, elem)
        end
        return self
    end

    function SimpleMenu:_do_callback(info)
        if info.callback then
            if info.data then
                info.callback(info.data)
            else
                info.callback()
            end
        end
        self.visible = false
    end

    function SimpleMenu:show()
        if self.visible then
            return
        end
        self.visible = true
        managers.system_menu:show(self.dialog_data)
    end

    function SimpleMenu:hide()
        if self.visible then
            managers.system_menu:close(self.dialog_data.id)
            self.visible = false
            return
        end
    end

end

patched_update_input = patched_update_input or function(self, t, dt)
    if self._data.no_buttons then
        return
    end
    local dir, move_time
    local move = self._controller:get_input_axis("menu_move")
    if (self._controller:get_input_bool("menu_down")) then
        dir = 1
    elseif (self._controller:get_input_bool("menu_up")) then
        dir = -1
    end
    if dir == nil then
        if move.y > self.MOVE_AXIS_LIMIT then
            dir = 1
        elseif move.y < -self.MOVE_AXIS_LIMIT then
            dir = -1
        end
    end
    if dir ~= nil then
        if ((self._move_button_dir == dir) and self._move_button_time and
            (t < self._move_button_time + self.MOVE_AXIS_DELAY)) then
            move_time = self._move_button_time or t
        else
            self._panel_script:change_focus_button(dir)
            move_time = t
        end
    end
    self._move_button_dir = dir
    self._move_button_time = move_time
    local scroll = self._controller:get_input_axis("menu_scroll")
    if (scroll.y > self.MOVE_AXIS_LIMIT) then
        self._panel_script:scroll_up()
    elseif (scroll.y < -self.MOVE_AXIS_LIMIT) then
        self._panel_script:scroll_down()
    end
end
managers.system_menu.DIALOG_CLASS.update_input = patched_update_input
managers.system_menu.GENERIC_DIALOG_CLASS.update_input = patched_update_input
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                 Interact With Options                                                                             --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local pairs = pairs
local insert = table.insert
local M_player = managers.player
local ply_list = M_player._players
local M_interaction = managers.interaction

function interactbytweak(...)
    local player = ply_list[1]
    if not player then
        return
    end
    local interactives = {}
    local tweaks = {}
    for _, arg in pairs({...}) do
        tweaks[arg] = true
    end
    for key, unit in pairs(M_interaction._interactive_units) do
        local interaction = unit.interaction
        interaction = interaction and interaction(unit)
        if interaction and tweaks[interaction.tweak_data] then
            insert(interactives, interaction)
        end
    end
    for _, i in pairs(interactives) do
        i:interact(player)
    end
end

function grabsmallloot()

    interactbytweak("cut_glass", "crate_loot", "crate_loot_crowbar", "safe_loot_pickup", "diamond_pickup",
        "tiara_pickup", "money_wrap_single_bundle", "invisible_interaction_open", "mus_pku_artifact")

end

grab_all_small_loot = grab_all_small_loot or function()

    grabsmallloot()
    managers.mission._fading_debug_output:script().log('Grab All Small Loot - Activated', Color.green)

end

function graballbigloot()

    interactbytweak("trai_printing_plates_carry", "diamond_pickup", "red_diamond_pickup", "diamonds_pickup_full",
        "diamonds_pickup", "shape_charge_plantable", "gen_pku_cocaine_pure", "money_small", "money_scanner",
        "money_luggage", "money_wrap", "money_bag", "corpse_dispose", "hold_pku_drk_bomb_part", "hold_take_server",
        "weapon", "ammo", "painting", "old_wine", "ordinary_wine", "drk_bomb_part", "evidence_bag", "coke", "coke_pure",
        "diamond_necklace", "diamonds", "artifact_statue", "prototype", "yayo", "meth_half", "samurai_armor", "turret",
        "roman_armor", "samurai_suit", "weapons", "carry_drop", "painting_carry_drop", "money_wrap", "gen_pku_jewelry",
        "taking_meth", "gen_pku_cocaine", "take_weapons", "gold_pile", "hold_take_painting",
        "invisible_interaction_open", "gen_pku_artifact", "gen_pku_artifact_statue", "gen_pku_artifact_painting")

end

grab_all_big_loot = grab_all_big_loot or function()

    graballbigloot()
    managers.mission._fading_debug_output:script().log('Grab All Big Loot - Activated', Color.green)

end

function quicklyrobstuff()

    interactbytweak('weapon_case', 'cash_register', 'requires_ecm_jammer_atm', 'pick_lock_hard',
        'pick_lock_hard_no_skill', 'pick_lock_deposit_transport', 'gage_assignment')

end

quickly_rob_stuff = quickly_rob_stuff or function()

    quicklyrobstuff()
    managers.mission._fading_debug_output:script().log('Quickly Rob Stuff - Activated', Color.green)

end

function openalldoors()

    interactbytweak("cas_open_door", "open_door_with_keys", "requires_ecm_jammer_double", "requires_ecm_jammer",
        "cas_security_door", "cas_open_securityroom_door", "pick_lock_easy_no_skill", "pick_lock_hard_no_skill",
        "pick_lock_hard", "open_from_inside", "open_train_cargo_door")

end

open_all_doors = open_all_doors or function()

    openalldoors()
    managers.mission._fading_debug_output:script().log('Open All Doors - Activated', Color.green)

end

function drillupgall()

    interactbytweak("drill", "drill_upgrade", "drill_jammed", "lance_upgrade", "lance_jammed", "huge_lance_jammed")

end

upgrade_fix_drills = upgrade_fix_drills or function()

    drillupgall()
    managers.mission._fading_debug_output:script().log('Upgrade/Fix All Drills - Activated', Color.green)

end

function barricadestuff()

    interactbytweak('stash_planks', 'need_boards')

end

barricade_stuff = barricade_stuff or function()

    barricadestuff()
    managers.mission._fading_debug_output:script().log('Barricade Stuff - Activated', Color.green)

end

function openatms()

    interactbytweak('requires_ecm_jammer_atm')

end

open_all_atms = open_all_atms or function()

    openatms()
    managers.mission._fading_debug_output:script().log('Open All ATMs - Activated', Color.green)

end

function testopenallvaults()

    interactbytweak("pick_lock_hard", "pick_lock_hard_no_skill", "pick_lock_deposit_transport")

end

open_all_vaults = open_all_vaults or function()

    testopenallvaults()
    managers.mission._fading_debug_output:script().log('Open All Vaults - Activated', Color.green)

end

function graballgagepackages()

    interactbytweak("gage_assignment")

end

grab_all_gage_assignments = grab_all_gage_assignments or function()

    graballgagepackages()
    managers.mission._fading_debug_output:script().log('Grab All Gage Assignments - Activated', Color.green)

end

grab_everything = grab_everything or function()

    function grabeverything()
        grabsmallloot()
        graballbigloot()
        graballgagepackages()
    end

    grabeverything()
    managers.mission._fading_debug_output:script().log('Grab Eveything - Activated', Color.green)

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                  Alarm Options                                                                                    --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_infinite_pagers = toggle_infinite_pagers or function(info)
    toggleInfinitePagers = not toggleInfinitePagers
	
    if toggleInfinitePagers then
        function GroupAIStateBase:on_successful_alarm_pager_bluff()
        end
        managers.mission._fading_debug_output:script().log('Infinite Pagers - Activated', Color.green)
    else
        function GroupAIStateBase:on_successful_alarm_pager_bluff()
            self._nr_successful_alarm_pager_bluffs = self._nr_successful_alarm_pager_bluffs + 1
        end
        managers.mission._fading_debug_output:script().log('Infinite Pagers - Deactivated', Color.red)
    end
end

toggle_stop_calling_police = toggle_stop_calling_police or function(info)
    toggleStopCallingPolice = not toggleStopCallingPolice

    if toggleStopCallingPolice then
        function GroupAIStateBase:on_police_called(called_reason)
        end
        managers.mission._fading_debug_output:script().log(
            'Makes Gaurds And People In General Stop Calling The Police - Activated', Color.green)
    else
        function GroupAIStateBase:on_police_called(called_reason)
            if not self._ai_enabled then
                return
            end
            local was_called = self._police_called
            self._police_called = true
            managers.mission:call_global_event("police_called")
            self:_call_listeners("police_called")
            if was_called then
                return
            end
            if not self._police_call_clbk_id then
                self:set_reason_called(called_reason)
                managers.network:session():send_to_peers_synched("group_ai_event",
                    self:get_sync_event_id("police_called"), self:get_sync_blame_id(self._called_reason))
                self._police_call_clbk_id = "on_enemy_weapons_hot"
                managers.enemy:add_delayed_clbk(self._police_call_clbk_id,
                    callback(self, self, "on_enemy_weapons_hot", true), TimerManager:game():time() + 2)
            end
        end
        managers.mission._fading_debug_output:script().log('Makes Gaurds And People In General Stop Calling The Police - Deactivated', Color.red)

    end

end

toggle_stop_reporting = toggle_stop_reporting or function(info)
    toggleStopReporting = not toggleStopReporting

    if toggleStopReporting then
        function CivilianLogicFlee.clbk_chk_call_the_police(ignore_this, data)
        end
        managers.mission._fading_debug_output:script().log(
            'Stops Civilians From Reporting You To The Police - Activated', Color.green)
    else
        function CivilianLogicFlee.clbk_chk_call_the_police(ignore_this, data)
            local my_data = data.internal_data
            CopLogicBase.on_delayed_clbk(my_data, my_data.call_police_clbk_id)
            my_data.call_police_clbk_id = nil
            if managers.groupai:state():is_police_called() then
                return
            end
            local my_areas = managers.groupai:state():get_areas_from_nav_seg_id(
                data.unit:movement():nav_tracker():nav_segment())
            local already_calling = false
            for u_key, u_data in pairs(managers.enemy:all_civilians()) do
                local civ_nav_seg = u_data.unit:movement():nav_tracker():nav_segment()
                if my_areas[civ_nav_seg] and u_data.unit:anim_data().call_police then
                    already_calling = true
                    break
                end
            end
            if not already_calling and
                (not my_data.calling_the_police or not data.unit:movement():chk_action_forbidden("walk")) then
                local action = {
                    variant = "cmf_so_call_police",
                    body_part = 1,
                    type = "act",
                    blocks = {}
                }
                my_data.calling_the_police = data.unit:movement():action_request(action)
                if my_data.calling_the_police then
                    CivilianLogicFlee._say_call_the_police(data, my_data)
                    managers.groupai:state():on_criminal_suspicion_progress(nil, data.unit, "calling")
                end
            end
            my_data.call_police_clbk_id = "civ_call_police" .. tostring(data.key)
            CopLogicBase.add_delayed_clbk(my_data, my_data.call_police_clbk_id, callback(CivilianLogicFlee,
                CivilianLogicFlee, "clbk_chk_call_the_police", data),
                TimerManager:game():time() + math.lerp(15, 20, math.random()))
        end
        managers.mission._fading_debug_output:script().log('Stops Civilians From Reporting You To The Police - Deactivated', Color.red)

    end

end

toggle_disable_camera_alarm = toggle_disable_camera_alarm or function(info)
    toggleDisableCameraAlarm = not toggleDisableCameraAlarm

    if toggleDisableCameraAlarm then
        function SecurityCamera:_sound_the_alarm(detected_unit)
        end
        managers.mission._fading_debug_output:script().log('Disable Camera Alarm - Activated', Color.green)
    else
        function SecurityCamera:_sound_the_alarm(detected_unit)
            if self._alarm_sound then
                return
            end
            if Network:is_server() then
                if self._mission_script_element then
                    self._mission_script_element:on_alarm(self._unit)
                end
                self:_send_net_event(self._NET_EVENTS.alarm_start)
                self._call_police_clbk_id = "cam_call_cops" .. tostring(self._unit:key())
                managers.enemy:add_delayed_clbk(self._call_police_clbk_id, callback(self, self, "clbk_call_the_police"),
                    Application:time() + 7)
                local reason_called = managers.groupai:state().analyse_giveaway("security_camera", detected_unit)
                self._reason_called = managers.groupai:state()
                    :fetch_highest_giveaway(self._reason_called, reason_called)
                self:_destroy_all_detected_attention_object_data()
                self:set_detection_enabled(false, nil, nil)
            end
            if self._suspicion_sound then
                self._suspicion_sound = nil
                self._unit:sound_source():post_event("camera_suspicious_signal_stop")
            end
            self._alarm_sound = self._unit:sound_source():post_event("camera_alarm_signal")
        end
        managers.mission._fading_debug_output:script().log('Disable Camera Alarm - Deactivated', Color.red)

    end

end

toggle_remove_camera_sound = toggle_remove_camera_sound or function(info)
    toggleRemoveCameraSound = not toggleRemoveCameraSound

    if toggleRemoveCameraSound then
        function SecurityCamera:_set_suspicion_sound(suspicion_level)
        end
        managers.mission._fading_debug_output:script().log('Remove Camera Sound - Activated', Color.green)
    else
        function SecurityCamera:_set_suspicion_sound(suspicion_level)
            if self._suspicion_sound_lvl == suspicion_level then
                return
            end
            if not self._suspicion_sound then
                self._suspicion_sound = self._unit:sound_source():post_event("camera_suspicious_signal")
                self._suspicion_sound_lvl = 0
            end
            local pitch = self._suspicion_sound_lvl <= suspicion_level and 1 or 0.6
            self._suspicion_sound_lvl = suspicion_level
            self._unit:sound_source():set_rtpc("camera_suspicion_level_pitch", pitch)
            self._unit:sound_source():set_rtpc("camera_suspicion_level", suspicion_level)
            if Network:is_server() then
                local suspicion_lvl_sync = math.clamp(math.ceil(suspicion_level * 6), 1, 6)
                if suspicion_lvl_sync ~= self._suspicion_lvl_sync then
                    self._suspicion_lvl_sync = suspicion_lvl_sync
                    local event_id = self._NET_EVENTS["suspicion_" .. tostring(suspicion_lvl_sync)]
                    self:_send_net_event(event_id)
                end
            end
        end
        managers.mission._fading_debug_output:script().log('Remove Camera Sound - Deactivated', Color.red)

    end

end

toggle_stop_saying_calling_police = toggle_stop_saying_calling_police or function(info)
    toggle = not toggle
    if toggle then
        function CopLogicArrest._say_call_the_police(data, my_data)
        end
        managers.mission._fading_debug_output:script().log(
            'Stops The Police From Saying They Are Calling The Police All The Time - Activated', Color.green)
    else
        function CopLogicArrest._say_call_the_police(data, my_data)
            if data.SO_access_str == "taser" then
                return
            end
            local blame_list = {
                body_bag = "a19",
                drill = "a25",
                criminal = "a23",
                trip_mine = "a21",
                w_hot = "a16",
                civilian = "a15",
                sentry_gun = "a20",
                dead_cop = "a12",
                hostage_cop = "a14",
                hostage_civ = "a13",
                dead_civ = "a11"
            }
            data.unit:sound():say(blame_list[my_data.call_in_event] or "a23", true)
        end
        managers.mission._fading_debug_output:script().log('Stops The Police From Saying They Are Calling The Police All The Time - Deactivated', Color.red)

    end

end

toggle_prevents = toggle_prevents or function(info)
    togglePrevents = not togglePrevents
    if togglePrevents then
        if not _actionRequest then
            _actionRequest = CopMovement.action_request
        end
        function CopMovement:action_request(action_desc)
            if action_desc.variant == "run" then
                return false
            end
            return _actionRequest(self, action_desc)
        end
        managers.mission._fading_debug_output:script().log('Prevent Panic Buttons & Intel Burning - Activated',
            Color.green)
    else
        if not _actionRequest then
            _actionRequest = CopMovement.action_request
        end
        function CopMovement:action_request(action_desc)
            if action_desc.variant == "run" then
                return true
            end
            return _actionRequest(self, action_desc)
        end
        managers.mission._fading_debug_output:script().log('Prevent Panic Buttons & Intel Burning - Deactivated', Color.red)

    end

end

toggle_disable_cameras = toggle_disable_cameras or function(info)
    toggleDisableCameras = not toggleDisableCameras
    if toggleDisableCameras then

        for _, unit in pairs(SecurityCamera.cameras) do
            if unit:base()._last_detect_t ~= nil then
                unit:base():set_update_enabled(state)
            end
        end
		
        function SecurityCamera:set_detection_enabled(state, settings, mission_element)
        end

        managers.mission._fading_debug_output:script().log('Disable Cameras - Activated', Color.green)
    else

        for _, unit in pairs(SecurityCamera.cameras) do
            if unit:base()._last_detect_t ~= nil then
                unit:base():set_update_enabled(true)
            end
        end

        function SecurityCamera:set_detection_enabled(state, settings, mission_element)

            if self._destroyed then
                return
            end

            self:set_update_enabled(state)
            self._mission_script_element = mission_element or self._mission_script_element

            if state then
                self._u_key = self._unit:key()
                self._last_detect_t = self._last_detect_t or TimerManager:game():time()
                self._detection_interval = 0.1
                self._SO_access_str = "security"
                self._SO_access = managers.navigation:convert_access_filter_to_number({self._SO_access_str})
                self._visibility_slotmask = managers.slot:get_mask("AI_visibility")

                if settings then
                    self._cone_angle = settings.fov
                    self._detection_delay = settings.detection_delay
                    self._range = settings.detection_range
                    self._suspicion_range = settings.suspicion_range
                    self._team = managers.groupai:state():team_data(settings.team_id or
                                                                        tweak_data.levels:get_default_team_ID(
                            "combatant"))
                end

                self._detected_attention_objects = self._detected_attention_objects or {}
                self._look_obj = self._unit:get_object(Idstring("CameraLens"))
                self._yaw_obj = self._unit:get_object(Idstring("CameraYaw"))
                self._pitch_obj = self._unit:get_object(Idstring("CameraPitch"))
                self._pos = self._yaw_obj:position()
                self._look_fwd = nil
                self._tmp_vec1 = self._tmp_vec1 or Vector3()
                self._suspicion_lvl_sync = 0
            else
                self._last_detect_t = nil
                self:_destroy_all_detected_attention_object_data()
                self._brush = nil
                self._visibility_slotmask = nil
                self._detection_delay = nil
                self._look_obj = nil
                self._yaw_obj = nil
                self._pitch_obj = nil
                self._pos = nil
                self._look_fwd = nil
                self._tmp_vec1 = nil
                self._detected_attention_objects = nil
                self._suspicion_lvl_sync = nil
                self._team = nil

                if not self._destroying then
                    self:_stop_all_sounds()
                    self:_deactivate_tape_loop()
                end

            end

            if settings then
                self:apply_rotations(settings.yaw, settings.pitch)
            end
            managers.groupai:state():register_security_camera(self._unit, state)
        end
        managers.mission._fading_debug_output:script().log('Disable Cameras - Deactivated', Color.red)

    end

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                Interaction Options                                                                                --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_increased_interact_distance = toggle_increased_interact_distance or function(info)
    toggleIncreasedInteractDistance = not toggleIncreasedInteractDistance

    if toggleIncreasedInteractDistance then
        function BaseInteractionExt:interact_distance()
            if self.tweak_data == "access_camera" or self.tweak_data == "shaped_sharge" or tostring(self._unit:name()) ==
                "Idstring(@ID14f05c3d9ebb44b6@)" or self.tweak_data == "burning_money" or self.tweak_data ==
                "stn_int_place_camera" or self.tweak_data == "trip_mine" then
                return self._tweak_data.interact_distance or tweak_data.interaction.INTERACT_DISTANCE
            end
            return 1000
        end
        managers.mission._fading_debug_output:script().log('Increased Interact Distance - Activated', Color.green)
    else
        function BaseInteractionExt:interact_distance()
            if self.tweak_data == "access_camera" or self.tweak_data == "shaped_sharge" or tostring(self._unit:name()) ==
                "Idstring(@ID14f05c3d9ebb44b6@)" or self.tweak_data == "burning_money" or self.tweak_data ==
                "stn_int_place_camera" or self.tweak_data == "trip_mine" then
                return self._tweak_data.interact_distance or tweak_data.interaction.INTERACT_DISTANCE
            end
            return 200
        end
        managers.mission._fading_debug_output:script().log('Increased Interact Distance - Deactivated', Color.red)

    end

end

toggle_faster_ziplines = toggle_faster_ziplines or function(info)
    toggleFasterZiplines = not toggleFasterZiplines

    if toggleFasterZiplines then
        function ZipLine:update(unit, t, dt)
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
        managers.mission._fading_debug_output:script().log('Faster Ziplines - Activated', Color.green)
    else
        function ZipLine:update(unit, t, dt)
            if not self._enabled then
                return
            end
            if self._usage_type == "bag" then
                self._speed = 1000
            elseif self._usage_type == "person" then
                self._speed = 1000
            end
            self:_update_total_time()
            self:_update_sled(t, dt)
            self:_update_sounds(t, dt)
            if ZipLine.DEBUG then
                self:debug_draw(t, dt)
            end
        end
        managers.mission._fading_debug_output:script().log('Faster Ziplines - Deactivated', Color.red)

    end

end

toggle_faster_drills = toggle_faster_drills or function(info)
    toggleFasterDrills = not toggleFasterDrills

    if toggleFasterDrills then
        local old_start = TimerGui._start
        function TimerGui:_set_jamming_values()
            return
        end
        function TimerGui:start(timer)
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
        managers.mission._fading_debug_output:script().log('Faster Drills - Activated', Color.green)
    else
        local old_start = TimerGui._start
        function TimerGui:_set_jamming_values()
            return
        end
        function TimerGui:start(timer)
            timer = old_start
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
        managers.mission._fading_debug_output:script().log('Faster Drills - Deactivated', Color.red)

    end

end

player_interact_with_anything = player_interact_with_anything or function(info)

    function BaseInteractionExt:_has_required_upgrade()
        return true
    end

    function BaseInteractionExt:_has_required_deployable()
        return true
    end

    function BaseInteractionExt:can_interact(player)
        return true
    end

    managers.mission._fading_debug_output:script().log('Interact With Anything - Activated', Color.green)

end

interact_while_in_casing = interact_while_in_casing or function(info)
    local old_is_in = old_is_in or BaseInteractionExt._is_in_required_state

    function BaseInteractionExt:_is_in_required_state(movement_state)
        return movement_state == "mask_off" and true or old_is_in(self, movement_state)
    end

    managers.mission._fading_debug_output:script().log('Interact While In Casing Mode - Activated', Color.green)

end

remove_cooldown = remove_cooldown or function(info)

    function PlayerManager:carry_blocked_by_cooldown()
        return false
    end

    function PlayerStandard:_action_interact_forbidden()
        return false
    end

    managers.mission._fading_debug_output:script().log('Remove Cooldown Between Picking Up Bags - Activated', Color.green)

end

interact_through_walls = interact_through_walls or function(info)

    function ObjectInteractionManager:_raycheck_ok(unit, camera_pos, locator)
        return true
    end

    managers.mission._fading_debug_output:script().log('Interact Through Walls - Activated', Color.green)

end

interact_dont_interupt_on_distance = interact_dont_interupt_on_distance or function(info)

    function BaseInteractionExt:interact_dont_interupt_on_distance()
        return true
    end

    function PlayerStandard:_interacting()
        return
    end

    managers.mission._fading_debug_output:script().log('Interact Dont Interupt On Distance - Activated', Color.green)

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                               Instant Interaction                                                                                 --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_instant_interactions = toggle_instant_interactions or function(info)
    toggleInstantInteractions = not toggleInstantInteractions

    if toggleInstantInteractions then
        local arr = {"driving_drive", "corpse_alarm_pager"}

        if not _getTimer then
            _getTimer = BaseInteractionExt._get_timer
        end

        function BaseInteractionExt:_get_timer()
            for _, item in pairs(arr) do
                if self.tweak_data == item then
                    return _getTimer(self)
                end
            end
            return 0
        end

        managers.mission._fading_debug_output:script().log('Instant Interactions - Activated', Color.green)
    else
        if not _getTimer then
            _getTimer = BaseInteractionExt._get_timer
        end

        function BaseInteractionExt:_get_timer()
            return _getTimer(self)
        end

        managers.mission._fading_debug_output:script().log('Instant Interactions - Deactivated', Color.red)
    end

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                             Player Movement Options                                                                               --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_jump_higher = toggle_jump_higher or function(info)
    toggleJumpHigher = not toggleJumpHigher

    if toggleJumpHigher then
        function PlayerStandard:_perform_jump(jump_vec)
            local v = math.UP * 470
            if not self._running then
                v = math.UP * 470 * 5
            end
            self._unit:mover():set_velocity(v)
        end
        managers.mission._fading_debug_output:script().log('Jump Higher - Activated', Color.green)
    else
        function PlayerStandard:_perform_jump(jump_vec)
            local v = math.UP * 470
            if not self._running then
                v = math.UP * 470 * 1
            end
            self._unit:mover():set_velocity(v)
        end
        managers.mission._fading_debug_output:script().log('Jump Higher - Deactivated', Color.red)
    end

end

toggle_remove_carry_penalty = toggle_remove_carry_penalty or function(info)
    toggleRemoveCarryPenalty = not toggleRemoveCarryPenalty

    if toggleRemoveCarryPenalty then
        local car_arr1 = {'being', 'mega_heavy', 'heavy', 'medium', 'light', 'coke_light'}

        for i, name in pairs(car_arr1) do
            tweak_data.carry.types[name].throw_distance_multiplier = 1
            tweak_data.carry.types[name].move_speed_modifier = 1
            tweak_data.carry.types[name].jump_modifier = 1
            tweak_data.carry.types[name].can_run = true
        end

        managers.mission._fading_debug_output:script().log('Remove Speed Penalty While Carrying Bags - Activated',
            Color.green)
    else
        local car_arr2 = {'being'}

        for i, name in ipairs(car_arr2) do
            tweak_data.carry.types[name].throw_distance_multiplier = 0.5
            tweak_data.carry.types[name].move_speed_modifier = 0.5
            tweak_data.carry.types[name].jump_modifier = 0.5
            tweak_data.carry.types[name].can_run = false
        end

        local car_arr3 = {'mega_heavy'}

        for i, name in ipairs(car_arr3) do
            tweak_data.carry.types[name].throw_distance_multiplier = 0.5
            tweak_data.carry.types[name].move_speed_modifier = 0.5
            tweak_data.carry.types[name].jump_modifier = 0.5
            tweak_data.carry.types[name].can_run = false
        end

        local car_arr4 = {'heavy'}

        for i, name in ipairs(car_arr4) do
            tweak_data.carry.types[name].throw_distance_multiplier = 0.8
            tweak_data.carry.types[name].move_speed_modifier = 0.75
            tweak_data.carry.types[name].jump_modifier = 1
            tweak_data.carry.types[name].can_run = false
        end

        local car_arr5 = {'medium'}

        for i, name in ipairs(car_arr5) do
            tweak_data.carry.types[name].throw_distance_multiplier = 1
            tweak_data.carry.types[name].move_speed_modifier = 0.6
            tweak_data.carry.types[name].jump_modifier = 1
            tweak_data.carry.types[name].can_run = false
        end

        local car_arr6 = {'light'}

        for i, name in ipairs(car_arr6) do
            tweak_data.carry.types[name].throw_distance_multiplier = 1
            tweak_data.carry.types[name].move_speed_modifier = 1
            tweak_data.carry.types[name].jump_modifier = 1
            tweak_data.carry.types[name].can_run = true
        end

        local car_arr7 = {'coke_light'}

        for i, name in ipairs(car_arr7) do
            tweak_data.carry.types[name].throw_distance_multiplier = 1
            tweak_data.carry.types[name].move_speed_modifier = 1
            tweak_data.carry.types[name].jump_modifier = 1
            tweak_data.carry.types[name].can_run = true
        end

        managers.mission._fading_debug_output:script().log('Remove Speed Penalty While Carrying Bags - Deactivated',
            Color.red)
    end

end

infinite_stamina = infinite_stamina or function(info)

    function PlayerMovement:_change_stamina(value)
    end

    function PlayerMovement:is_stamina_drained()
        return false
    end

    function PlayerStandard:_can_run_directional()
        return true
    end

    managers.mission._fading_debug_output:script().log('Infinite Stamina - Activated', Color.green)

end

toggle_run_faster = toggle_run_faster or function(info)
    toggleRunFaster = not toggleRunFaster

    if toggleRunFaster then
        tweak_data.player.movement_state.standard.movement.multiplier.run = 5
        managers.mission._fading_debug_output:script().log('Run Faster - Activated', Color.green)
    else
        tweak_data.player.movement_state.standard.movement.multiplier.run = 1
        managers.mission._fading_debug_output:script().log('Run Faster - Deactivated', Color.red)
    end

end

toggle_walk_faster = toggle_walk_faster or function(info)
    toggleWalkFaster = not toggleWalkFaster

    if toggleWalkFaster then
        tweak_data.player.movement_state.standard.movement.multiplier.walk = 5
        managers.mission._fading_debug_output:script().log('Walk Faster - Activated', Color.green)
    else
        tweak_data.player.movement_state.standard.movement.multiplier.walk = 1
        managers.mission._fading_debug_output:script().log('Walk Faster - Deactivated', Color.red)
    end

end

toggle_climb_faster = toggle_climb_faster or function(info)
    toggleClimbFaster = not toggleClimbFaster

    if toggleClimbFaster then
        tweak_data.player.movement_state.standard.movement.multiplier.climb = 5
        managers.mission._fading_debug_output:script().log('Climb Faster - Activated', Color.green)
    else
        tweak_data.player.movement_state.standard.movement.multiplier.climb = 1
        managers.mission._fading_debug_output:script().log('Climb Faster - Deactivated', Color.red)
    end

end

remove_speed_penalty = remove_speed_penalty or function(info)

    function PlayerManager:body_armor_movement_penalty()
        return 1
    end

    managers.mission._fading_debug_output:script().log('Remove Body Armor Speed Penalty - Activated', Color.green)

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                               Player Weapon Options                                                                               --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_remove_weapon_recoil = toggle_remove_weapon_recoil or function(info)
    toggleFireRate = not toggleFireRate

    if toggleFireRate then
        function NewRaycastWeaponBase:recoil_multiplier()
            return 0
        end
        managers.mission._fading_debug_output:script().log('Remove Weapon Recoil - Activated', Color.green)
    else
        function NewRaycastWeaponBase:recoil_multiplier()
            return 1
        end
        managers.mission._fading_debug_output:script().log('Remove Weapon Recoil - Deactivated', Color.red)
    end

end

toggle_increased_weapon_reload_speed = toggle_increased_weapon_reload_speed or function(info)
    toggleFireRate = not toggleFireRate

    if toggleFireRate then
        function NewRaycastWeaponBase:reload_speed_multiplier()
            return 1000
        end
        managers.mission._fading_debug_output:script().log('Instant Weapon Reload Speed - Activated', Color.green)
    else
        function NewRaycastWeaponBase:reload_speed_multiplier()
            return 1
        end
        managers.mission._fading_debug_output:script().log('Instant Weapon Reload Speed - Deactivated', Color.red)
    end

end

toggle_increased_weapon_fire_rate = toggle_increased_weapon_fire_rate or function(info)
    toggleFireRate = not toggleFireRate

    if toggleFireRate then
        function NewRaycastWeaponBase:fire_rate_multiplier()
            return 100
        end
        managers.mission._fading_debug_output:script().log('Extreme Weapon Fire Rate - Activated', Color.green)
    else
        function NewRaycastWeaponBase:fire_rate_multiplier()
            return 1
        end
        managers.mission._fading_debug_output:script().log('Extreme Weapon Fire Rate - Deactivated', Color.red)
    end

end

toggle_increased_weapon_swap_speed = toggle_increased_weapon_swap_speed or function(info)
    toggleFireRate = not toggleFireRate

    if toggleFireRate then
        function PlayerStandard:_get_swap_speed_multiplier()
            return 100
        end
        managers.mission._fading_debug_output:script().log('Instant Weapon Swap Speed - Activated', Color.green)
    else
        function PlayerStandard:_get_swap_speed_multiplier()
            return 1
        end
        managers.mission._fading_debug_output:script().log('Instant Weapon Swap Speed - Deactivated', Color.red)
    end

end

remove_spread = remove_spread or function(info)

    function NewRaycastWeaponBase:_get_spread_from_number()
        return 0
    end

    managers.mission._fading_debug_output:script().log('Remove Bullets Spread - Activated', Color.green)

end

one_shot_kill = one_shot_kill or function(info)

    function RaycastWeaponBase:_get_current_damage()
        return math.huge
    end

    managers.mission._fading_debug_output:script().log('One Shot Kill - Activated', Color.green)

end

melee_tweaks = melee_tweaks or function(info)

    for _, wep in pairs(tweak_data.blackmarket.melee_weapons) do
        if wep then
            wep.expire_t = 0.1
            wep.charge_time = 0.1
            wep.stats.range = 350
        end
    end

    local damage_melee_original = CopDamage.damage_melee

    function CopDamage:damage_melee(attack_data, ...)
        attack_data.damage = attack_data.damage * 5000
        return damage_melee_original(self, attack_data, ...)
    end

    local super_damage_melee = TankCopDamage.super.damage_melee

    function TankCopDamage.damage_melee(...)
        return super_damage_melee(...)
    end

    local super_damage_melee = HuskTankCopDamage.super.damage_melee

    function HuskTankCopDamage.damage_melee(...)
        return super_damage_melee(...)
    end

    managers.mission._fading_debug_output:script().log('Melee Tweaks - Activated', Color.green)

end

infinite_ammo = infinite_ammo or function(info)
    if not _fireWep then
        _fireWep = NewRaycastWeaponBase.fire
    end

    function NewRaycastWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul,
        target_unit)
        local result = _fireWep(self, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul,
            target_unit)
        if managers.player:player_unit() == self._setup.user_unit then
            self.set_ammo(self, 1.0)
        end
        return result
    end

    managers.mission._fading_debug_output:script().log('Infinite Ammo Without Reload - Activated', Color.green)

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                 Heist Options                                                                                     --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
remove_cash_penalty = remove_cash_penalty or function(info)

    function MoneyManager:get_civilian_deduction()
        return 0
    end

    function MoneyManager:civilian_killed()
        return
    end

    managers.mission._fading_debug_output:script().log('Remove Cash Penalty For Killing Civilians - Activated', Color.green)

end

remove_alarm_laser = remove_alarm_laser or function(info)

    function ElementLaserTrigger:on_executed(instigator, alternative)
    end

    managers.mission._fading_debug_output:script().log('Remove All Static Alarm Lasers - Activated', Color.green)

end

remove_pagers = remove_pagers or function(info)
    local old_post_init = CopBrain.post_init
    local array = {"security", "city_swat", "gensec", "bolivian", "bolivian_indoors"}

    function CopBrain:post_init(...)
        old_post_init(self, ...)
        for k, v in pairs(array) do
            self._unit:unit_data().has_alarm_pager = false
        end
    end

    managers.mission._fading_debug_output:script().log('Remove Pagers - Activated', Color.green)

end

kill_all_enemies = kill_all_enemies or function(info)
    local Vector3 = Vector3
    local managers = managers
    local M_player = managers.player
    local M_enemy = managers.enemy

    local function dmg_melee(unit)
        if unit then
            local action_data = {
                damage = math.huge,
                damage_effect = unit:character_damage()._HEALTH_INIT * 2,
                attacker_unit = M_player:player_unit(),
                attack_dir = Vector3(0, 0, 0),
                name_id = 'rambo',
                col_ray = {
                    position = unit:position(),
                    body = unit:body("body")
                }
            }
            unit:unit_data().has_alarm_pager = false
            unit:character_damage():damage_melee(action_data)
        end
    end

    for _, ud in pairs(M_enemy:all_enemies()) do
        pcall(dmg_melee, ud.unit)
    end

    managers.mission._fading_debug_output:script().log('Kill All Enemies On The Map - Activated', Color.green)

end

tie_all_civilians = tie_all_civilians or function(info)
    local managers = managers
    local M_player = managers.player
    local M_enemy = managers.enemy
    local HUGE = math.huge
    local pairs = pairs

    function tieall()
        local player = M_player:player_unit()
        local all_civilians = M_enemy:all_civilians()
        for u_key, u_data in pairs(all_civilians) do
            local unit = u_data.unit
            local brain = unit:brain()
            if not brain:is_tied() then
                local action_data = {
                    type = "act",
                    body_part = 1,
                    clamp_to_graph = true,
                    variant = "halt"
                }
                brain:action_request(action_data)
                brain._current_logic.on_intimidated(brain._logic_data, HUGE, player, true)
                brain:on_tied(player)
            end
        end
    end

    tieall()

    managers.mission._fading_debug_output:script().log('Tie All Civilians On The Map - Activated', Color.green)

end

convert_all_enemies = convert_all_enemies or function(info)
    local AI_State = managers.groupai:state()
    local convert_hostage_to_criminal = AI_State.convert_hostage_to_criminal

    function convertall()
        local all_enemies = managers.enemy:all_enemies()
        for _, ud in pairs(all_enemies) do
            local unit = ud.unit
            if not unit:brain()._logic_data.is_converted then
                pcall(convert_hostage_to_criminal, AI_State, unit)
            end
        end
    end

    convertall()

    managers.mission._fading_debug_output:script().log('Convert All Enemies On The Map - Activated', Color.green)

end

auto_pickup = auto_pickup or function(info)
    ObjectInteractionManager.AUTO_PICKUP_DELAY = 0.01
    local _update_targeted_original = ObjectInteractionManager._update_targeted

    function ObjectInteractionManager:_update_targeted(...)
        _update_targeted_original(self, ...)
        if alive(self._active_unit) then
            local t = Application:time()
            if self._active_unit:base() and self._active_unit:base().small_loot and
                (t >= (self._next_auto_pickup_t or 0)) then
                self._next_auto_pickup_t = t + ObjectInteractionManager.AUTO_PICKUP_DELAY
                self:interact(managers.player:player_unit())
            end
        end
    end

    managers.mission._fading_debug_output:script().log('Auto Pick Up - Activated', Color.green)

end

carry_stacker = carry_stacker or function(info)
    if not CarryStackerSetupDone then
        CarryStackerSetupDone = true
        if managers and managers.player and IntimitateInteractionExt and CarryInteractionExt then
            managers.player.carry_stack = {}
            managers.player.carrystack_lastpress = 0
            managers.player.drop_all_bags = false
            ofuncs = {
                managers_player_set_carry = managers.player.set_carry,
                managers_player_drop_carry = managers.player.drop_carry,
                IntimitateInteractionExt__interact_blocked = IntimitateInteractionExt._interact_blocked
            }

            function managers.player:refresh_stack_counter()
                local count = #self.carry_stack + (self:is_carrying() and 1 or 0)
                managers.hud:remove_special_equipment("carrystacker")
                if count > 0 then
                    managers.hud:add_special_equipment({
                        id = "carrystacker",
                        icon = BagIcon,
                        amount = count
                    })
                end
            end

            function managers.player:rotate_stack(dir)
                if #managers.player.carry_stack < 1 or (#managers.player.carry_stack < 2 and not self:is_carrying()) then
                    return
                end
                if self:is_carrying() then
                    table.insert(self.carry_stack, self:get_my_carry_data())
                end
                if dir == "up" then
                    table.insert(self.carry_stack, 1, table.remove(self.carry_stack))
                else
                    table.insert(self.carry_stack, table.remove(self.carry_stack, 1))
                end
                local cdata = table.remove(self.carry_stack)
                if cdata then
                    if self:is_carrying() then
                        self:carry_discard()
                    end
                    ofuncs.managers_player_set_carry(self, cdata.carry_id, cdata.multiplier, cdata.dye_initiated,
                        cdata.has_dye_pack, cdata.dye_value_multiplier, cdata.zipline_unit)
                end
            end

            function managers.player:drop_carry(zipline_unit)
                ofuncs.managers_player_drop_carry(self, zipline_unit)
                if #self.carry_stack > 0 then
                    local cdata = table.remove(self.carry_stack)
                    if cdata then
                        self:set_carry(cdata.carry_id, cdata.multiplier or 1, cdata.dye_initiated, cdata.has_dye_pack,
                            cdata.dye_value_multiplier, cdata.zipline_unit)
                    end
                end
                self:refresh_stack_counter()
                if self.drop_all_bags then
                    if #self.carry_stack > 0 or self:is_carrying() then
                        self:drop_carry()
                    end
                    self.drop_all_bags = false
                end
            end

            function managers.player:set_carry(carry_id, carry_multiplier, dye_initiated, has_dye_pack,
                dye_value_multiplier, zipline_unit)
                if self:is_carrying() and self:get_my_carry_data() then
                    table.insert(self.carry_stack, self:get_my_carry_data())
                end
                ofuncs.managers_player_set_carry(self, carry_id, carry_multiplier, dye_initiated, has_dye_pack,
                    dye_value_multiplier, zipline_unit)
                self:refresh_stack_counter()
            end

            function managers.player:carry_discard()
                managers.hud:remove_teammate_carry_info(HUDManager.PLAYER_PANEL)
                managers.hud:temp_hide_carry_bag()
                self:update_removed_synced_carry_to_peers()
                if self._current_state == "carry" then
                    managers.player:set_player_state("standard")
                end
            end

            function IntimitateInteractionExt:_interact_blocked(player)
                if self.tweak_data == "corpse_dispose" then
                    if not managers.player:has_category_upgrade("player", "corpse_dispose") then
                        return true
                    end
                    return not managers.player:can_carry("person")
                end
                return ofuncs.IntimitateInteractionExt__interact_blocked(self, player)
            end

            function CarryInteractionExt:_interact_blocked(player)
                return not managers.player:can_carry(self._unit:carry_data():carry_id())
            end

            function CarryInteractionExt:can_select(player)
                return CarryInteractionExt.super.can_select(self, player)
            end

            function managers.player:carry_stacker()
                if _debugEnabled then
                    io.stderr:write("current stack size: " .. tostring(#managers.player.carry_stack) .. "\n")
                    if #managers.player.carry_stack > 0 then
                        for _, v in pairs(managers.player.carry_stack) do
                            io.stderr:write("item: " .. v.carry_id .. "\n")
                        end
                    end
                end
                local cdata = self:get_my_carry_data()
                if self:is_carrying() and cdata then
                    table.insert(self.carry_stack, self:get_my_carry_data())
                    self:carry_discard()
                    managers.hud:present_mid_text({
                        title = "Carry Stack",
                        text = cdata.carry_id .. " Pushed",
                        time = 1
                    })
                elseif #self.carry_stack > 0 then
                    cdata = table.remove(self.carry_stack)
                    self:set_carry(cdata.carry_id, cdata.multiplier, cdata.dye_initiated, cdata.has_dye_pack,
                        cdata.dye_value_multiplier, cdata.zipline_unit)
                    managers.hud:present_mid_text({
                        title = "Carry Stack",
                        text = cdata.carry_id .. " Popped",
                        time = 1
                    })
                else
                    managers.hud:present_mid_text({
                        title = "Carry Stack",
                        text = "Empty",
                        time = 1
                    })
                end
                if (Application:time() - self.carrystack_lastpress) < 0.3 and
                    (self:is_carrying() or #self.carry_stack > 0) then
                    self.drop_all_bags = true
                    self:drop_carry()
                end
                self.carrystack_lastpress = Application:time()
                self:refresh_stack_counter()
            end

        end

    end

    managers.mission._fading_debug_output:script().log('Carry Stacker - Activated', Color.green)

end

force_win = force_win or function(info)
    local pairs = pairs
    local Application = Application
    local digest_value = Application.digest_value
    local Global = Global
    local G_game_settings = Global.game_settings
    local managers = managers
    local M_network = managers.network
    local M_loot = managers.loot
    local secure_small_loot = M_loot.secure_small_loot
    local get_secured_bonus_bags_amount = M_loot.get_secured_bonus_bags_amount
    local tweak_data = tweak_data
    local T_levels = tweak_data.levels
    local T_money = tweak_data.money_manager
    local T_M_bag_values = tweak_data.money_manager.bag_values

    local BEST_BAG = false

    local get_the_most_expensive_bag = function()
        local best_val = 0
        local best_bag = ''
        local A = Application
        local digest_value = digest_value
        for name, val in pairs(T_M_bag_values) do
            val = digest_value(A, val, false)
            if (val > best_val) then
                best_val = val
                best_bag = name
            end
        end
        if (best_bag == '') then
            best_bag = 'hope_diamond'
        end
        BEST_BAG = best_bag
        return best_bag
    end

    local secure_rupies = function()
        local level = G_game_settings.level_id
        if (level) then
            local bag_limit = T_levels[level].max_bags or 20
            local best_bag = BEST_BAG or get_the_most_expensive_bag()
            local secure = M_loot.secure
            for i = get_secured_bonus_bags_amount(M_loot) + 1, bag_limit do
                secure(M_loot, best_bag, 1, true)
            end
        end
    end

    local add_some_cash = function()
        for i = 1, 50 do
            secure_small_loot(M_loot, "gen_atm", 3)
        end
    end

    local you_winner = function()

        secure_rupies()
        add_some_cash()

        local num_winners = M_network:session():amount_of_alive_players()
        M_network._session:send_to_peers("mission_ended", true, num_winners)
        game_state_machine:change_state_by_name("victoryscreen", {
            num_winners = num_winners,
            personal_win = true
        })
    end

    you_winner()

    managers.mission._fading_debug_output:script().log('Force Win - Activated', Color.green)

end

remove_invisible_walls = remove_invisible_walls or function(info)
    local net_session = managers.network:session()
    if net_session then
        local CollisionData = {
            ["276de19dc5541f30"] = true,
            ["e379cc9592197cd8"] = true,
            ["8f3cb89b79b42ec4"] = true,
            ["6cdb4f6f58ec4fa8"] = true,
            ["7ae8fcbfe6a00f7b"] = true,
            ["85462a64da94ee78"] = true,
            ["7a4c85917d8d8323"] = true,
            ["b37a4188fde4c161"] = true,
            ["7b91ae618eadbe49"] = true,
            ["01c78e4ef0340674"] = true,
            ["adea0368e2fee02b"] = true,
            ["42370b3a7b92f537"] = true,
            ["39d0838c190f1540"] = true,
            ["cacb76e8e1d7e2f3"] = true,
            ["c746af9ae100c837"] = true,
            ["75baea8dccabc8d5"] = true,
            ["4027cbad1f8d5b37"] = true,
            ["9b2fcf39f23e2344"] = true,
            ["d678a2a41e3f1bfb"] = true,
            ["0fe54fe3af59d86c"] = true,
            ["2854ee0748613f72"] = true,
            ["16dde5dd77259b35"] = true,
            ["8969155cb42a67cc"] = true,
            ["c5c4442c5e147cb0"] = true,
            ["9eda9e73ac0ef710"] = true,
            ["673ea142d68175df"] = true,
            ["260a42b4809c08dc"] = true,
            ["9d8b22836aa015ed"] = true,
            ["78f4407343b48f6d"] = true,
            ["96eba158d67240f6"] = true,
            ["a3649015ec10f0fa"] = true,
            ["6cb6040856588734"] = true,
            ["97e8d510fc7f6b4b"] = true,
            ["99792495ba726698"] = true,
            ["e765f9d63549a5c5"] = true,
            ["093021865a2c35af"] = true,
            ["a5bab566e1733d44"] = true,
            ["3345b74c3081f3f9"] = true,
            ["f9639a083eb4eb0c"] = true,
            ["8f0bd5d3ce8adf20"] = true,
            ["120d0ca08375e85e"] = true,
            ["d6ab68fdfb25156e"] = true,
            ["77175ed91c87d38a"] = true,
            ["89a7dbeb98bb47fb"] = true,
            ["67e5497920d65b45"] = true,
            ["4385cb1d46044948"] = true,
            ["75d60c30cfc752d5"] = true,
            ["6e94e532295a1c4c"] = true,
            ["b7dd69c3082ad494"] = true,
            ["03996689587afc9c"] = true,
            ["fe7682409496395c"] = true,
            ["20a34b41ca06015c"] = true,
            ["70fbfdaf5e1c50a1"] = true,
            ["cbeb471aa32636ea"] = true,
            ["7c6a421c90a8709a"] = true,
            ["fe13549df62eab40"] = true,
            ["df37c0dd7a9e1392"] = true,
            ["887ceed0e322a202"] = true,
            ["b1f9779228aff5cf"] = true,
            ["ea53e01e72a77431"] = true,
            ["31245608e2096b2a"] = true
        }

        for _, unit in pairs(World:find_units_quick("all", 1)) do
            if CollisionData[unit:name():key()] then
                unit:set_slot(0)
            end
        end

    end

    managers.mission._fading_debug_output:script().log('Remove Invisible Walls - Activated', Color.green)

end

remote_camera = remote_camera or function(info)
    local game_state_machine = game_state_machine
    local change_state_by_name = game_state_machine.change_state_by_name
    local can_change_state_by_name = game_state_machine.can_change_state_by_name

    local function remote_camera()
        if (can_change_state_by_name(game_state_machine, "ingame_access_camera")) then
            change_state_by_name(game_state_machine, "ingame_access_camera")
        end
    end

    remote_camera()

    managers.mission._fading_debug_output:script().log('Remote Camera Access - Activated', Color.green)

end

toggle_xray = toggle_xray or function(info)
    local ColorList = {
        default = 'FF9933',
        friendly = 'A3FFA3',
        hostage = 'FFFFFF',
        pickup = 'FF9933',
        civpickup = 'FF9933',
        enepickup = 'FF9933',
        camera = 'CC0000',
        civilian = '003399',
        civilian_female = '003399',
        spooc = 'CC0000',
        taser = 'CC0000',
        shield = 'CC0000',
        tank = 'CC0000',
        sniper = 'CC0000',
        gangster = 'CC0000',
        security = 'CC0000',
        medic = 'CC0000',
        gensec = 'CC0000',
        swat = 'CC0000',
        heavy_swat = 'CC0000',
        fbi = 'CC0000',
        fbi_swat = 'CC0000',
        fbi_heavy_swat = 'CC0000',
        cop_female = 'CC0000',
        city_swat = 'CC0000',
        mobster_boss = 'CC0000',
        mobster = 'CC0000',
        hector_boss = 'CC0000',
        hector_boss_no_armor = 'CC0000',
        biker_boss = 'CC0000',
        chavez_boss = 'CC0000',
        triad = 'CC0000',
        thug = 'CC0000',
        biker = 'CC0000',
        bolivians = 'CC0000',
        security_mex = 'CC0000',
        bolivian = 'CC0000',
        bolivian_indoors = 'CC0000',
        tank_mini = 'CC0000',
        tank_medic = 'CC0000',
        tank_hw = 'CC0000',
        swat_van_turret_module = 'CC0000',
        ceiling_turret_module_no_idle = 'CC0000',
        aa_turret_module = 'CC0000',
        Phalanx = 'CC0000',
        Phalanx_minion = 'CC0000',
        drug_lord_boss = 'CC0000',
        drug_lord_boss_stealth = 'CC0000',
        spa_vip = 'CC0000',
        spa_vip_hurt = 'CC0000',
        captain = 'CC0000',
        cop = 'CC0000',
        nathan = 'CC0000',
        dealer = 'CC0000',
        biker_escape = 'CC0000',
        old_hoxton_mission = 'CC0000',
        inside_man = 'CC0000',
        triad_boss_no_armor = 'CC0000',
        ranchmanager = 'CC0000',
        bolivian_indoors_mex = 'CC0000',
        security_mex_no_pager = 'CC0000',
        cop_scared = 'CC0000',
        security_undominatable = 'CC0000',
        mute_security_undominatable = 'CC0000'
    }

    function getUnitColor(unit)
        if not (unit:contour() and alive(unit) and unit:base()) then
            return
        end
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
        for u_key, u_data in pairs(managers.groupai:state()._security_cameras) do
            if u_data.contour then
                u_data:contour():add("mark_unit", syncMark, multi)
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
                    ContourExt._types.friendly.fadeout = 4.5
                    ContourExt._types.friendly.fadeout_silent = 13.5
                    u_data.unit:contour():setData({
                        is_converted = true
                    })
                    u_data.unit:contour():add("friendly", syncMark, multi)
                else
                    if isHostage(u_data.unit) then
                        u_data.unit:contour():setData({
                            is_hostage = true
                        })
                    end
                    u_data.unit:contour():add("mark_enemy", syncMark, multi)
                end
            end
        end
    end

    function isHostage(unit)
        if unit and alive(unit) and ((unit.brain and unit:brain().is_hostage and unit:brain():is_hostage()) or
            (unit.anim_data and (unit:anim_data().tied or unit:anim_data().hands_tied))) then
            return true
        end
        return false
    end

    function isHost()
        if not Network then
            return false
        end
        return not Network:is_client()
    end

    function inGame()
        if not game_state_machine then
            return false
        end
        return string.find(game_state_machine:current_state_name(), "game")
    end

    function markData()
        markEnemies()
    end

    function markClear()
        if not inGame() then
            return
        end
        for u_key, u_data in pairs(managers.groupai:state()._security_cameras) do
            if u_data.contour then
                u_data:contour():removeAll()
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
                if self._unit:name() ~= Idstring("units/pickups/ammo/ammo_pickup") then
                    local color = getUnitColor(self._unit)
                    if color then
                        self._materials = self._materials or self._unit:get_objects_by_type(Idstring("material"))
                        for _, material in ipairs(self._materials) do
                            material:set_variable(Idstring("contour_color"), color)
                        end
                        return
                    end
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

    function UnitNetworkHandler:mark_enemy(unit, marking_strength, sender)
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
                markData()
            end
        end

    end

    function markToggle(toggleSync)
        if not inGame() then
            return
        end
        if toggleSync then
            syncMark = not syncMark
        else
            toggleMark = not toggleMark
        end
        markData()
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                              Player Equipment Options                                                                             --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_infinite_equipment = toggle_infinite_equipment or function(info)
    toggleInfiniteCableTies = not toggleInfiniteCableTies

    if toggleInfiniteCableTies then
        function PlayerManager:remove_equipment(equipment_id)
        end
        managers.mission._fading_debug_output:script().log('Infinite Equipment - Activated', Color.green)
    else
        function PlayerManager:remove_equipment(equipment_id, slot)
            local current_equipment = self:selected_equipment()
            local equipment, index = self:equipment_data_by_name(equipment_id)
            local new_amount = Application:digest_value(equipment.amount[slot or 1], false) - 1
            equipment.amount[slot or 1] = Application:digest_value(new_amount, true)
            if current_equipment and current_equipment.equipment == equipment.equipment then
                set_hud_item_amount(index, get_as_digested(equipment.amount))
            end
            if not slot or slot and slot < 2 then
                self:update_deployable_equipment_amount_to_peers(equipment.equipment, new_amount)
            end
        end
        managers.mission._fading_debug_output:script().log('Infinite Equipment - Deactivated', Color.red)
    end

end

toggle_instant_deploy = toggle_instant_deploy or function(info)
    toggleInstantDeploy = not toggleInstantDeploy

    if toggleInstantDeploy then
        function PlayerManager:selected_equipment_deploy_timer()
            return 0.1
        end
        managers.mission._fading_debug_output:script().log('Instant Deploy - Activated', Color.green)
    else
        function PlayerManager:selected_equipment_deploy_timer()
            return 2
        end
        managers.mission._fading_debug_output:script().log('Instant Deploy - Deactivated', Color.red)
    end
	
end

toggle_infinite_cable_ties = toggle_infinite_cable_ties or function(info)
    toggleInfiniteCableTies = not toggleInfiniteCableTies

    if toggleInfiniteCableTies then
        function PlayerManager:remove_special(name)
        end
        managers.mission._fading_debug_output:script().log('Infinite Cable Ties - Activated', Color.green)
    else
        function PlayerManager:remove_special(name)
            local special_equipment = self._equipment.specials[name]

            if not special_equipment then
                return
            end
            local special_amount = special_equipment.amount and Application:digest_value(special_equipment.amount, false)

            if special_amount and special_amount ~= -1 then
                special_amount = math.max(0, special_amount - 1)
                if special_equipment.is_cable_tie then
                    managers.hud:set_cable_ties_amount(HUDManager.PLAYER_PANEL, special_amount)
                    self:update_synced_cable_ties_to_peers(special_amount)
                else
                    managers.hud:set_special_equipment_amount(name, special_amount)
                    self:update_equipment_possession_to_peers(name, special_amount)
                end
                special_equipment.amount = Application:digest_value(special_amount, true)
            end

            if not special_amount or special_amount == 0 then
                if not special_equipment.is_cable_tie then
                    managers.hud:remove_special_equipment(name)
                    managers.network:session():send_to_peers_loaded("sync_remove_equipment_possession",
                        managers.network:session():local_peer():id(), name)
                    self:remove_equipment_possession(managers.network:session():local_peer():id(), name)
                end
                self._equipment.specials[name] = nil
                local equipment = tweak_data.equipments.specials[name]
                if equipment.player_rule then
                    self:set_player_rule(equipment.player_rule, false)
                end
            end

        end
        managers.mission._fading_debug_output:script().log('Infinite Cable Ties - Deactivated', Color.red)
    end

end

toggle_infinite_bodybags = toggle_infinite_bodybags or function(info)
    toggleInfiniteBodyBags = not toggleInfiniteBodyBags

    if toggleInfiniteBodyBags then
        function PlayerManager:on_used_body_bag()
            self:_set_body_bags_amount(self._local_player_body_bags)
        end
        managers.mission._fading_debug_output:script().log('Infinite Body Bags - Activated', Color.green)
    else
        function PlayerManager:on_used_body_bag()
            self:_set_body_bags_amount(self._local_player_body_bags - 1)
        end
        managers.mission._fading_debug_output:script().log('Infinite Body Bags - Deactivated', Color.red)
    end

end

instant_mask = instant_mask or function(info)

    tweak_data.player.put_on_mask_time = 0
    managers.mission._fading_debug_output:script().log('Instant Mask On - Activated', Color.green)

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                Player Skill Options                                                                               --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_six_sense_tweaks = toggle_six_sense_tweaks or function(info)
    toggleSixSenseTweaks = not toggleSixSenseTweaks

    if toggleSixSenseTweaks then
        tweak_data.player.omniscience.start_t = 0
        tweak_data.player.omniscience.interval_t = 1
        tweak_data.player.omniscience.sense_radius = 1000
        tweak_data.player.omniscience.target_resense_t = 15
        managers.mission._fading_debug_output:script().log('Six Sense Tweaks - Activated', Color.green)
    else
        tweak_data.player.omniscience.start_t = 3.5
        tweak_data.player.omniscience.interval_t = 1
        tweak_data.player.omniscience.sense_radius = 1000
        tweak_data.player.omniscience.target_resense_t = 15
        managers.mission._fading_debug_output:script().log('Six Sense Tweaks - Deactivated', Color.red)
    end

end

toggle_kick_starter = toggle_kick_starter or function(info)
    toggleKickStarter = not toggleKickStarter

    if toggleKickStarter then
        function Drill:on_melee_hit(peer_id)
            self._unit:interaction():interact(managers.player:player_unit())
        end
        local playerStandardInit = PlayerStandard.init
        function PlayerStandard:init(unit)
            playerStandardInit(self, unit)
            self._on_melee_restart_drill = true
        end
        managers.mission._fading_debug_output:script().log('Kick Starter - Activated', Color.green)
    else
        function Drill:on_melee_hit(peer_id)
            self._unit:interaction():interact(managers.player:player_unit())
        end
        local playerStandardInit = PlayerStandard.init
        function PlayerStandard:init(unit)
            playerStandardInit(self, unit)
            self._on_melee_restart_drill = false
        end
        managers.mission._fading_debug_output:script().log('Kick Starter - Deactivated', Color.red)
    end

end

toggle_infinite_pecm = toggle_infinite_pecm or function(info)
    toggleInfinitePECM = not toggleInfinitePECM

    if toggleInfinitePECM then
        tweak_data.projectiles.pocket_ecm_jammer.base_cooldown = 5
        managers.mission._fading_debug_output:script().log('Infinite Pocket ECM - Activated', Color.green)
    else
        tweak_data.projectiles.pocket_ecm_jammer.base_cooldown = 100
        managers.mission._fading_debug_output:script().log('Infinite Pocket ECM - Deactivated', Color.red)
    end

end

toggle_no_inspire_cooldown = toggle_no_inspire_cooldown or function(info)
    toggleNoInspireCooldown = not toggleNoInspireCooldown

    if toggleNoInspireCooldown then
        tweak_data.upgrades.values.cooldown.long_dis_revive[2] = 1
        managers.mission._fading_debug_output:script().log('No Inspire Cooldown - Activated', Color.green)
    else
        tweak_data.upgrades.values.cooldown.long_dis_revive[2] = 20
        managers.mission._fading_debug_output:script().log('No Inspire Cooldown - Deactivated', Color.red)
    end

end

toggle_max_dodge = toggle_max_dodge or function(info)
    toggleMaxDodge = not toggleMaxDodge

    if toggleMaxDodge then
        if not _uvDodge then
            _uvDodge = PlayerManager.upgrade_value
        end

        function PlayerManager:upgrade_value(category, upgrade, default)
            if category == "player" and upgrade == "passive_dodge_chance" then
                return 1
            elseif category == "player" and upgrade == "run_dodge_chance" then
                return 1
            else
                return _uvDodge(self, category, upgrade, default)
            end
        end

        managers.mission._fading_debug_output:script().log('100% Dodge Chance - Activated', Color.green)
    else
        if not _uvDodge then
            _uvDodge = PlayerManager.upgrade_value
        end

        function PlayerManager:upgrade_value(category, upgrade, default)
            if category == "player" and upgrade == "passive_dodge_chance" then
                return 0
            elseif category == "player" and upgrade == "run_dodge_chance" then
                return 0
            else
                return _uvDodge(self, category, upgrade, default)
            end
        end

        managers.mission._fading_debug_output:script().log('100% Dodge Chance - Deactivated', Color.red)
    end

end

toggle_max_armor_piercing = toggle_max_armor_piercing or function(info)
    togglemaxarmorpiercing = not togglemaxarmorpiercing

    if togglemaxarmorpiercing then
        if not _uvArmorPierce then
            _uvArmorPierce = PlayerManager.upgrade_value
        end

        function PlayerManager:upgrade_value(category, upgrade, default)
            if category == "weapon" and upgrade == "armor_piercing_chance" then
                return 1
            elseif category == "weapon" and upgrade == "armor_piercing_chance_silencer" then
                return 1
            else
                return _uvArmorPierce(self, category, upgrade, default)
            end
        end

        managers.mission._fading_debug_output:script().log('100% Armor Piercing Chance - Activated', Color.green)
    else
        if not _uvArmorPierce then
            _uvArmorPierce = PlayerManager.upgrade_value
        end

        function PlayerManager:upgrade_value(category, upgrade, default)
            if category == "weapon" and upgrade == "armor_piercing_chance" then
                return 0.25
            elseif category == "weapon" and upgrade == "armor_piercing_chance_silencer" then
                return 0.2
            else
                return _uvArmorPierce(self, category, upgrade, default)
            end
        end

        managers.mission._fading_debug_output:script().log('100% Armor Piercing Chance - Deactivated', Color.red)
    end

end

toggle_max_crit = toggle_max_crit or function(info)
    togglemaxcrit = not togglemaxcrit

    if togglemaxcrit then
        local data = UpgradesTweakData._init_pd2_values

        function UpgradesTweakData:_init_pd2_values()
            data(self, tweak_data)
            self.values.player.detection_risk_add_crit_chance = 
			{{
				1, 
				1, 
				"below", 
				999, 
				1
			}, 
			{
				1, 
				1, 
				"below", 
				999, 
				1
			}}
        end

        managers.mission._fading_debug_output:script().log('100% Crit Chance - Activated', Color.green)
    else
        local data = UpgradesTweakData._init_pd2_values

        function UpgradesTweakData:_init_pd2_values()
            data(self, tweak_data)
            self.values.player.detection_risk_add_crit_chance = 
			{{
				0.03, 
				3, 
				"below", 
				35, 
				0.3
			},
            {
				0.03, 
				1, 
				"below", 
				35, 
				0.3
			}}
        end
		
        managers.mission._fading_debug_output:script().log('100% Crit Chance - Deactivated', Color.red)
    end

end

toggle_infinite_jokers = toggle_infinite_jokers or function(info)
    toggleinfinitejokers = not toggleinfinitejokers

    if toggleinfinitejokers then
        if not _upgradeValueIntimidate then
            _upgradeValueIntimidate = PlayerManager.upgrade_value
        end

        function PlayerManager:upgrade_value(category, upgrade, default)
            if category == "player" and upgrade == "convert_enemies" then
                return true
            elseif category == "player" and upgrade == "convert_enemies_max_minions" then
                return 500
            else
                return _upgradeValueIntimidate(self, category, upgrade, default)
            end
        end

        managers.mission._fading_debug_output:script().log('Infinite Jokers - Activated', Color.green)
    else
        if not _upgradeValueIntimidate then
            _upgradeValueIntimidate = PlayerManager.upgrade_value
        end

        function PlayerManager:upgrade_value(category, upgrade, default)
            if category == "player" and upgrade == "convert_enemies" then
                return true
            elseif category == "player" and upgrade == "convert_enemies_max_minions" then
                return 2
            else
                return _upgradeValueIntimidate(self, category, upgrade, default)
            end
        end

        managers.mission._fading_debug_output:script().log('Infinite Jokers - Deactivated', Color.red)
    end

end

toggle_infinite_following_hostages = toggle_infinite_following_hostages or function(info)
    toggleinfinitefollowinghostages = not toggleinfinitefollowinghostages

    if toggleinfinitefollowinghostages then
        tweak_data.player.max_nr_following_hostages = 1000
        managers.mission._fading_debug_output:script().log('Infinite Following Hostages - Activated', Color.green)
    else
        tweak_data.player.max_nr_following_hostages = 2
        managers.mission._fading_debug_output:script().log('Infinite Following Hostages - Deactivated', Color.red)
    end

end

toggle_infinite_ecm = toggle_infinite_ecm or function(info)
    toggleinfiniteecm = not toggleinfiniteecm

    if toggleinfiniteecm then
        function ECMJammerBase:update()
            self._battery_life = self._max_battery_life
        end
        managers.mission._fading_debug_output:script().log('Infinite ECM - Activated', Color.green)
    else
        function ECMJammerBase:update()
            self._battery_life = self._battery_life - dt
        end
        managers.mission._fading_debug_output:script().log('Infinite ECM - Deactivated', Color.red)
    end

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                 Player Options                                                                                    --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
toggle_god_mode = toggle_god_mode or function(info)
    toggleGodMode = not toggleGodMode

    if toggleGodMode then
        managers.player:player_unit():character_damage():set_invulnerable(true)
        managers.mission._fading_debug_output:script().log('God Mode - Activated', Color.green)
    else
        managers.player:player_unit():character_damage():set_invulnerable(false)
        managers.mission._fading_debug_output:script().log('God Mode - Deactivated', Color.red)
    end

end

toggle_invisible = toggle_invisible or function(info)

    function update_invisible_state(state)
        local statetable = {"Standard", "Civilian", "MaskOff", "Clean", "BleedOut", "ParaChuting", "Incapacitated",
                            "Carry", "Arrested"}
        if alive(managers.player:player_unit()) then
            for id, state_table in pairs(statetable) do
                Hooks:Add("Player" .. state_table .. "Update", "UpdateMovState" .. id, function(t, dt)
                    self:_upd_attention()
                end)
            end
            managers.player:player_unit():movement():set_attention_settings({state})
        end
    end

    global_detection_toggle = global_detection_toggle or false

    if not global_detection_toggle then
        if HUDManager then
            if not orig then
                orig = HUDManager.update
            end
            function HUDManager:update(t, dt)
                orig(self, t, dt)
                update_invisible_state("pl_civilian")
            end
        end
        managers.mission._fading_debug_output:script().log('Invisible - Activated', Color.green)
    else
        update_invisible_state("pl_mask_on_foe_combatant_whisper_mode_stand")
        update_invisible_state("pl_mask_on_foe_combatant_whisper_mode_crouch")
        if orig then
            HUDManager.update = orig
        end
        managers.mission._fading_debug_output:script().log('Invisible - Deactivated', Color.red)
    end

    global_detection_toggle = not global_detection_toggle

end

remove_hit_disorientation = remove_hit_disorientation or function(info)

    function CoreEnvironmentControllerManager:hit_feedback_front()
    end

    function CoreEnvironmentControllerManager:hit_feedback_back()
    end

    function CoreEnvironmentControllerManager:hit_feedback_right()
    end

    function CoreEnvironmentControllerManager:hit_feedback_left()
    end

    function CoreEnvironmentControllerManager:hit_feedback_up()
    end

    function CoreEnvironmentControllerManager:hit_feedback_down()
    end

    managers.mission._fading_debug_output:script().log('Remove Hit Disorientation - Activated', Color.green)

end

remove_recoil = remove_recoil or function(info)

    function PlayerCamera:play_shaker()
    end

    managers.mission._fading_debug_output:script().log('Remove Camera Recoil - Activated', Color.green)

end

remove_camera_limits = remove_camera_limits or function(info)

    function FPCameraPlayerBase:set_limits(spin, pitch)
    end

    managers.mission._fading_debug_output:script().log('Remove Camera Limits - Activated', Color.green)

end

remove_headbob = remove_headbob or function(info)

    function PlayerStandard:_get_walk_headbob()
        return 0
    end

    managers.mission._fading_debug_output:script().log('Remove Headbob - Activated', Color.green)

end

remove_explosion_shake = remove_explosion_shake or function(info)

    function ExplosionManager:player_feedback()
    end

    managers.mission._fading_debug_output:script().log('Remove Explosion Shake - Activated', Color.green)

end

remove_flashbang = remove_flashbang or function(info)

    function PlayerDamage:_start_tinnitus(...)
        self:_stop_tinnitus()
    end

    function CoreEnvironmentControllerManager:set_flashbang(...)
    end

    managers.mission._fading_debug_output:script().log('Remove Flashbang - Activated', Color.green)

end

remove_weapon_sway = remove_weapon_sway or function(info)
    if not _PlayerTweakData_init then
        _PlayerTweakData_init = PlayerTweakData.init
    end

    function PlayerTweakData:init()
        _PlayerTweakData_init(self)

        for k, v in pairs(self.stances) do
            v.standard.shakers.breathing.amplitude = 0
            v.crouched.shakers.breathing.amplitude = 0
            v.steelsight.shakers.breathing.amplitude = 0
        end

    end

    managers.mission._fading_debug_output:script().log('Remove Weapon Sway - Activated', Color.green)

end

remove_camera_rotation = remove_camera_rotation or function(info)

    function PlayerCarry:enter(...)
        PlayerCarry.super.enter(self, ...)
        self._unit:camera():camera_unit():base():set_target_tilt(0)
    end

    managers.mission._fading_debug_output:script().log('Remove Camera Rotation When Holding A Bag - Activated', Color.green)

end

remove_detection_in_casing = remove_detection_in_casing or function(info)
    PlayerMaskOff = PlayerMaskOff or class(PlayerStandard)

    function PlayerMaskOff:init(unit)
        PlayerMaskOff.super.init(self, unit)
        self._mask_off_attention_settings = {"pl_civilian"}
    end

    managers.mission._fading_debug_output:script().log('Remove Detection Risk While In Casing Mode - Activated', Color.green)

end

counter_cloakers = counter_cloakers or function(info)

    function PlayerMovement:on_SPOOCed(enemy_unit)
        return "countered"
    end

    managers.mission._fading_debug_output:script().log('Counter Cloakers - Activated', Color.green)

end

replenish = replenish or function(info)
    local managers = managers
    local M_player = managers.player
    local players_list = M_player._players
    local set_player_state = M_player.set_player_state
    local add_grenade_amount = M_player.add_grenade_amount
    local alive = alive

    local function REPLENISH()
        local ply = players_list[1]
        if alive(ply) then
            ply:base():replenish()
            set_player_state(M_player, 'standard')
            add_grenade_amount(M_player, 3)
        end
    end

	REPLENISH()
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                Preplanning Options                                                                                --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
infinite_favors = infinite_favors or function(info)

    function PrePlanningManager:get_current_budget()
        return 0, 999
    end

    managers.mission._fading_debug_output:script().log('Infinite Favors - Activated', Color.green)

end

infinite_drawing_points = infinite_drawing_points or function(info)

    tweak_data.preplanning.gui.MAX_DRAW_POINTS = math.huge
    managers.mission._fading_debug_output:script().log('Infinite Drawing Points - Activated', Color.green)

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                              Player Progress Options                                                                              --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set_infamy_1 = set_infamy_1 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(25)
    end

    set_infamy_level()

end

set_infamy_2 = set_infamy_2 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(50)
    end

    set_infamy_level()

end

set_infamy_4 = set_infamy_3 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(75)
    end

    set_infamy_level()

end

set_infamy_4 = set_infamy_4 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(100)
    end

    set_infamy_level()

end

set_infamy_5 = set_infamy_5 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(150)
    end

    set_infamy_level()

end

set_infamy_6 = set_infamy_6 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(200)
    end

	set_infamy_level()
end

set_infamy_7 = set_infamy_7 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(300)
    end

    set_infamy_level()

end

set_infamy_8 = set_infamy_8 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(400)
    end

    set_infamy_level()

end

set_infamy_9 = set_infamy_9 or function(info)

    local function set_infamy_level()
        managers.experience:set_current_rank(500)
    end

    set_infamy_level()

end

reset_infamy = reset_infamy or function(info)

    local function reset_infamy_level()
        managers.experience:set_current_rank(0)
    end

    reset_infamy_level()
end

set_reputation_1 = set_reputation_1 or function(info)

    local function change_level()
        managers.experience:_set_current_level(20)
    end

    change_level()
end

set_reputation_2 = set_reputation_2 or function(info)

    local function change_level()
        managers.experience:_set_current_level(30)
    end

    change_level()

end

set_reputation_3 = set_reputation_3 or function(info)

    local function change_level()
        managers.experience:_set_current_level(40)
    end

    change_level()

end

set_reputation_4 = set_reputation_4 or function(info)

    local function change_level()
        managers.experience:_set_current_level(50)
    end

    change_level()

end

set_reputation_5 = set_reputation_5 or function(info)

    local function change_level()
        managers.experience:_set_current_level(60)
    end

    change_level()

end

set_reputation_6 = set_reputation_6 or function(info)

    local function change_level()
        managers.experience:_set_current_level(70)
    end

    change_level()

end

set_reputation_7 = set_reputation_7 or function(info)

    local function change_level()
        managers.experience:_set_current_level(80)
    end

    change_level()

end

set_reputation_8 = set_reputation_8 or function(info)

    local function change_level()
        managers.experience:_set_current_level(90)
    end

    change_level()

end

set_reputation_9 = set_reputation_9 or function(info)

    local function change_level()
        managers.experience:_set_current_level(100)
    end

    change_level()

end

reset_reputation = reset_reputation or function(info)

    local function reset_level()
        managers.experience:_set_current_level(0)
    end

    reset_level()

end

add_money_1 = add_money_1 or function(info)

    local function add_money()
        managers.money:_add_to_total(1000000)
    end

    add_money()

end

add_money_2 = add_money_2 or function(info)

    local function add_money()
        managers.money:_add_to_total(10000000)
    end
	
    add_money()
end

add_money_3 = add_money_3 or function(info)

    local function add_money()
        managers.money:_add_to_total(100000000)
    end
	
    add_money()
end

add_money_4 = add_money_4 or function(info)

    local function add_money()
        managers.money:_add_to_total(1000000000)
    end
	
    add_money()
end

add_money_5 = add_money_5 or function(info)

    local function add_money()
        managers.money:_add_to_total(10000000000)
    end
	
    add_money()
end

add_money_6 = add_money_6 or function(info)

    local function add_money()
        managers.money:_add_to_total(100000000000)
    end
	
    add_money()
end

add_money_7 = add_money_7 or function(info)

    local function add_money()
        managers.money:_add_to_total(1000000000000)
    end
	
    add_money()
end

add_money_8 = add_money_8 or function(info)

    local function add_money()
        managers.money:_add_to_total(10000000000000)
    end
	
    add_money()
end

add_money_9 = add_money_9 or function(info)

    local function add_money()
        managers.money:_add_to_total(100000000000000)
    end
	
    add_money()
end

reset_money = reset_money or function(info)

    local function reset_money()
        managers.money:reset()
    end
	
    reset_money()
end

set_skill_points = set_skill_points or function(info)

    local function set_skillpoints()
        managers.skilltree:_set_points(120)
    end
	
    set_skillpoints()
end

reset_skill_points = reset_skill_points or function(info)

    local function reset_skillpoints()
        managers.skilltree:_set_points(0)
    end
	
    reset_skillpoints()
end

set_crime_spree_1 = set_crime_spree_1 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (1000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_2 = set_crime_spree_2 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (10000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_3 = set_crime_spree_3 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (100000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_4 = set_crime_spree_4 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (400000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_5 = set_crime_spree_5 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (600000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_6 = set_crime_spree_6 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (800000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_7 = set_crime_spree_7 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (10000000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_8 = set_crime_spree_8 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (10000000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

set_crime_spree_9 = set_crime_spree_9 or function(info)

    local function set_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (100000000) or -1
        end

    end
	
    set_crimespree_spree_level()
end

reset_crime_spree = reset_crime_spree or function(info)

    local function reset_crimespree_spree_level()

        function CrimeSpreeManager:spree_level()
            return self:in_progress() and (0) or -1
        end

    end
	
    reset_crimespree_spree_level()
end

give_all_perk_decks = give_all_perk_decks or function(info)

    local function give_all_perks()
        Global.skilltree_manager.specializations.total_points = 315100
        Global.skilltree_manager.specializations.points = 315100

        for spec, _ in pairs(Global.skilltree_manager.specializations) do
            if type(spec) == 'number' then
                managers.skilltree.spend_specialization_points(managers.skilltree, 13700, spec)
            end
        end

    end
	
    give_all_perks()
end

reset_all_perk_decks = reset_all_perk_decks or function(info)

    local function reset_all_perks()
        managers.skilltree:reset_specializations()
    end
	
    reset_all_perks()
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                 Complete All Side Jobs                                                                            --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
complete_all_side_jobs = complete_all_side_jobs or function(info)
    local original_complete_daily = original_complete_daily or CustomSafehouseManager.set_active_daily

    function CustomSafehouseManager:set_active_daily(id)
        if self:get_daily_challenge() and self:get_daily_challenge().id ~= id then
            self:generate_daily(id)
        end
        self:complete_and_reward_daily(id)

        return original_complete_daily(self, id)
    end

    function CustomSafehouseManager:has_rewarded_daily()
        local is_just_completed = false

        for i, trophy in ipairs(self._global.completed_trophies) do
            if trophy.type == "daily" then
                is_just_completed = true
            end
        end

        return self:_get_daily_state() == "rewarded" and is_just_completed
    end

    local regular_challenges = regular_challenges or ChallengeManager.activate_challenge

    function ChallengeManager:activate_challenge(id, key, category)
        if self:has_active_challenges(id, key) then
            local challenge = self:get_challenge(id, key)
            challenge.completed = true
            challenge.rewarded = true
            challenge.category = category
            self._global.active_challenges[key or Idstring(id):key()] = challenge

            return true
        end

        return regular_challenges(self, id, key, category)
    end

    local side_jobs = side_jobs or SideJobEventManager.load

    function SideJobEventManager:load(cache, version)
        local state = cache[self.save_table_name]
        if state and state.version == self.save_version then
            for _, saved_challenge in ipairs(state.challenges or {}) do
                saved_challenge.completed = true
            end
        end
        return side_jobs(self, cache, version)
    end

    local event_missions = event_missions or EventManager.load

    if event_missions then
        function EventManager:load(cache, version)
            local state = cache[self.save_table_name]
            if state and state.version == self.save_version then
                for _, saved_challenge in ipairs(state.challenges or {}) do
                    saved_challenge.completed = true
                end
            end
            return event_missions(self, cache, version)
        end
    end

    local gage_spec_ops_missions = gage_spec_ops_missions or TangoManager.load

    function TangoManager:load(cache, version)
        local state = cache.Tango
        if state and state.version == TangoManager.SAVE_DATA_VERSION then
            for _, saved_challenge in ipairs(state.challenges or {}) do
                saved_challenge.completed = true
            end
        end
        return gage_spec_ops_missions(self, cache, version)
    end

    local aldstones_heritage_jobs = aldstones_heritage_jobs or SideJobGenericDLCManager.load

    function SideJobGenericDLCManager:load(cache, version)
        local state = cache[self.save_table_name]
        if state and state.version == self.save_version then
            for _, saved_challenge in ipairs(state.challenges or {}) do
                saved_challenge.completed = true
            end
        end
        return aldstones_heritage_jobs(self, cache, version)
    end

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                 Safe House Options                                                                              --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
max_safehouse_rooms = max_safehouse_rooms or function(info)
    local M_safehouse = managers.custom_safehouse
    local G_safehouse = Global.custom_safehouse_manager

    local function max_rooms_tier()
        for room_id, data in pairs(G_safehouse.rooms) do
            local max_tier = data.tier_max

            local current_tier = M_safehouse:get_room_current_tier(room_id)
            while max_tier > current_tier do
                current_tier = current_tier + 1

                local unlocked_tiers = M_safehouse._global.rooms[room_id].unlocked_tiers
                tab_insert(unlocked_tiers, current_tier)
            end

            M_safehouse:set_room_tier(room_id, max_tier)
        end
    end

    max_rooms_tier()

end

set_continental_coins_1 = set_continental_coins_1 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(1000000, true)
    end

    set_continental_coins()

end

set_continental_coins_2 = set_continental_coins_2 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(10000000, true)
    end

    set_continental_coins()

end

set_continental_coins_3 = set_continental_coins_3 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(100000000, true)
    end

    set_continental_coins()

end

set_continental_coins_4 = set_continental_coins_4 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(100000000, true)
    end

    set_continental_coins()

end

set_continental_coins_5 = set_continental_coins_5 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(1000000000, true)
    end

    set_continental_coins()

end

set_continental_coins_6 = set_continental_coins_6 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(10000000000, true)
    end

    set_continental_coins()

end

set_continental_coins_7 = set_continental_coins_7 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(100000000000, true)
    end

    set_continental_coins()

end

set_continental_coins_8 = set_continental_coins_8 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(1000000000000, true)
    end

    set_continental_coins()

end

set_continental_coins_9 = set_continental_coins_9 or function(info)

    local function set_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(10000000000000, true)
    end

    set_continental_coins()

end

reset_continental_coins = reset_continental_coins or function(info)

    local function reset_continental_coins()
        Global.custom_safehouse_manager.total = Application:digest_value(0, true)
    end

    reset_continental_coins()

end

disable_safehouse_raid = disable_safehouse_raid or function(info)

    function CustomSafehouseManager:is_being_raided()
        return false
    end

end

complete_all_trophies = complete_all_trophies or function(info)
    local M_safehouse = managers.custom_safehouse

    local function unlock_safehouse_trophies()
        local trophies = M_safehouse:trophies()
        for _, trophy in pairs(trophies) do
            for objective_id in pairs(trophy.objectives) do
                local objective = trophy.objectives[objective_id]
                objective.verify = false
                M_safehouse:on_achievement_progressed(objective.progress_id, objective.max_progress)
            end
        end
    end

    unlock_safehouse_trophies()

end

complete_all_achievements = complete_all_achievements or function(info)
    local M_achievement = managers.achievment

    local function complete_achievements()
        local _award = M_achievement.award
        for id in pairs(M_achievement.achievments) do
            _award(M_achievement, id)
        end
    end

    complete_achievements()

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                   Unlock All Options                                                                              --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
unlock_all_inventory_slots = unlock_all_inventory_slots or function(info)
    local G_blackmarket = Global.blackmarket_manager
    local unlocked_mask_slots = G_blackmarket.unlocked_mask_slots
    local unlocked_weapon_slots = G_blackmarket.unlocked_weapon_slots
    local unlocked_primaries = unlocked_weapon_slots.primaries
    local unlocked_secondaries = unlocked_weapon_slots.secondaries

    for i = 1, 500 do
        unlocked_mask_slots[i] = true
        unlocked_primaries[i] = true
        unlocked_secondaries[i] = true
    end

end

unlock_all_items = unlock_all_items or function(info)
    local pairs = pairs
    local unlock_items_category, unlock_all_items, unlock_weapons, get_global_value

    unlock_items = function(item_type)
        if item_type == "all" then
            unlock_all_items()
        elseif item_type == "weapons" then
            unlock_weapons()
        else
            unlock_items_category(item_type)
        end
    end

    unlock_all_items = function()
        local types = {"weapon_mods", "masks", "materials", "textures", "colors"}
        for _, item_type in pairs(types) do
            unlock_items_category(item_type)
        end
        unlock_weapons()
    end

    unlock_weapons = function()
        local weapons = Global.blackmarket_manager.weapons
        for weapon_id in pairs(weapons) do
            managers.upgrades:aquire(weapon_id)
            weapons[weapon_id].unlocked = true
        end
    end

    unlock_items_category = function(item_type)
        for id, data in pairs(tweak_data.blackmarket[item_type]) do
            if data.infamy_lock then
                data.infamy_lock = false
            end
            local global_value = get_global_value(data)
            managers.blackmarket:add_to_inventory(global_value, item_type, id)
        end
    end

    get_global_value = function(data)
        if data.global_value then
            return data.global_value
        elseif data.infamous then
            return "infamous"
        elseif data.dlcs or data.dlc then
            local dlcs = data.dlcs or {}
            if data.dlc then
                table.insert(dlcs, data.dlc)
            end
            return dlcs[math.random(#dlcs)]
        else
            return "normal"
        end
    end

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                      Open Menu                                                                                    --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function openmenu(menu)
    menu:show()
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                      Call Menus                                                                                   --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
call_set_infamy = call_set_infamy or function()
    openmenu(call_set_infamy_options)
end

call_set_reputation = call_set_reputation or function()
    openmenu(call_set_reputation_options)
end

call_add_money = call_add_money or function()
    openmenu(call_add_money_options)
end

call_set_skill_points = call_set_skill_points or function()
    openmenu(call_set_skill_points_options)
end

call_set_continental_coins = call_set_continental_coins or function()
    openmenu(call_set_continental_coins_options)
end

call_set_crime_spree = call_set_crime_spree or function()
    openmenu(call_set_crime_spree_options)
end

call_give_perk_decks = call_give_perk_decks or function()
    openmenu(call_give_all_perk_decks_options)
end

call_instant_interactions = call_instant_interactions or function()
    openmenu(call_instant_interaction_options)
end

call_player_interact_with = call_player_interact_with or function()
    openmenu(call_player_interact_with_options)
end

call_alarm = call_alarm or function()
    openmenu(call_alarm_options)
end

call_player_interaction = call_player_interaction or function()
    openmenu(call_player_interaction_options)
end

call_player_movement = call_player_movement or function()
    openmenu(call_player_movement_options)
end

call_player_weapon = call_player_weapon or function()
    openmenu(call_player_weapon_options)
end

call_player_equipment = call_player_equipment or function()
    openmenu(call_player_equipment_options)
end

call_player = call_player or function()
    openmenu(call_player_options)
end

call_heist = call_heist or function()
    openmenu(call_heist_options)
end

call_player_progress = call_player_progress or function()
    openmenu(call_player_progress_options)
end

call_unlock_all = call_unlock_all or function()
    openmenu(call_unlock_all_options)
end

call_safehouse = call_safehouse or function()
    openmenu(call_safehouse_options)
end

call_preplanning = call_preplanning or function()
    openmenu(call_preplanning_options)
end

call_player_skill = call_player_skill or function()
    openmenu(call_player_skill_options)
end

back_to_player_progress_options = back_to_player_progress_options or function()
    openmenu(call_player_progress_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                   Secondary Menus                                                                                 --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set_infamy_options = set_infamy_options or 
	{
		{},
		{ text = "Set 25 Infamy", callback = set_infamy_1 },
		{ text = "Set 50 Infamy", callback = set_infamy_2 },
		{ text = "Set 75 Infamy", callback = set_infamy_3 },
		{ text = "Set 100 Infamy", callback = set_infamy_4 },
		{ text = "Set 150 Infamy", callback = set_infamy_5 },
		{ text = "Set 200 Infamy", callback = set_infamy_6 },
		{ text = "Set 300 Infamy", callback = set_infamy_7 },
		{ text = "Set 400 Infamy", callback = set_infamy_8 },
		{ text = "Set 500 Infamy", callback = set_infamy_9 },
		{ text = "Reset Infamy", callback = reset_infamy },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_infamy_options = call_set_infamy_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Infamy Rank Options", set_infamy_options)

set_reputation_options = set_reputation_options or 
	{
		{},
		{ text = "Set 20 Reputation", callback = set_reputation_1 },
		{ text = "Set 30 Reputation", callback = set_reputation_2 },
		{ text = "Set 40 Reputation", callback = set_reputation_3 },
		{ text = "Set 50 Reputation", callback = set_reputation_4 },
		{ text = "Set 60 Reputation", callback = set_reputation_5 },
		{ text = "Set 70 Reputation", callback = set_reputation_6 },
		{ text = "Set 80 Reputation", callback = set_reputation_7 },
		{ text = "Set 90 Reputation", callback = set_reputation_8 },
		{ text = "Set 100 Reputation", callback = set_reputation_9 },
		{ text = "Reset Reputation", callback = reset_reputation },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_reputation_options = call_set_reputation_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Reputation Options", set_reputation_options)

add_money_options = add_money_options or 
	{
		{},
		{ text = "Add 1 Milion $ Money", callback = add_money_1 },
		{ text = "Add 10 Milion $ Money", callback = add_money_2 },
		{ text = "Add 100 Milion $ Money", callback = add_money_3 },
		{ text = "Add 1 Bilion $ Money", callback = add_money_4 },
		{ text = "Add 10 Bilion $ Money", callback = add_money_5 },
		{ text = "Add 100 Bilion $ Money", callback = add_money_6 },
		{ text = "Add 1 Trilion $ Money", callback = add_money_7 },
		{ text = "Add 10 Trilion $ Money", callback = add_money_8 },
		{ text = "Add 100 Trilion $ Money", callback = add_money_9 },
		{ text = "Reset Money", callback = reset_money },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_add_money_options = call_add_money_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Add Money Options", add_money_options)

set_skill_points_options = set_skill_points_options or 
	{
		{},
		{ text = "Set 120 Skill Points", callback = set_skill_points },
		{ text = "Reset Skills", callback = reset_skill_points },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_skill_points_options = call_set_skill_points_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Skills Options", set_skill_points_options)

set_continental_coins_options = set_continental_coins_options or 
	{
		{},
		{ text = "Add 1 Milion Continental Coins", callback = set_continental_coins_1 },
		{ text = "Add 10 Milion Continental Coins", callback = set_continental_coins_2 },
		{ text = "Add 100 Milion Continental Coins", callback = set_continental_coins_3 },
		{ text = "Add 1 Bilion Continental Coins", callback = set_continental_coins_4 },
		{ text = "Add 10 Bilion Continental Coins", callback = set_continental_coins_5 },
		{ text = "Add 100 Bilion Continental Coins", callback = set_continental_coins_6 },
		{ text = "Add 1 Trilion Continental Coins", callback = set_continental_coins_7 },
		{ text = "Add 10 Trilion Continental Coins", callback = set_continental_coins_8 },
		{ text = "Add 100 Trilion Continental Coins", callback = set_continental_coins_9 },
		{ text = "Reset Continental Coins", callback = reset_continental_coins },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_continental_coins_options = call_set_continental_coins_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Continental Coins Options", set_continental_coins_options)

set_crime_spree_options = set_crime_spree_options or 
	{
		{},
		{ text = "Add 1 Thousand Crime Spree Level", callback = set_crime_spree_1 },
		{ text = "Add 10 Thousand Crime Spree Level", callback = set_crime_spree_2 },
		{ text = "Add 100 Thousand Crime Spree Level", callback = set_crime_spree_3 },
		{ text = "Add 400 Thousand Crime Spree Level", callback = set_crime_spree_4 },
		{ text = "Add 600 Thousand Crime Spree Level", callback = set_crime_spree_5 },
		{ text = "Add 800 Thousand Crime Spree Level", callback = set_crime_spree_6 },
		{ text = "Add 1 Milion Crime Spree Level", callback = set_crime_spree_7 },
		{ text = "Add 10 Milion Crime Spree Level", callback = set_crime_spree_8 },
		{ text = "Add 100 Milion Crime Spree Level", callback = set_crime_spree_9 },
		{ text = "Reset Crime Spree Level", callback = reset_crime_spree },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_set_crime_spree_options = call_set_crime_spree_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Set Crime Spree Options", set_crime_spree_options)

give_perk_decks_options = give_perk_decks_options or 
	{
		{},
		{ text = "Give All Perk Decks", callback = give_all_perk_decks },
		{ text = "Reset All Perk Decks", callback = reset_all_perk_decks },
		{},
		{ text = "Back", callback = back_to_player_progress_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_give_all_perk_decks_options = call_give_all_perk_decks_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Give All Perk Decks Options", give_perk_decks_options)

player_interact_with_options = player_interact_with_options or 
	{
		{},
		{ text = "Grab All Small Loot [Host/Client]", callback = grab_all_small_loot },
		{ text = "Grab All Big Loot [Host/Client]", callback = grab_all_big_loot },
		{ text = "Quickly Rob Stuff [Host/Client]", callback = quickly_rob_stuff },
		{ text = "Upgrade/Fix All Drills [Host/Client]", callback = upgrade_fix_drills },
		{ text = "Open All Doors [Host/Client]", callback = open_all_doors },
		{ text = "Barricade Stuff [Host/Client]", callback = barricade_stuff },
		{ text = "Open All ATMs [Host/Client]", callback = open_all_atms },
		{ text = "Open All Vaults [Host/Client]", callback = open_all_vaults },
		{ text = "Grab All Gage Assignments [Host/Client]", callback = grab_all_gage_assignments },
		{ text = "Grab Everything [Host/Client]", callback = grab_everything },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_interact_with_options = call_player_interact_with_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Interact With Options", player_interact_with_options)

alarm_options = alarm_options or 
	{
		{},
		{ text = "Toggle Allow Infinite Pagers [Host]", callback = toggle_infinite_pagers },
		{ text = "Toggle Makes Guards & People In General Stop Calling The Police [Host]", callback = toggle_stop_calling_police },
		{ text = "Toggle Stops Civilians From Reporting You To The Police [Host]", callback = toggle_stop_reporting },
		{ text = "Toggle Make Cameras Not Trigger The Alarm [Host]", callback = toggle_disable_camera_alarm },
		{ text = "Toggle Gets Rid Of The Sound Of The Camera Seeing You [Host/Client]", callback = toggle_remove_camera_sound },
		{ text = "Toggle Stops Police From Saying They Are Calling The Police All The Time [Host]", callback = toggle_stop_saying_calling_police },
		{ text = "Toggle Prevents Panic Buttons & Intel Burning [Host]", callback = toggle_prevents },
		{ text = "Toggle Disable Cameras [Host]", callback = toggle_disable_cameras },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_alarm_options = call_alarm_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Alarm Options", alarm_options)

player_interaction_options = player_interaction_options or 
	{
		{},
		{ text = "Toggle Increased Interact Distance [Host/Client]", callback = toggle_increased_interact_distance },
		{ text = "Toggle Faster Ziplines [Host/Client]", callback = toggle_faster_ziplines },
		{ text = "Toggle Faster Drills [Host/Client]", callback = toggle_faster_drills },
		{ text = "Interact With Anything [Host/Client]", callback = player_interact_with_anything },
		{ text = "Interact While In Casing Mode [Host/Client]", callback = interact_while_in_casing },
		{ text = "Remove Cooldown Between Picking Up Bags [Host/Client]", callback = remove_cooldown },
		{ text = "Interact Through Walls [Host/Client]", callback = interact_through_walls },
		{ text = "Interact Dont Interupt On Distance [Host/Client]", callback = interact_dont_interupt_on_distance },
		{ text = "Toggle Instant Interactions [Host/Client]", callback = toggle_instant_interactions },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_interaction_options = call_player_interaction_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Interaction Options", player_interaction_options)

player_movement_options = player_movement_options or 
	{
		{},
		{ text = "Toggle Jump Higher [Host/Client]", callback = toggle_jump_higher },
		{ text = "Toggle Remove Speed Penalty While Carrying Bags [Host/Client]", callback = toggle_remove_carry_penalty },
		{ text = "Infinite Stamina [Host/Client]", callback = infinite_stamina },
		{ text = "Toggle Run Faster [Host/Client]", callback = toggle_run_faster },
		{ text = "Toggle Walk Faster [Host/Client]", callback = toggle_walk_faster },
		{ text = "Toggle Climb Faster [Host/Client]", callback = toggle_climb_faster },
		{ text = "Remove Body Armor Speed Penalty [Host/Client]", callback = remove_speed_penalty },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_movement_options = call_player_movement_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Movement Options", player_movement_options)

player_weapon_options = player_weapon_options or 
	{
		{},
		{ text = "Toggle Remove Weapon Recoil [Host/Client]", callback =  toggle_remove_weapon_recoil },
		{ text = "Toggle Instant Weapon Reload Speed [Host/Client]", callback = toggle_increased_weapon_reload_speed },
		{ text = "Toggle Extreme Weapon Fire Rate [Host/Client]", callback = toggle_increased_weapon_fire_rate },
		{ text = "Toggle Instant Weapon Swap Speed [Host/Client]", callback = toggle_increased_weapon_swap_speed },
		{ text = "Remove Bullets Spread [Host/Client]", callback = remove_spread },
		{ text = "One Shot Kill [Host/Client]", callback = one_shot_kill },
		{ text = "Melee Tweaks [Host/Client]", callback = melee_tweaks },
		{ text = "Infinite Ammo Without Reload [Host/Client]", callback = infinite_ammo },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_weapon_options = call_player_weapon_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Weapon Options", player_weapon_options)

player_equipment_options = player_equipment_options or 
	{
		{},
		{ text = "Toggle Infinite Equipment [Host/Client]", callback = toggle_infinite_equipment },
		{ text = "Toggle Instant Deploy [Host/Client]", callback = toggle_instant_deploy },
		{ text = "Toggle Infinite Cable Ties [Host/Client]", callback = toggle_infinite_cable_ties },
		{ text = "Toggle Infinite Bodybags [Host/Client]", callback = toggle_infinite_bodybags },
		{ text = "Instant Mask On [Host/Client]", callback = instant_mask },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_equipment_options = call_player_equipment_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Equipment Options", player_equipment_options)

player_options = player_options or 
	{
		{},
		{ text = "Toggle God Mode [Host/Client]", callback = toggle_god_mode },
		{ text = "Toggle Invisible [Host/Client]", callback = toggle_invisible },
		{ text = "Remove Hit Disorientation [Host/Client]", callback = remove_hit_disorientation },
		{ text = "Remove Camera Recoil [Host/Client]", callback = remove_recoil },
		{ text = "Remove Camera Limits [Host/Client]", callback = remove_camera_limits },
		{ text = "Remove Headbob [Host/Client]", callback = remove_headbob },
		{ text = "Remove Explosion Shake [Host/Client]", callback = remove_explosion_shake },
		{ text = "Remove Flashbang Effects [Host/Client]", callback = remove_flashbang },
		{ text = "Remove Weapon Sway [Host/Client]", callback = remove_weapon_sway },
		{ text = "Remove Camera Rotation When Holding A Bag [Host/Client]", callback = remove_camera_rotation },
		{ text = "Remove Detection Risk While In Casing Mode [Host/Client]", callback = remove_detection_in_casing },
		{ text = "Counter Cloakers [Host/Client]", callback = counter_cloakers },
		{ text = "Replenish [Host/Client]", callback = replenish },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_options = call_player_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Options", player_options)

heist_options = heist_options or 
	{
		{},
		{ text = "Remove Cash Penalty For Killing Civillians [Host/Client]", callback = remove_cash_penalty },
		{ text = "Remove All Static Alarm Lasers [Host/Client]", callback = remove_alarm_laser },
		{ text = "Remove Pagers [Host]", callback = remove_pagers },
		{ text = "Kill All Enemies On The Map [Host/Client]", callback = kill_all_enemies },
		{ text = "Tie All Civilians On The Map [Host/Client]", callback = tie_all_civilians },
		{ text = "Convert All Enemies On The Map [Host/Client]", callback = convert_all_enemies },
		{ text = "Auto Pickup [Host/Client]", callback = auto_pickup },
		{ text = "Carry Stacker [Host]", callback = carry_stacker },
		{ text = "Force Win [Host]", callback = force_win },
		{ text = "Remove Invisible Walls [Host/Client]", callback = remove_invisible_walls },
		{ text = "Remote Camera Access [Host/Client]", callback = remote_camera },
		{ text = "Toggle Xray [Host/Client]", callback = toggle_xray },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_heist_options = call_heist_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Heist Options", heist_options)

preplanning_options = preplanning_options or 
	{
		{},
		{ text = "Infinite Favors [Host/Client]", callback = infinite_favors },
		{ text = "Infinite Drawing Points [Host/Client]", callback = infinite_drawing_points },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_preplanning_options = call_preplanning_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Preplanning Options", preplanning_options)

player_skill_options = player_skill_options or 
	{
		{},
		{ text = "Toggle Six Sense Tweaks [Host/Client]", callback = toggle_six_sense_tweaks },
		{ text = "Toggle Kick Starter Always Works [Host/Client]", callback = toggle_kick_starter },
		{ text = "Toggle Infinite Pocket ECM [Host/Client]", callback = toggle_infinite_pecm },
		{ text = "Toggle No Inspire Cooldown [Host/Client]", callback = toggle_no_inspire_cooldown },
		{ text = "Toggle 100% Dodge Chance [Host/Client]", callback = toggle_max_dodge },
		{ text = "Toggle 100% Armor Piercing Chance [Host/Client]", callback = toggle_max_armor_piercing },
		{ text = "Toggle 100% Crit Cance [Host/Client]", callback = toggle_max_crit },
		{ text = "Toggle Infinite Jokers [Host/Client]", callback = toggle_infinite_jokers },
		{ text = "Toggle Infinite Following Hostages [Host/Client]", callback = toggle_infinite_following_hostages },
		{ text = "Toggle Infinite ECM [Host/Client]", callback = toggle_infinite_ecm },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_skill_options = call_player_skill_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Preplanning Options", player_skill_options)

player_progress_options = player_progress_options or 
	{
		{},
		{ text = "Set Infamy Menu", callback = call_set_infamy },
		{ text = "Set Reputation Menu", callback = call_set_reputation },
		{ text = "Add Money Menu", callback = call_add_money },
		{ text = "Set Skill Points Menu", callback = call_set_skill_points },
		{ text = "Set Crime Spree Menu", callback = call_set_crime_spree },
		{ text = "Give All Perk Decks Menu", callback = call_give_perk_decks },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_progress_options = call_player_progress_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Player Progress Options", player_progress_options)

unlock_all_options = unlock_all_options or 
	{
		{},
		{ text = "Unlock All Inventory Slots", callback = unlock_all_inventory_slots },
		{ text = "Unlock All Items", callback = unlock_all_items },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_unlock_all_options = call_unlock_all_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Unlock All Options", unlock_all_options)

safehouse_options = safehouse_options or 
	{
		{},
		{ text = "Max Safehouse Rooms", callback = max_safehouse_rooms },
		{ text = "Set Continental Coins Menu", callback = call_set_continental_coins },
		{ text = "Disable Safe House Raid", callback = disable_safehouse_raid },
		{ text = "Complete All Trophies", callback = complete_all_trophies },
		{ text = "Complete All Achievements", callback = complete_all_achievements },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_safehouse_options = call_safehouse_options or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Safehouse Options", safehouse_options)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                  Check Game State                                                                                 --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inGame()

    if not game_state_machine then
        return false
    end

    return string.find(game_state_machine:current_state_name(), "game")

end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                            In Game & Pre Game Main Menus                                                                          --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if inGame() then
    in_game = in_game or 
	{
		{},
		{ text = "Player Interact With Options", callback = call_player_interact_with }, 
		{ text = "Alarm Options", callback = call_alarm }, 
		{ text = "Player Interaction Options", callback = call_player_interaction }, 
		{ text = "Player Movement Options", callback = call_player_movement }, 
		{ text = "Player Weapon Options", callback = call_player_weapon }, { text = "Player Equipment Options", callback = call_player_equipment }, 
		{ text = "Player Options", callback = call_player }, 
		{ text = "Heist Options", callback = call_heist }, { text = "Preplanning Options", callback = call_preplanning }, 
		{ text = "Player Skill Options", callback = call_player_skill }, 
		{},

		{ text = "Cancel", is_cancel_button = true, is_focused_button = true }
	}
    if not mymenu then
        mymenu = mymenu or SimpleMenu:new("Payday 2 Trainer By Lucifer", "In Game Main Options", in_game)
    end

    mymenu:show()
else
    pre_game = pre_game or 
	{
		{},
		{ text = "Player Progress Options", callback = call_player_progress }, 
		{ text = "Complete All Side Jobs", callback = complete_all_side_jobs }, 
		{ text = "SafeHouse Options", callback = call_safehouse }, { text = "Unlock All Options", callback = call_unlock_all }, 
		{},

		{ text = "Cancel", is_cancel_button = true, is_focused_button = true }
	}
    if not mymenu then
        mymenu = mymenu or SimpleMenu:new("Payday 2 Trainer By Lucifer", "Pre Game Main Options", pre_game)
    end

    mymenu:show()
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                       END                                                                                         --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------