local p2t_require = p2t_require
local p2t_config = p2t_require('Trainer/setup/config')
local _G = _G

_G.p2t_config = p2t_config

--[[
   -- Alarm
   p2t.config.disable_camera_alarm,          -- Disable Camera From Triggering The Alarm
   p2t.config.disable_cameras,               -- Disable Cameras
   p2t.config.infinite_pagers,               -- Infinite Pagers
   p2t.config.prevents,                      -- Prevent Panic Buttons & Intel Burning
   p2t.config.no_camera_sound,               -- Removes Bipping Sound Of Camera
   p2t.config.stop_calling_police,           -- Makes Gaurds And People In General Stop Calling The Police
   p2t.config.stop_reporting,                -- Stops Civilians From Reporting You To The Police
   p2t.config.stop_saying_calling_police,    -- Stops The Police From Saying They Are Calling The Police All The Time

   -- Heist
   p2t.config.auto_pickup,                   -- Auto Pickup Small Loot
   p2t.config.carry_stacker,                 -- Carry Any Amount Of Bags
   p2t.config.no_alarm_laser,                -- Removes Non-Static Alarm Lasers
   p2t.config.no_pagers,                     -- Bodies Doesn't Have Pagers
   p2t.config.xray,                          -- Highlight Enemies And Cameras

   -- Player
   p2t.config.auto_counter_cloakers,         -- Auto Counter Cloaker's Kick
   p2t.config.god_mode,                      -- Invulnerability
   p2t.config.invisibility,                  -- Invisibility
   p2t.config.no_camera_limit,               -- 360 view while interacting
   p2t.config.no_camera_rotation,            -- Removes Camera Rotation When Holding A Bag
   p2t.config.no_camera_shake,               -- Removes Camera Shake
   p2t.config.no_detection_in_casing,        -- Removes Detection Risk While In Casing Mode
   p2t.config.no_explosion_shake,            -- Removes Explosion Shake
   p2t.config.no_flashbang,                  -- Removes Flashbang And Tinnitus
   p2t.config.no_headbob,                    -- Removes Headbob
   p2t.config.no_hit_disorientation,         -- Removes Hit Disorientation
   p2t.config.no_sway,                       -- Removes Weapon Sway

   -- Player Equipment
   p2t.config.infinite_bodybags,             -- Infinite Bodybags
   p2t.config.infinite_cable_ties,           -- Infinite Cable Ties
   p2t.config.infinite_equipment,            -- Infinite Equipment
   p2t.config.instant_deploy,                -- Instant Equipment Deployment
   p2t.config.instant_mask_on,               -- Instant Mask On

   -- Player Interaction
   p2t.config.drill_speed_boost,             -- Drill Speed Boost
   p2t.config.instant_interactions,          -- Instant Interactions
   p2t.config.interact_in_casing,            -- Interact While In Casing Mode
   p2t.config.interact_through_walls,        -- Interact Through Walls
   p2t.config.interact_with_anything,        -- Able To Interact With Anything
   p2t.config.interaction_distance_boost,    -- Interact from far away
   p2t.config.interupt_on_distance,          -- Interaction Doesn't Interupt On Distance
   p2t.config.no_pickup_cooldown,            -- Removes Cooldown Between Picking Up Bags
   p2t.config.zipline_speed_boost,           -- Zipline Speed Boost

   -- Player Movement
   p2t.config.infinite_stamina,              -- Infinite Stamina
   p2t.config.jump_boost,                    -- Jump Boost
   p2t.config.no_armor_speed_penalty,        -- Removes Speed Penalty On All Body Armors
   p2t.config.no_carry_speed_penalty,        -- Remove Carry Speed Penalty On All Loot Bags
   p2t.config.speed_climb_boost,             -- Speed Climb Boost
   p2t.config.speed_run_boost,               -- Speed Run Boost
   p2t.config.speed_walk_boost,              -- Speed Walk Boost

   -- Player Skills
   p2t.config.infinite_ecm,                  -- Infinite Ecm Duration
   p2t.config.infinite_following_hostages,   -- Infinite Amount Of Following Hostages
   p2t.config.infinite_jokers,               -- Infinite Amount Of Jokers
   p2t.config.infinite_pecm,                 -- Infinite Pecm Duration
   p2t.config.kick_starter,                  -- 100% Chance To Kick Start A Drill
   p2t.config.max_armor_pierching_chance,    -- 100% Chance To Armor Pierce Enemies
   p2t.config.max_crit_chance,               -- 100% Chance To Critical Strike Enemies
   p2t.config.max_dodge_chance,              -- 100% Chance To Dodge Enemy Bullets
   p2t.config.no_inspire_chance,             -- Insipre Skill Has No Cooldown
   p2t.config.reduce_six_sense,              -- Reduce Six Sense AFK Duration

   -- Player Weapon
   p2t.config.increased_fire_rate,           -- Increase Fire Rate Of All Guns
   p2t.config.increased_reload_speed,        -- Increase Reload Speed Of All Guns
   p2t.config.increased_swap_speed,          -- Increase Swap Speed Of All Guns
   p2t.config.infinite_ammo,                 -- Infinite Ammo For All Guns
   p2t.config.one_shot_kill,                 -- One Shot Kill For All Guns
   p2t.config.no_spread,                     -- Remove Bullet Spread Of All Guns
   p2t.config.no_recoil,                     -- Remove Recoil Of All Guns

   -- Pre Planning
   p2t.config.infinite_drawing_points,       -- Infinite Drawing Points
   p2t.config.infinite_favors,               -- Infinite Favors
--]]

