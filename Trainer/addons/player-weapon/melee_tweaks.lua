for _, wep in ipairs(tweak_data.blackmarket.melee_weapons) do
    if wep then
        wep.expire_t = 0.1
        wep.charge_time = 0.1
        wep.stats.range = 350
    end
end

local CopDamage_damage_melee = CopDamage.damage_melee

function CopDamage:damage_melee(attack_data, ...)
    attack_data.damage = attack_data.damage * 5000
    return CopDamage_damage_melee(self, attack_data, ...)
end

local TankCopDamage_super_damage_melee = TankCopDamage.super.damage_melee

function TankCopDamage.damage_melee(...)
    return TankCopDamage_damage_melee(self, ...)
end

local HuskTankCopDamage_super_damage_melee = HuskTankCopDamage.super.damage_melee

function HuskTankCopDamage.damage_melee(...)
    return HuskTankCopDamage_damage_melee(self, ...)
end
