Arrows_and_Throwable = {"elastic_arrow", "elastic_arrow_poison", "elastic_arrow_exp", "ecp_arrow", "ecp_arrow_poison",
                        "ecp_arrow_exp", "long_arrow_exp", "long_poison_arrow", "long_arrow", "frankish_arrow_exp",
                        "frankish_poison_arrow", "frankish_arrow", "wpn_prj_four", "wpn_prj_ace", "wpn_prj_jav",
                        "wpn_prj_hur", "wpn_prj_target", "arblast_arrow", "arblast_poison_arrow", "arblast_arrow_exp",
                        "west_arrow", "west_arrow_exp", "bow_poison_arrow", "crossbow_arrow", "crossbow_poison_arrow",
                        "crossbow_arrow_exp"}

for _, projectile in ipairs(Arrows_and_Throwable) do
    tweak_data.projectiles[projectile].no_cheat_count = true
    tweak_data.projectiles[projectile].launch_speed = tweak_data.projectiles[projectile].launch_speed * 10
end

local old_init = WeaponTweakData.init
function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

    -- Pistol Crossbow hunter
    self.hunter.stats.damage = 200
    self.hunter.CLIP_AMMO_MAX = 20
    self.hunter.NR_CLIPS_MAX = 100
    self.hunter.AMMO_MAX = self.hunter.NR_CLIPS_MAX
    self.hunter.AMMO_PICKUP = {50, 100}
    self.hunter.stats.spread = 50
    self.hunter.stats.recoil = 60
    self.hunter.stats.zoom = 6
    self.hunter.stats.alert_size = 50
    self.hunter.stats.reload = 0.5
    self.hunter.FIRE_MODE = "auto"
    self.hunter.auto = {
        fire_rate = 0.2
    }
    self.hunter.single = {
        fire_rate = 0.2
    }
    self.hunter.fire_mode_data = {
        fire_rate = 0.2
    }
    self.hunter.CAN_TOGGLE_FIREMODE = true

    -- heavy crossbow
    self.arblast.stats.damage = 10000
    self.arblast.AMMO_PICKUP = {2, 10}
    self.arblast.stats.zoom = 6
    self.arblast.stats.alert_size = 50
    self.arblast.stats.reload = 0.5
    self.arblast.FIRE_MODE = "auto"
    self.arblast.single = {
        fire_rate = 0.2
    }
    self.arblast.fire_mode_data = {
        fire_rate = 0.2
    }

    -- Airbow ecp
    self.ecp.stats.damage = 200
    self.ecp.CLIP_AMMO_MAX = 30
    self.ecp.NR_CLIPS_MAX = 60
    self.ecp.stats_modifiers = {
        damage = 50
    }
    self.ecp.AMMO_PICKUP = {1000, 2000}
    self.ecp.stats.spread = 50
    self.ecp.stats.recoil = 60
    self.ecp.stats.zoom = 6
    self.ecp.stats.alert_size = 50
    self.ecp.stats.reload = 0.5
    self.ecp.FIRE_MODE = "auto"
    self.ecp.auto = {
        fire_rate = 0.2
    }
    self.ecp.single = {
        fire_rate = 0.2
    }
    self.ecp.fire_mode_data = {
        fire_rate = 0.2
    }
    self.ecp.CAN_TOGGLE_FIREMODE = true
    self.ecp.timers.reload_not_empty = 0.2
    self.ecp.timers.reload_empty = 0.2

    -- plainstrider
    self.plainsrider.stats.suppression = 0
    self.plainsrider.stats.spread = 100
    self.plainsrider.stats.recoil = 100
    self.plainsrider.CLIP_AMMO_MAX = 30
    self.plainsrider.NR_CLIPS_MAX = 60
    self.plainsrider.charge_data = {
        max_t = 0.01
    }
    self.plainsrider.bow_reload_speed_multiplier = 3
    self.plainsrider.FIRE_MODE = "single"
    self.plainsrider.auto = {
        fire_rate = 0.4
    }
    self.plainsrider.single = {
        fire_rate = 0.1
    }
    self.plainsrider.fire_mode_data = {
        fire_rate = 0.1
    }
    self.plainsrider.timers.reload_not_empty = 0.2
    self.plainsrider.timers.reload_empty = 0.2
    self.plainsrider.stats.zoom = 7

    -- deca
    self.elastic.stats.suppression = 0
    self.elastic.stats.spread = 100
    self.elastic.stats.recoil = 100
    self.elastic.CLIP_AMMO_MAX = 30
    self.elastic.NR_CLIPS_MAX = 60
    self.elastic.charge_data = {
        max_t = 0.01
    }
    self.elastic.bow_reload_speed_multiplier = 3
    self.elastic.FIRE_MODE = "single"
    self.elastic.auto = {
        fire_rate = 0.4
    }
    self.elastic.single = {
        fire_rate = 0.1
    }
    self.elastic.fire_mode_data = {
        fire_rate = 0.1
    }
    self.elastic.timers.reload_not_empty = 0.2
    self.elastic.timers.reload_empty = 0.2
    self.elastic.stats.zoom = 7
end