-- Alarm
if p2t_config.disable_camera_alarm then
    p2t_require("Trainer/addons/alarm/disable_camera_alarm")
end

if p2t_config.disable_cameras then
    p2t_require("Trainer/addons/alarm/disable_cameras")
end

if p2t_config.infinite_pagers then
    p2t_require("Trainer/addons/alarm/infinite_pagers")
end

if p2t_config.no_camera_sound then
    p2t_require("Trainer/addons/alarm/no_camera_sound")
end

if p2t_config.prevents then
    p2t_require("Trainer/addons/alarm/prevents")
end

if p2t_config.stop_calling_police then
    p2t_require("Trainer/addons/alarm/stop_calling_police")
end

if p2t_config.stop_reporting then
    p2t_require("Trainer/addons/alarm/stop_reporting")
end

if p2t_config.stop_saying_calling_police then
    p2t_require("Trainer/addons/alarm/stop_saying_calling_police")
end

-- Heist
if p2t_config.auto_pickup then
    p2t_require("Trainer/addons/heist/auto_pickup")
end

if p2t_config.no_alarm_laser then
    p2t_require("Trainer/addons/heist/no_alarm_laser")
end

if p2t_config.no_cash_penalty then
    p2t_require("Trainer/addons/heist/no_cash_penalty")
end

if p2t_config.no_pagers then
    p2t_require("Trainer/addons/heist/no_pagers")
end

if p2t_config.xray then
    p2t_require("Trainer/addons/heist/xray")
end

-- Player
if p2t_config.auto_counter_cloakers then
    p2t_require("Trainer/addons/player/auto_counter_cloakers")
end

if p2t_config.god_mode then
    p2t_require("Trainer/addons/player/god_mode")
end

if p2t_config.invisibility then
    p2t_require("Trainer/addons/player/invisibility")
end

if p2t_config.no_camera_limit then
    p2t_require("Trainer/addons/player/no_camera_limit")
end

if p2t_config.no_camera_rotation then
    p2t_require("Trainer/addons/player/no_camera_rotation")
end

if p2t_config.no_camera_shake then
    p2t_require("Trainer/addons/player/no_camera_shake")
end

if p2t_config.no_detection_in_casing then
    p2t_require("Trainer/addons/player/no_detection_in_casing")
end

if p2t_config.no_explision_shake then
    p2t_require("Trainer/addons/player/no_explision_shake")
end

if p2t_config.no_flashbang then
    p2t_require("Trainer/addons/player/no_flashbang")
end

if p2t_config.no_gun_sway then
    p2t_require("Trainer/addons/player/no_gun_sway")
end

if p2t_config.no_headbob then
    p2t_require("Trainer/addons/player/no_headbob")
end

if p2t_config.no_hit_disorientation then
    p2t_require("Trainer/addons/player/no_hit_disorientation")
end

-- Player Equipment
if p2t_config.infinite_bodybags then
    p2t_require("Trainer/addons/player-equipment/infinite_bodybags")
end

if p2t_config.infinite_cable_ties then
    p2t_require("Trainer/addons/player-equipment/infinite_cable_ties")
end

if p2t_config.infinite_equipment then
    p2t_require("Trainer/addons/player-equipment/infinite_equipment")
end

if p2t_config.instant_deploy then
    p2t_require("Trainer/addons/player-equipment/instant_deploy")
end

