toggle_no_verify_content = toggle_no_verify_content or function(info)
    if not p2t_config.no_verify_content then
        update_config("no_verify_content", true)
        
        managers.mission._fading_debug_output:script().log("No Verify Content - Activated", Color.green)
    else
        update_config("no_verify_content", false)

        managers.mission._fading_debug_output:script().log("No Verify Content - Deactivated", Color.red)
    end
end

toggle_no_chat_spam = toggle_no_chat_spam or function(info)
    if not p2t_config.no_chat_spam then
        update_config("no_chat_spam", true)
        
        managers.mission._fading_debug_output:script().log("No Chat Spam - Activated", Color.green)
    else
        update_config("no_chat_spam", false)

        managers.mission._fading_debug_output:script().log("No Chat Spam - Deactivated", Color.red)
    end
end

toggle_dont_publish_statistics = toggle_dont_publish_statistics or function(info)
    if not p2t_config.dont_publish_statistics then
        update_config("dont_publish_statistics", true)
        
        managers.mission._fading_debug_output:script().log("Dont Publish Statistics - Activated", Color.green)
    else
        update_config("dont_publish_statistics", false)

        managers.mission._fading_debug_output:script().log("Dont Publish Statistics - Deactivated", Color.red)
    end
end

toggle_spoof_actions = toggle_spoof_actions or function(info)
    if not p2t_config.spoof_actions then
        update_config("spoof_actions", true)
        
        managers.mission._fading_debug_output:script().log("Spoof Actions - Activated", Color.green)
    else
        update_config("spoof_actions", false)

        managers.mission._fading_debug_output:script().log("Spoof Actions - Deactivated", Color.red)
    end
end

toggle_spoof_inventory = toggle_spoof_inventory or function(info)
    if not p2t_config.spoof_inventory then
        update_config("spoof_inventory", true)
        
        managers.mission._fading_debug_output:script().log("Spoof Inventory - Activated", Color.green)
    else
        update_config("spoof_inventory", false)

        managers.mission._fading_debug_output:script().log("Spoof Inventory - Deactivated", Color.red)
    end
end

toggle_spoof_pd2_community = toggle_spoof_pd2_community or function(info)
    if not p2t_config.spoof_pd2_community then
        update_config("spoof_pd2_community", true)
        
        managers.mission._fading_debug_output:script().log("Spoof P2D Community - Activated", Color.green)
    else
        update_config("spoof_pd2_community", false)

        managers.mission._fading_debug_output:script().log("Spoof P2D Community - Deactivated", Color.red)
    end
end

toggle_hide_modlist = toggle_hide_modlist or function(info)
    if not p2t_config.hide_modlist then
        update_config("hide_modlist", true)
        
        managers.mission._fading_debug_output:script().log("Hide Modlist - Activated", Color.green)
    else
        update_config("hide_modlist", false)

        managers.mission._fading_debug_output:script().log("Hide Modlist - Deactivated", Color.red)
    end
end

toggle_hide_trainer = toggle_hide_trainer or function(info)
    if not p2t_config.hide_trainer then
        update_config("hide_trainer", true)
        
        managers.mission._fading_debug_output:script().log("Hide Trainer - Activated", Color.green)
    else
        update_config("hide_trainer", false)

        managers.mission._fading_debug_output:script().log("Hide Trainer - Deactivated", Color.red)
    end
end

toggle_anti_anti_hidden_modlist = toggle_anti_anti_hidden_modlist or function(info)
    if not p2t_config.anti_anti_hidden_modlist then
        update_config("anti_anti_hidden_modlist", true)
        
        managers.mission._fading_debug_output:script().log("Anti Anti Hidden Modlist - Activated", Color.green)
    else
        update_config("anti_anti_hidden_modlist", false)

        managers.mission._fading_debug_output:script().log("Anti Anti Hidden Modlist - Deactivated", Color.red)
    end
end

toggle_disable_camera_alarm = toggle_disable_camera_alarm or function(info)
    if not p2t_config.disable_camera_alarm then
        update_config("disable_camera_alarm", true)
        
        managers.mission._fading_debug_output:script().log("Disable Camera Alarm - Activated", Color.green)
    else
        update_config("disable_camera_alarm", false)

        managers.mission._fading_debug_output:script().log("Disable Camera Alarm - Deactivated", Color.red)
    end
end

toggle_disable_cameras = toggle_disable_cameras or function(info)
    if not p2t_config.disable_cameras then
        update_config("disable_cameras", true)
        
        managers.mission._fading_debug_output:script().log("Disable Cameras - Activated", Color.green)
    else
        update_config("disable_cameras", false)

        managers.mission._fading_debug_output:script().log("Disable Cameras - Deactivated", Color.red)
    end
end

toggle_no_camera_sound = toggle_no_camera_sound or function(info)
    if not p2t_config.no_camera_sound then
        update_config("no_camera_sound", true)
        
        managers.mission._fading_debug_output:script().log("No Camera Sound - Activated", Color.green)
    else
        update_config("no_camera_sound", false)

        managers.mission._fading_debug_output:script().log("No Camera Sound - Deactivated", Color.red)
    end
end

toggle_infinite_pagers = toggle_infinite_pagers or function(info)
    if not p2t_config.infinite_pagers then
        update_config("infinite_pagers", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Pagers - Activated", Color.green)
    else
        update_config("infinite_pagers", false)

        managers.mission._fading_debug_output:script().log("Infinite Pagers - Deactivated", Color.red)
    end
end

toggle_prevents = toggle_prevents or function(info)
    if not p2t_config.prevents then
        update_config("prevents", true)
        
        managers.mission._fading_debug_output:script().log("Prevents - Activated", Color.green)
    else
        update_config("prevents", false)

        managers.mission._fading_debug_output:script().log("Prevents - Deactivated", Color.red)
    end
end

toggle_stop_calling_police = toggle_stop_calling_police or function(info)
    if not p2t_config.stop_calling_police then
        update_config("stop_calling_police", true)
        
        managers.mission._fading_debug_output:script().log("Stop Calling Police - Activated", Color.green)
    else
        update_config("stop_calling_police", false)

        managers.mission._fading_debug_output:script().log("Stop Calling Police - Deactivated", Color.red)
    end
end

toggle_stop_reporting = toggle_stop_reporting or function(info)
    if not p2t_config.stop_reporting then
        update_config("stop_reporting", true)
        
        managers.mission._fading_debug_output:script().log("Stop Reporting - Activated", Color.green)
    else
        update_config("stop_reporting", false)

        managers.mission._fading_debug_output:script().log("Stop Reporting - Deactivated", Color.red)
    end
end

toggle_stop_saying_calling_police = toggle_stop_saying_calling_police or function(info)
    if not p2t_config.stop_saying_calling_police then
        update_config("stop_saying_calling_police", true)
        
        managers.mission._fading_debug_output:script().log("Stop Saying Calling Police - Activated", Color.green)
    else
        update_config("stop_saying_calling_police", false)

        managers.mission._fading_debug_output:script().log("Stop Saying Calling Police - Deactivated", Color.red)
    end
end

toggle_auto_pickup = toggle_auto_pickup or function(info)
    if not p2t_config.auto_pickup then
        update_config("auto_pickup", true)
        
        managers.mission._fading_debug_output:script().log("Auto Pickup - Activated", Color.green)
    else
        update_config("auto_pickup", false)

        managers.mission._fading_debug_output:script().log("Auto Pickup - Deactivated", Color.red)
    end
end

toggle_no_alarm_laser = toggle_no_alarm_laser or function(info)
    if not p2t_config.no_alarm_laser then
        update_config("no_alarm_laser", true)
        
        managers.mission._fading_debug_output:script().log("No Alarm Laser - Activated", Color.green)
    else
        update_config("no_alarm_laser", false)

        managers.mission._fading_debug_output:script().log("No Alarm Laser - Deactivated", Color.red)
    end
end

toggle_no_cash_penalty = toggle_no_cash_penalty or function(info)
    if not p2t_config.no_cash_penalty then
        update_config("no_cash_penalty", true)
        
        managers.mission._fading_debug_output:script().log("No Cash Penalty - Activated", Color.green)
    else
        update_config("no_cash_penalty", false)

        managers.mission._fading_debug_output:script().log("No Cash Penalty - Deactivated", Color.red)
    end
end

toggle_no_pagers = toggle_no_pagers or function(info)
    if not p2t_config.no_pagers then
        update_config("no_pagers", true)
        
        managers.mission._fading_debug_output:script().log("No Pagers - Activated", Color.green)
    else
        update_config("no_pagers", false)

        managers.mission._fading_debug_output:script().log("No Pagers - Deactivated", Color.red)
    end
end

toggle_no_pager_on_domination = toggle_no_pager_on_domination or function(info)
    if not p2t_config.no_pager_on_domination then
        update_config("no_pager_on_domination", true)
        
        managers.mission._fading_debug_output:script().log("No Pager On Domination - Activated", Color.green)
    else
        update_config("no_pager_on_domination", false)

        managers.mission._fading_debug_output:script().log("No Pager On Domination - Deactivated", Color.red)
    end
end

toggle_xray = toggle_xray or function(info)
    if not p2t_config.xray then
        update_config("xray", true)
        
        managers.mission._fading_debug_output:script().log("Xray - Activated", Color.green)
    else
        update_config("xray", false)

        managers.mission._fading_debug_output:script().log("Xray - Deactivated", Color.red)
    end
end

toggle_longer_camera_loop = toggle_longer_camera_loop or function(info)
    if not p2t_config.longer_camera_loop then
        update_config("longer_camera_loop", true)
        
        managers.mission._fading_debug_output:script().log("Longer Camera Loop - Activated", Color.green)
    else
        update_config("longer_camera_loop", false)

        managers.mission._fading_debug_output:script().log("Longer Camera Loop - Deactivated", Color.red)
    end
end

toggle_infinite_bodybags = toggle_infinite_bodybags or function(info)
    if not p2t_config.infinite_bodybags then
        update_config("infinite_bodybags", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Bodybags - Activated", Color.green)
    else
        update_config("infinite_bodybags", false)

        managers.mission._fading_debug_output:script().log("Infinite Bodybags - Deactivated", Color.red)
    end
end

toggle_infinite_cable_ties = toggle_infinite_cable_ties or function(info)
    if not p2t_config.infinite_cable_ties then
        update_config("infinite_cable_ties", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Cable Ties - Activated", Color.green)
    else
        update_config("infinite_cable_ties", false)

        managers.mission._fading_debug_output:script().log("Infinite Cable Ties - Deactivated", Color.red)
    end
end

toggle_infinite_equipment = toggle_infinite_equipment or function(info)
    if not p2t_config.infinite_equipment then
        update_config("infinite_equipment", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Equipment - Activated", Color.green)
    else
        update_config("infinite_equipment", false)

        managers.mission._fading_debug_output:script().log("Infinite Equipment - Deactivated", Color.red)
    end
end

toggle_instant_deploy = toggle_instant_deploy or function(info)
    if not p2t_config.instant_deploy then
        update_config("instant_deploy", true)
        
        managers.mission._fading_debug_output:script().log("Instant Deploy - Activated", Color.green)
    else
        update_config("instant_deploy", false)

        managers.mission._fading_debug_output:script().log("Instant Deploy - Deactivated", Color.red)
    end
end

toggle_instant_mask_on = toggle_instant_mask_on or function(info)
    if not p2t_config.instant_mask_on then
        update_config("instant_mask_on", true)
        
        managers.mission._fading_debug_output:script().log("Instant Mask On - Activated", Color.green)
    else
        update_config("instant_mask_on", false)

        managers.mission._fading_debug_output:script().log("Instant Mask On - Deactivated", Color.red)
    end
end

toggle_drill_speed_boost = toggle_drill_speed_boost or function(info)
    if not p2t_config.drill_speed_boost then
        update_config("drill_speed_boost", true)
        
        managers.mission._fading_debug_output:script().log("Drill Speed Boost - Activated", Color.green)
    else
        update_config("drill_speed_boost", false)

        managers.mission._fading_debug_output:script().log("Drill Speed Boost - Deactivated", Color.red)
    end
end

toggle_instant_interactions = toggle_instant_interactions or function(info)
    if not p2t_config.instant_interactions then
        update_config("instant_interactions", true)
        
        managers.mission._fading_debug_output:script().log("Instant Interactions - Activated", Color.green)
    else
        update_config("instant_interactions", false)

        managers.mission._fading_debug_output:script().log("Instant Interactions - Deactivated", Color.red)
    end
end

toggle_interact_in_casing = toggle_interact_in_casing or function(info)
    if not p2t_config.interact_in_casing then
        update_config("interact_in_casing", true)
        
        managers.mission._fading_debug_output:script().log("Interact In Casing - Activated", Color.green)
    else
        update_config("interact_in_casing", false)

        managers.mission._fading_debug_output:script().log("Interact In Casing - Deactivated", Color.red)
    end
end

toggle_interact_through_walls = toggle_interact_through_walls or function(info)
    if not p2t_config.interact_through_walls then
        update_config("interact_through_walls", true)
        
        managers.mission._fading_debug_output:script().log("Interact Through Walls - Activated", Color.green)
    else
        update_config("interact_through_walls", false)

        managers.mission._fading_debug_output:script().log("Interact Through Walls - Deactivated", Color.red)
    end
end

toggle_interact_with_anything = toggle_interact_with_anything or function(info)
    if not p2t_config.interact_with_anything then
        update_config("interact_with_anything", true)
        
        managers.mission._fading_debug_output:script().log("Interact With Anything - Activated", Color.green)
    else
        update_config("interact_with_anything", false)

        managers.mission._fading_debug_output:script().log("Interact With Anything - Deactivated", Color.red)
    end
end

toggle_interaction_distance_boost = toggle_interaction_distance_boost or function(info)
    if not p2t_config.interaction_distance_boost then
        update_config("interaction_distance_boost", true)
        
        managers.mission._fading_debug_output:script().log("Interaction Distance Boost - Activated", Color.green)
    else
        update_config("interaction_distance_boost", false)

        managers.mission._fading_debug_output:script().log("Interaction Distance Boost - Deactivated", Color.red)
    end
end

toggle_dont_interrupt_on_distance = toggle_dont_interrupt_on_distance or function(info)
    if not p2t_config.dont_interrupt_on_distance then
        update_config("dont_interrupt_on_distance", true)
        
        managers.mission._fading_debug_output:script().log("No Interruption On Distance - Activated", Color.green)
    else
        update_config("dont_interrupt_on_distance", false)

        managers.mission._fading_debug_output:script().log("No Interruption On Distance - Deactivated", Color.red)
    end
end

toggle_no_pickup_cooldown = toggle_no_pickup_cooldown or function(info)
    if not p2t_config.no_pickup_cooldown then
        update_config("no_pickup_cooldown", true)
        
        managers.mission._fading_debug_output:script().log("No Pickup Cooldown - Activated", Color.green)
    else
        update_config("no_pickup_cooldown", false)

        managers.mission._fading_debug_output:script().log("No Pickup Cooldown - Deactivated", Color.red)
    end
end

toggle_zipline_speed_boost = toggle_zipline_speed_boost or function(info)
    if not p2t_config.zipline_speed_boost then
        update_config("zipline_speed_boost", true)
        
        managers.mission._fading_debug_output:script().log("Zipline Speed Boost - Activated", Color.green)
    else
        update_config("zipline_speed_boost", false)

        managers.mission._fading_debug_output:script().log("Zipline Speed Boost - Deactivated", Color.red)
    end
end

toggle_shoot_while_interacting = toggle_shoot_while_interacting or function(info)
    if not p2t_config.shoot_while_interacting then
        update_config("shoot_while_interacting", true)
        
        managers.mission._fading_debug_output:script().log("Shoot While Interacting - Activated", Color.green)
    else
        update_config("shoot_while_interacting", false)

        managers.mission._fading_debug_output:script().log("Shoot While Interacting - Deactivated", Color.red)
    end
end

toggle_move_while_interacting = toggle_move_while_interacting or function(info)
    if not p2t_config.move_while_interacting then
        update_config("move_while_interacting", true)
        
        managers.mission._fading_debug_output:script().log("Move While Interacting - Activated", Color.green)
    else
        update_config("move_while_interacting", false)

        managers.mission._fading_debug_output:script().log("Move While Interacting - Deactivated", Color.red)
    end
end

toggle_climb_boost = toggle_climb_boost or function(info)
    if not p2t_config.climb_boost then
        update_config("climb_boost", true)
        
        managers.mission._fading_debug_output:script().log("Climb Boost - Activated", Color.green)
    else
        update_config("climb_boost", false)

        managers.mission._fading_debug_output:script().log("Climb Boost - Deactivated", Color.red)
    end
end

toggle_infinite_stamina = toggle_infinite_stamina or function(info)
    if not p2t_config.infinite_stamina then
        update_config("infinite_stamina", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Stamina - Activated", Color.green)
    else
        update_config("infinite_stamina", false)

        managers.mission._fading_debug_output:script().log("Infinite Stamina - Deactivated", Color.red)
    end
end

toggle_jump_boost = toggle_jump_boost or function(info)
    if not p2t_config.stop_saying_calling_police then
        update_config("stop_saying_calling_police", true)
        
        managers.mission._fading_debug_output:script().log("Jump Boost - Activated", Color.green)
    else
        update_config("stop_saying_calling_police", false)

        managers.mission._fading_debug_output:script().log("Jump Boost - Deactivated", Color.red)
    end
end

toggle_run_boost = toggle_run_boost or function(info)
    if not p2t_config.run_boost then
        update_config("run_boost", true)
        
        managers.mission._fading_debug_output:script().log("Run Boost - Activated", Color.green)
    else
        update_config("run_boost", false)

        managers.mission._fading_debug_output:script().log("Run Boost - Deactivated", Color.red)
    end
end

toggle_walk_boost = toggle_walk_boost or function(info)
    if not p2t_config.walk_boost then
        update_config("walk_boost", true)
        
        managers.mission._fading_debug_output:script().log("Walk Boost - Activated", Color.green)
    else
        update_config("walk_boost", false)

        managers.mission._fading_debug_output:script().log("Walk Boost - Deactivated", Color.red)
    end
end

toggle_no_carry_speed_penalty = toggle_no_carry_speed_penalty or function(info)
    if not p2t_config.no_carry_speed_penalty then
        update_config("no_carry_speed_penalty", true)
        
        managers.mission._fading_debug_output:script().log("No Carry Speed Penalty - Activated", Color.green)
    else
        update_config("no_carry_speed_penalty", false)

        managers.mission._fading_debug_output:script().log("No Carry Speed Penalty - Deactivated", Color.red)
    end
end

toggle_no_armor_speed_penalty = toggle_no_armor_speed_penalty or function(info)
    if not p2t_config.no_armor_speed_penalty then
        update_config("no_armor_speed_penalty", true)
        
        managers.mission._fading_debug_output:script().log("No Armor Speed Penalty - Activated", Color.green)
    else
        update_config("no_armor_speed_penalty", false)

        managers.mission._fading_debug_output:script().log("No Armor Speed Penalty - Deactivated", Color.red)
    end
end

toggle_always_kick_start = toggle_always_kick_start or function(info)
    if not p2t_config.always_kick_start then
        update_config("always_kick_start", true)
        
        managers.mission._fading_debug_output:script().log("Always Kick Start - Activated", Color.green)
    else
        update_config("always_kick_start", false)

        managers.mission._fading_debug_output:script().log("Always Kick Start - Deactivated", Color.red)
    end
end

toggle_infinite_ecm = toggle_infinite_ecm or function(info)
    if not p2t_config.infinite_ecm then
        update_config("infinite_ecm", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Ecm - Activated", Color.green)
    else
        update_config("infinite_ecm", false)

        managers.mission._fading_debug_output:script().log("Infinite Ecm - Deactivated", Color.red)
    end
end

toggle_infinite_pecm = toggle_infinite_pecm or function(info)
    if not p2t_config.infinite_pecm then
        update_config("infinite_pecm", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Pecm - Activated", Color.green)
    else
        update_config("infinite_pecm", false)

        managers.mission._fading_debug_output:script().log("Infinite Pecm - Deactivated", Color.red)
    end
end

toggle_infinite_following_hostages = toggle_infinite_following_hostages or function(info)
    if not p2t_config.infinite_following_hostages then
        update_config("infinite_following_hostages", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Following Hostages - Activated", Color.green)
    else
        update_config("infinite_following_hostages", false)

        managers.mission._fading_debug_output:script().log("Infinite Following Hostages - Deactivated", Color.red)
    end
end

toggle_infinite_converts = toggle_infinite_converts or function(info)
    if not p2t_config.infinite_converts then
        update_config("infinite_converts", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Converts - Activated", Color.green)
    else
        update_config("infinite_converts", false)

        managers.mission._fading_debug_output:script().log("Infinite Converts - Deactivated", Color.red)
    end
end

toggle_max_armor_piercing_chance = toggle_max_armor_piercing_chance or function(info)
    if not p2t_config.max_armor_piercing_chance then
        update_config("max_armor_piercing_chance", true)
        
        managers.mission._fading_debug_output:script().log("Max Armor Piercing Chance - Activated", Color.green)
    else
        update_config("max_armor_piercing_chance", false)

        managers.mission._fading_debug_output:script().log("Max Armor Piercing Chance - Deactivated", Color.red)
    end
end

toggle_max_crit_chance = toggle_max_crit_chance or function(info)
    if not p2t_config.max_crit_chance then
        update_config("max_crit_chance", true)
        
        managers.mission._fading_debug_output:script().log("Max Crit Chance - Activated", Color.green)
    else
        update_config("max_crit_chance", false)

        managers.mission._fading_debug_output:script().log("Max Crit Chance - Deactivated", Color.red)
    end
end

toggle_max_dodge_chance = toggle_max_dodge_chance or function(info)
    if not p2t_config.max_dodge_chance then
        update_config("max_dodge_chance", true)
        
        managers.mission._fading_debug_output:script().log("Max Dodge Chance - Activated", Color.green)
    else
        update_config("max_dodge_chance", false)

        managers.mission._fading_debug_output:script().log("Max Dodge Chance - Deactivated", Color.red)
    end
end

toggle_no_inspire_cooldown = toggle_no_inspire_cooldown or function(info)
    if not p2t_config.no_inspire_cooldown then
        update_config("no_inspire_cooldown", true)
        
        managers.mission._fading_debug_output:script().log("No Inspire Cooldown - Activated", Color.green)
    else
        update_config("no_inspire_cooldown", false)

        managers.mission._fading_debug_output:script().log("No Inspire Cooldown - Deactivated", Color.red)
    end
end

toggle_reduce_six_sense = toggle_reduce_six_sense or function(info)
    if not p2t_config.reduce_six_sense then
        update_config("reduce_six_sense", true)
        
        managers.mission._fading_debug_output:script().log("Reduce Six Sense - Activated", Color.green)
    else
        update_config("reduce_six_sense", false)

        managers.mission._fading_debug_output:script().log("Reduce Six Sense - Deactivated", Color.red)
    end
end

toggle_increased_fire_rate = toggle_increased_fire_rate or function(info)
    if not p2t_config.increased_fire_rate then
        update_config("increased_fire_rate", true)
        
        managers.mission._fading_debug_output:script().log("Increased Fire Rate - Activated", Color.green)
    else
        update_config("increased_fire_rate", false)

        managers.mission._fading_debug_output:script().log("Increased Fire Rate - Deactivated", Color.red)
    end
end

toggle_increased_reload_speed = toggle_increased_reload_speed or function(info)
    if not p2t_config.increased_reload_speed then
        update_config("increased_reload_speed", true)
        
        managers.mission._fading_debug_output:script().log("Increased Reload Speed - Activated", Color.green)
    else
        update_config("increased_reload_speed", false)

        managers.mission._fading_debug_output:script().log("Increased Reload Speed - Deactivated", Color.red)
    end
end

toggle_increased_swap_speed = toggle_increased_swap_speed or function(info)
    if not p2t_config.increased_swap_speed then
        update_config("increased_swap_speed", true)
        
        managers.mission._fading_debug_output:script().log("Increased Swap Speed - Activated", Color.green)
    else
        update_config("increased_swap_speed", false)

        managers.mission._fading_debug_output:script().log("Increased Swap Speed - Deactivated", Color.red)
    end
end

toggle_infinite_ammo = toggle_infinite_ammo or function(info)
    if not p2t_config.infinite_ammo then
        update_config("infinite_ammo", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Ammo - Activated", Color.green)
    else
        update_config("infinite_ammo", false)

        managers.mission._fading_debug_output:script().log("Infinite Ammo - Deactivated", Color.red)
    end
end

toggle_no_recoil = toggle_no_recoil or function(info)
    if not p2t_config.no_recoil then
        update_config("no_recoil", true)
        
        managers.mission._fading_debug_output:script().log("No Recoil - Activated", Color.green)
    else
        update_config("no_recoil", false)

        managers.mission._fading_debug_output:script().log("No Recoil - Deactivated", Color.red)
    end
end

toggle_no_spread = toggle_no_spread or function(info)
    if not p2t_config.no_spread then
        update_config("no_spread", true)
        
        managers.mission._fading_debug_output:script().log("No Spread - Activated", Color.green)
    else
        update_config("no_spread", false)

        managers.mission._fading_debug_output:script().log("No Spread - Deactivated", Color.red)
    end
end

toggle_one_shot_kill = toggle_one_shot_kill or function(info)
    if not p2t_config.one_shot_kill then
        update_config("one_shot_kill", true)
        
        managers.mission._fading_debug_output:script().log("One Shot Kill - Activated", Color.green)
    else
        update_config("one_shot_kill", false)

        managers.mission._fading_debug_output:script().log("One Shot Kill - Deactivated", Color.red)
    end
end

toggle_melee_tweaks = toggle_melee_tweaks or function(info)
    if not p2t_config.melee_tweaks then
        update_config("melee_tweaks", true)
        
        managers.mission._fading_debug_output:script().log("Melee Tweaks - Activated", Color.green)
    else
        update_config("melee_tweaks", false)

        managers.mission._fading_debug_output:script().log("Melee Tweaks - Deactivated", Color.red)
    end
end

toggle_bow_tweaks = toggle_bow_tweaks or function(info)
    if not p2t_config.bow_tweaks then
        update_config("bow_tweaks", true)
        
        managers.mission._fading_debug_output:script().log("Bow Tweaks - Activated", Color.green)
    else
        update_config("bow_tweaks", false)

        managers.mission._fading_debug_output:script().log("Bow Tweaks - Deactivated", Color.red)
    end
end

toggle_no_ads_movement = toggle_no_ads_movement or function(info)
    if not p2t_config.no_ads_movement then
        update_config("no_ads_movement", true)
        
        managers.mission._fading_debug_output:script().log("No Ads Movement - Activated", Color.green)
    else
        update_config("no_ads_movement", false)

        managers.mission._fading_debug_output:script().log("No Ads Movement - Deactivated", Color.red)
    end
end

toggle_no_ads_recoil = toggle_no_ads_recoil or function(info)
    if not p2t_config.no_ads_recoil then
        update_config("no_ads_recoil", true)
        
        managers.mission._fading_debug_output:script().log("No Ads Recoil - Activated", Color.green)
    else
        update_config("no_ads_recoil", false)

        managers.mission._fading_debug_output:script().log("No Ads Recoil - Deactivated", Color.red)
    end
end

shoot_through_anything = shoot_through_anything or function(info)
    if not p2t_config.shoot_through_anything then
        update_config("shoot_through_anything", true)
        
        managers.mission._fading_debug_output:script().log("Shoot Through Anything - Activated", Color.green)
    else
        update_config("shoot_through_anything", false)

        managers.mission._fading_debug_output:script().log("Shoot Through Anything - Deactivated", Color.red)
    end
end

toggle_auto_counter_cloakers = toggle_auto_counter_cloakers or function(info)
    if not p2t_config.auto_counter_cloakers then
        update_config("auto_counter_cloakers", true)
        
        managers.mission._fading_debug_output:script().log("Auto Counter Cloakers - Activated", Color.green)
    else
        update_config("auto_counter_cloakers", false)

        managers.mission._fading_debug_output:script().log("Auto Counter Cloakers - Deactivated", Color.red)
    end
end

toggle_god_mode = toggle_god_mode or function(info)
    if not p2t_config.god_mode then
        update_config("god_mode", true)
        
        managers.mission._fading_debug_output:script().log("God Mode - Activated", Color.green)
    else
        update_config("god_mode", false)

        managers.mission._fading_debug_output:script().log("God Mode - Deactivated", Color.red)
    end
end

toggle_invisibility = toggle_invisibility or function(info)
    if not p2t_config.invisibility then
        update_config("invisibility", true)
        
        managers.mission._fading_debug_output:script().log("Invisibility - Activated", Color.green)
    else
        update_config("invisibility", false)

        managers.mission._fading_debug_output:script().log("Invisibility - Deactivated", Color.red)
    end
end

toggle_no_camera_limit = toggle_no_camera_limit or function(info)
    if not p2t_config.no_camera_limit then
        update_config("no_camera_limit", true)
        
        managers.mission._fading_debug_output:script().log("No Camera Limit - Activated", Color.green)
    else
        update_config("no_camera_limit", false)

        managers.mission._fading_debug_output:script().log("No Camera Limit - Deactivated", Color.red)
    end
end

toggle_no_camera_rotation = toggle_no_camera_rotation or function(info)
    if not p2t_config.no_camera_rotation then
        update_config("no_camera_rotation", true)
        
        managers.mission._fading_debug_output:script().log("No Camera Rotation - Activated", Color.green)
    else
        update_config("no_camera_rotation", false)

        managers.mission._fading_debug_output:script().log("No Camera Rotation - Deactivated", Color.red)
    end
end

toggle_no_camera_shake = toggle_no_camera_shake or function(info)
    if not p2t_config.no_camera_shake then
        update_config("no_camera_shake", true)
        
        managers.mission._fading_debug_output:script().log("No Camera Shake - Activated", Color.green)
    else
        update_config("no_camera_shake", false)

        managers.mission._fading_debug_output:script().log("No Camera Shake - Deactivated", Color.red)
    end
end

toggle_no_detection_in_casing = toggle_no_detection_in_casing or function(info)
    if not p2t_config.no_detection_in_casing then
        update_config("no_detection_in_casing", true)
        
        managers.mission._fading_debug_output:script().log("No Detection In Casing - Activated", Color.green)
    else
        update_config("no_detection_in_casing", false)

        managers.mission._fading_debug_output:script().log("No Detection In Casing - Deactivated", Color.red)
    end
end

toggle_no_explosion_shake = toggle_no_explosion_shake or function(info)
    if not p2t_config.no_explosion_shake then
        update_config("no_explosion_shake", true)
        
        managers.mission._fading_debug_output:script().log("No Explosion Shake - Activated", Color.green)
    else
        update_config("no_explosion_shake", false)

        managers.mission._fading_debug_output:script().log("No Explosion Shake - Deactivated", Color.red)
    end
end

toggle_no_flashbang = toggle_no_flashbang or function(info)
    if not p2t_config.no_flashbang then
        update_config("no_flashbang", true)
        
        managers.mission._fading_debug_output:script().log("No Flashbang - Activated", Color.green)
    else
        update_config("no_flashbang", false)

        managers.mission._fading_debug_output:script().log("No Flashbang - Deactivated", Color.red)
    end
end

toggle_no_headbob = toggle_no_headbob or function(info)
    if not p2t_config.no_headbob then
        update_config("no_headbob", true)
        
        managers.mission._fading_debug_output:script().log("No Headbob - Activated", Color.green)
    else
        update_config("no_headbob", false)

        managers.mission._fading_debug_output:script().log("No Headbob - Deactivated", Color.red)
    end
end

toggle_no_hit_disorientation = toggle_no_hit_disorientation or function(info)
    if not p2t_config.no_hit_disorientation then
        update_config("no_hit_disorientation", true)
        
        managers.mission._fading_debug_output:script().log("No Hit Disorientation - Activated", Color.green)
    else
        update_config("no_hit_disorientation", false)

        managers.mission._fading_debug_output:script().log("No Hit Disorientation - Deactivated", Color.red)
    end
end

toggle_no_sway = toggle_no_sway or function(info)
    if not p2t_config.no_sway then
        update_config("no_sway", true)
        
        managers.mission._fading_debug_output:script().log("No Sway - Activated", Color.green)
    else
        update_config("no_sway", false)

        managers.mission._fading_debug_output:script().log("No Sway - Deactivated", Color.red)
    end
end

toggle_no_concussion_tinnitus = toggle_no_concussion_tinnitus or function(info)
    if not p2t_config.no_concussion_tinnitus then
        update_config("no_concussion_tinnitus", true)
        
        managers.mission._fading_debug_output:script().log("No Concussion Tinnitus - Activated", Color.green)
    else
        update_config("no_concussion_tinnitus", false)

        managers.mission._fading_debug_output:script().log("No Concussion Tinnitus - Deactivated", Color.red)
    end
end

toggle_infinite_drawing_points = toggle_infinite_drawing_points or function(info)
    if not p2t_config.infinite_drawing_points then
        update_config("infinite_drawing_points", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Drawing Points - Activated", Color.green)
    else
        update_config("infinite_drawing_points", false)

        managers.mission._fading_debug_output:script().log("Infinite Drawing Points - Deactivated", Color.red)
    end
end

toggle_infinite_favors = toggle_infinite_favors or function(info)
    if not p2t_config.infinite_favors then
        update_config("infinite_favors", true)
        
        managers.mission._fading_debug_output:script().log("Infinite Favors - Activated", Color.green)
    else
        update_config("infinite_favors", false)

        managers.mission._fading_debug_output:script().log("Infinite Favors - Deactivated", Color.red)
    end
end

toggle_all_crew_boosts = toggle_all_crew_boosts or function(info)
    if not p2t_config.all_crew_boosts then
        update_config("all_crew_boosts", true)
        
        managers.mission._fading_debug_output:script().log("All Crew Boosts - Activated", Color.green)
    else
        update_config("all_crew_boosts", false)

        managers.mission._fading_debug_output:script().log("All Crew Boosts - Deactivated", Color.red)
    end
end

toggle_complete_all_side_jobs = toggle_complete_all_side_jobs or function(info)
    if not p2t_config.complete_all_side_jobs then
        update_config("complete_all_side_jobs", true)
        
        managers.mission._fading_debug_output:script().log("Complete All Side Jobs - Activated", Color.green)
    else
        update_config("complete_all_side_jobs", false)

        managers.mission._fading_debug_output:script().log("Complete All Side Jobs - Deactivated", Color.red)
    end
end

toggle_free_job_purchases = toggle_free_job_purchases or function(info)
    if not p2t_config.free_job_purchases then
        update_config("free_job_purchases", true)
        
        managers.mission._fading_debug_output:script().log("Free Job Purchases - Activated", Color.green)
    else
        update_config("free_job_purchases", false)

        managers.mission._fading_debug_output:script().log("Free Job Purchases - Deactivated", Color.red)
    end
end

call_reset_config = call_reset_config or function(info)
    reset_config()
        
    managers.mission._fading_debug_output:script().log("Config Successfully Reseted", Color.green)
end

call_anti_cheat = call_anti_cheat or function()
    openmenu(call_anti_cheat_options)
end

call_alarm = call_alarm or function()
    openmenu(call_alarm_options)
end

call_heist = call_heist or function()
    openmenu(call_heist_options)
end

call_player_equipment = call_player_equipment or function()
    openmenu(call_player_equipment_options)
end

call_player_interaction = call_player_interaction or function()
    openmenu(call_player_interaction_options)
end

call_player_movement = call_player_movement or function()
    openmenu(call_player_movement_options)
end

call_player_skills = call_player_skills or function()
    openmenu(call_player_skills_options)
end

call_player_weapon = call_player_weapon or function()
    openmenu(call_player_weapon_options)
end

call_player = call_player or function()
    openmenu(call_player_options)
end

call_pre_planning = call_pre_planning or function()
    openmenu(call_pre_planning_options)
end

call_contract = call_contract or function()
    openmenu(call_contract_options)
end

call_config = call_config or function()
    openmenu(call_config_options)
end

back_to_config_options = back_to_config_options or function()
    openmenu(call_config_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

anti_cheat_options = anti_cheat_options or 
	{
		{},
		{ text = "Toggle No Verify Content", callback = toggle_no_verify_content },
		{ text = "Toggle No Chat Spam", callback = toggle_no_chat_spam },
		{ text = "Toggle Don't Publish Statictics", callback = toggle_dont_publish_statistics },
		{ text = "Toggle Spoof Actions", callback = toggle_spoof_actions },
		{ text = "Toggle Spoof Inventory", callback = toggle_spoof_inventory },
		{ text = "Toggle Spoof P2D Community", callback = toggle_spoof_pd2_community },
		{ text = "Toggle Hide Modlist", callback = toggle_hide_modlist },
		{ text = "Toggle Hide Trainer", callback = toggle_hide_trainer },
		{ text = "Toggle Anti Anti Hidden Modlist", callback = toggle_anti_anti_hidden_modlist },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_anti_cheat_options = call_anti_cheat_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Anti Cheat Options", anti_cheat_options)

alarm_options = alarm_options or 
	{
		{},
		{ text = "Toggle Disable Camera Alarm", callback = toggle_disable_camera_alarm },
		{ text = "Toggle Disable Cameras", callback = toggle_disable_cameras },
		{ text = "Toggle Infinite Pagers", callback = toggle_infinite_pagers },
		{ text = "Toggle No Camera Sound", callback = toggle_no_camera_sound },
		{ text = "Toggle Prevents", callback = toggle_prevents },
		{ text = "Toggle Stop Calling Police", callback = toggle_stop_calling_police },
		{ text = "Toggle Stop Reporting", callback = toggle_stop_reporting },
		{ text = "Toggle Stop Saying Calling Police", callback = toggle_stop_saying_calling_police },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_alarm_options = call_alarm_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Alarm Options", alarm_options)

heist_options = heist_options or 
	{
		{},
		{ text = "Toggle Auto Pickup", callback = toggle_auto_pickup },
		{ text = "Toggle No Alarm Laser", callback = toggle_no_alarm_laser },
		{ text = "Toggle No Cash Penalty", callback = toggle_no_cash_penalty },
		{ text = "Toggle No Pagers", callback = toggle_no_pagers },
		{ text = "Toggle No Pager On Domination", callback = toggle_no_pager_on_domination },
		{ text = "Toggle Xray", callback = toggle_xray },
		{ text = "Toggle Longer Camera Loop", callback = toggle_longer_camera_loop },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_heist_options = call_heist_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Heist Options", heist_options)

player_equipment_options = player_equipment_options or 
	{
		{},
		{ text = "Toggle Infinite BodyBags", callback = toggle_infinite_bodybags },
		{ text = "Toggle Infinite Cable Ties", callback = toggle_infinite_cable_ties },
		{ text = "Toggle Infinite Equipment", callback = toggle_infinite_equipment },
		{ text = "Toggle Instant Deploy", callback = toggle_instant_deploy },
		{ text = "Toggle Instant Mask On", callback = toggle_instant_mask_on },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_equipment_options = call_player_equipment_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Equipment Options", player_equipment_options)

player_interaction_options = player_interaction_options or 
	{
		{},
		{ text = "Toggle Drill Speed Boost", callback = toggle_drill_speed_boost },
		{ text = "Toggle Instant Interactions", callback = toggle_instant_interactions },
		{ text = "Toggle Interact In Casing", callback = toggle_interact_in_casing },
		{ text = "Toggle Interact Through Walls", callback = toggle_interact_through_walls },
		{ text = "Toggle Interact With Anything", callback = toggle_interact_with_anything },
		{ text = "Toggle Interaction Distance Boost", callback = toggle_interaction_distance_boost },
		{ text = "Toggle No Interruption On Distance", callback = toggle_dont_interrupt_on_distance },
		{ text = "Toggle No Pickup Cooldown", callback = toggle_no_pickup_cooldown },
		{ text = "Toggle Zipline Speed Boost", callback = toggle_zipline_speed_boost },
		{ text = "Toggle Shoot While Interacting", callback = toggle_shoot_while_interacting },
		{ text = "Toggle Move While Interacting", callback = toggle_move_while_interacting },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_interaction_options = call_player_interaction_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Interaction Options", player_interaction_options)

player_movement_options = player_movement_options or 
	{
		{},
		{ text = "Toggle Climb Boost", callback = toggle_climb_boost },
		{ text = "Toggle Jump Boost", callback = toggle_jump_boost },
		{ text = "Toggle Walk Boost", callback = toggle_walk_boost },
		{ text = "Toggle Run Boost", callback = toggle_run_boost },
		{ text = "Toggle Infinite Stamina", callback = toggle_infinite_stamina },
		{ text = "Toggle No Carry Speed Penalty", callback = toggle_no_carry_speed_penalty },
		{ text = "Toggle No Armor Speed Penalty", callback = toggle_no_armor_speed_penalty },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_movement_options = call_player_movement_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Movement Options", player_movement_options)

player_skills_options = player_skills_options or 
	{
		{},
		{ text = "Toggle Always Kick Start", callback = toggle_always_kick_start },
		{ text = "Toggle Infinite Ecm", callback = toggle_infinite_ecm },
		{ text = "Toggle Infinite Pecm", callback = toggle_infinite_pecm },
		{ text = "Toggle Infinite Following Hostages", callback = toggle_infinite_following_hostages },
		{ text = "Toggle Infinite Converts", callback = toggle_infinite_converts },
		{ text = "Toggle Max Armor Piercing Chance", callback = toggle_max_armor_piercing_chance },
		{ text = "Toggle Max Crit Chance", callback = toggle_max_crit_chance },
		{ text = "Toggle Max Dodge Chance", callback = toggle_max_dodge_chance },
		{ text = "Toggle No Inspire Cooldown", callback = toggle_no_inspire_cooldown },
		{ text = "Toggle Reduce Six Sense", callback = toggle_reduce_six_sense },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_skills_options = call_player_skills_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Skills Options", player_skills_options)

player_weapon_options = player_weapon_options or 
	{
		{},
		{ text = "Toggle Increased Fire Rate", callback = toggle_increased_fire_rate },
		{ text = "Toggle Increased Reload Speed", callback = toggle_increased_reload_speed },
		{ text = "Toggle Increased Swap Speed", callback = toggle_increased_swap_speed },
		{ text = "Toggle Infinite Ammo", callback = toggle_infinite_ammo },
		{ text = "Toggle No Recoil", callback = toggle_no_recoil },
		{ text = "Toggle No Spread", callback = toggle_no_spread },
		{ text = "Toggle One Shot Kill", callback = toggle_one_shot_kill },
		{ text = "Toggle Melee Tweaks", callback = toggle_melee_tweaks },
		{ text = "Toggle Bow Tweaks", callback = toggle_bow_tweaks },
		{ text = "No Ads Movement", callback = toggle_no_ads_movement },
		{ text = "No Ads Recoil", callback = toggle_no_ads_recoil },
		{ text = "Shoot Through Anything", callback = shoot_through_anything },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_weapon_options = call_player_weapon_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Weapon Options", player_weapon_options)

player_options = player_options or 
	{
		{},
		{ text = "Toggle Auto Counter Cloakers", callback = toggle_auto_counter_cloakers },
		{ text = "Toggle God Mode", callback = toggle_god_mode },
		{ text = "Toggle Invisibility", callback = toggle_invisibility },
		{ text = "Toggle No Camera Limit", callback = toggle_no_camera_limit },
		{ text = "Toggle No Camera Rotation", callback = toggle_no_camera_rotation },
		{ text = "Toggle No Camera Shake", callback = toggle_no_camera_shake },
		{ text = "Toggle No Detection In Casing", callback = toggle_no_detection_in_casing },
		{ text = "Toggle No Explosion Shake", callback = toggle_no_explosion_shake },
		{ text = "Toggle No Flashbang", callback = toggle_no_flashbang },
		{ text = "Toggle No Headbob", callback = toggle_no_headbob },
		{ text = "Toggle No Hit Disorientation", callback = toggle_no_hit_disorientation },
		{ text = "Toggle No Sway", callback = toggle_no_sway },
		{ text = "Toggle No Concussion Tinnitus", callback = toggle_no_concussion_tinnitus },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_player_options = call_player_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Player Options", player_options)

pre_planning_options = pre_planning_options or 
	{
		{},
		{ text = "Toggle Infinite Drawing Points", callback = toggle_infinite_drawing_points },
		{ text = "Toggle Infinite Favors", callback = toggle_infinite_favors },
		{ text = "Toggle All Crew Boosts", callback = toggle_all_crew_boosts },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_pre_planning_options = call_pre_planning_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Pre Planning Options", pre_planning_options)

contract_options = contract_options or 
	{
		{},
		{ text = "Toggle Complete Side Jobs", callback = toggle_complete_all_side_jobs },
		{ text = "Toggle Free Jobs Purchased", callback = toggle_free_job_purchases },
		{},
		{ text = "Back", callback = back_to_config_options },
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_contract_options = call_contract_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Contract Options", contract_options)

config_options = config_options or 
	{
		{},
		{ text = "Alarm", callback = call_alarm },
		{ text = "Heist", callback = call_heist },
		{ text = "Player Equipment", callback = call_player_equipment },
		{ text = "Player Interaction", callback = call_player_interaction },
		{ text = "Player Movement", callback = call_player_movement },
		{ text = "Player Skills", callback = call_player_skills },
		{ text = "Player Weapon", callback = call_player_weapon },
		{ text = "Player", callback = call_player },
		{ text = "Pre Planning", callback = call_pre_planning },
		{ text = "Contract", callback = call_contract },
		{ text = "Anti Cheat", callback = call_anti_cheat },
		{},
		{ text = "Reset Config", callback = call_reset_config },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_config_options = call_config_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Config Options", config_options)