if p2t_config.instant_mask_on then
    p2t_require("Trainer/addons/player-equipment/instant_mask_on")
end

-- Player Interaction
if p2t_config.drill_speed_boost then
    p2t_require("Trainer/addons/player-interaction/drill_speed_boost")
end

if p2t_config.instant_interactions then
    p2t_require("Trainer/addons/player-interaction/instant_interactions")
end

if p2t_config.interact_in_casing then
    p2t_require("Trainer/addons/player-interaction/interact_in_casing")
end

if p2t_config.interact_through_walls then
    p2t_require("Trainer/addons/player-interaction/interact_through_walls")
end

if p2t_config.interact_with_anything then
    p2t_require("Trainer/addons/player-interaction/interact_with_anything")
end

if p2t_config.interaction_distance_boost then
    p2t_require("Trainer/addons/player-interaction/interaction_distance_boost")
end

if p2t_config.no_interruption_on_distance then
    p2t_require("Trainer/addons/player-interaction/no_interruption_on_distance")
end

if p2t_config.no_pickup_cooldown then
    p2t_require("Trainer/addons/player-interaction/no_pickup_cooldown")
end

if p2t_config.zipline_speed_boost then
    p2t_require("Trainer/addons/player-interaction/zipline_speed_boost")
end

-- Player Movement
if p2t_config.infinite_stamina then
    p2t_require("Trainer/addons/player-movement/infinite_stamina")
end

if p2t_config.jump_boost then
    p2t_require("Trainer/addons/player-movement/jump_boost")
end

if p2t_config.climb_boost then
    p2t_require("Trainer/addons/player-movement/climb_boost")
end

if p2t_config.run_boost then
    p2t_require("Trainer/addons/player-movement/run_boost")
end

if p2t_config.walk_boost then
    p2t_require("Trainer/addons/player-movement/walk_boost")
end

if p2t_config.no_armor_speed_penalty then
    p2t_require("Trainer/addons/player-movement/no_armor_speed_penalty")
end

if p2t_config.no_carry_speed_penalty then
    p2t_require("Trainer/addons/player-movement/no_carry_speed_penalty")
end

-- Player Skills
if p2t_config.always_kick_start then
    p2t_require("Trainer/addons/player-skills/always_kick_start")
end

if p2t_config.infinite_ecm then
    p2t_require("Trainer/addons/player-skills/infinite_ecm")
end

if p2t_config.infinite_following_hostages then
    p2t_require("Trainer/addons/player-skills/infinite_following_hostages")
end

if p2t_config.infinite_jokers then
    p2t_require("Trainer/addons/player-skills/infinite_jokers")
end

if p2t_config.infinite_pecm then
    p2t_require("Trainer/addons/player-skills/infinite_pecm")
end

if p2t_config.max_armor_piercing_chance then
    p2t_require("Trainer/addons/player-skills/max_armor_piercing_chance")
end

if p2t_config.max_crit_chance then
    p2t_require("Trainer/addons/player-skills/max_crit_chance")
end

if p2t_config.max_dodge_chance then
    p2t_require("Trainer/addons/player-skills/max_dodge_chance")
end

if p2t_config.no_inspire_cooldown then
    p2t_require("Trainer/addons/player-skills/no_inspire_cooldown")
end

if p2t_config.reduce_six_sense then
    p2t_require("Trainer/addons/player-skills/reduce_six_sense")
end

-- Player Weapon
if p2t_config.increased_fire_rate then
    p2t_require("Trainer/addons/player-weapon/increased_fire_rate")
end

if p2t_config.increased_reload_speed then
    p2t_require("Trainer/addons/player-weapon/increased_reload_speed")
end

if p2t_config.increased_swap_speed then
    p2t_require("Trainer/addons/player-weapon/increased_swap_speed")
end

if p2t_config.infinite_ammo then
    p2t_require("Trainer/addons/player-weapon/infinite_ammo")
end

if p2t_config.no_recoil then
    p2t_require("Trainer/addons/player-weapon/no_recoil")
end

if p2t_config.no_spread then
    p2t_require("Trainer/addons/player-weapon/no_spread")
end

if p2t_config.one_shot_kill then
    p2t_require("Trainer/addons/player-weapon/one_shot_kill")
end

-- Pre Planning
if p2t_config.infinite_drawing_points then
    p2t_require("Trainer/addons/pre-planning/infinite_drawing_points")
end

if p2t_config.infinite_favors then
    p2t_require("Trainer/addons/pre-planning/infinite_favors")
end