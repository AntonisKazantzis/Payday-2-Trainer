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

    managers.mission._fading_debug_output:script().log("Unlock All Inventory Slots - Activated", Color.green)
end

unlock_all_items = unlock_all_items or function(info)
    local pairs = pairs
    local unlock_items_category, unlock_types, unlock_weapons, get_global_value

    unlock_items = function(item_type)
        if item_type == "all" then
            unlock_types()
        elseif item_type == "weapons" then
            unlock_weapons()
        else
            unlock_items_category(item_type)
        end
    end

    unlock_types = function()
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

    managers.mission._fading_debug_output:script().log("Unlock All Items - Activated", Color.green)
end

smart_unloker = smart_unloker or function(info)
    local WINDLCManager_verify_dlcs = WINDLCManager._verify_dlcs
 
    function WINDLCManager:_verify_dlcs()
        WINDLCManager_verify_dlcs(self)

        for dlc_name, dlc_data in pairs(Global.dlc_manager.all_dlc_data) do
            if dlc_data.external or not dlc_data.app_id or dlc_data.app_id == "218620" then
                dlc_data.verified = true
            end
        end
        
    end
    
    local WinSteamDLCManager_check_dlc_data = WinSteamDLCManager._check_dlc_data
    
    function WinSteamDLCManager:_check_dlc_data(dlc_data)
        if dlc_data.verified then
            return true
        end
        
        return WinSteamDLCManager_check_dlc_data(self, dlc_data)
    end

    managers.mission._fading_debug_output:script().log("Smart Unlocker - Activated", Color.green)
end

dlc_unlocker = dlc_unlocker or function(info)
    function WinSteamDLCManager:_verify_dlcs()
        for _, dlc_data in pairs(Global.dlc_manager.all_dlc_data) do
            dlc_data.verified = true
            dlc_data.owned = true
        end
    end
    
    function WinSteamDLCManager:_check_dlc_data(dlc_data)
        return dlc_data.verified
    end
    
    function GenericDLCManager:can_unlock_dlc(dlc_id)
        return true
    end

    managers.mission._fading_debug_output:script().log("Dlc Unlocker - Activated", Color.green)
end

skin_unlocker = skin_unlocker or function(info)
    local tostring = tostring
    local type = type

    local M_blackmarket = managers.blackmarket
    local weapon_skins = tweak_data.blackmarket.weapon_skins
    local inventory_tradable = M_blackmarket._global.inventory_tradable

    local i = 1
    local j = tostring(i)
    for id, data in pairs( weapon_skins ) do
        while inventory_tradable[j] ~= nil do
            i = i + 1
            j = tostring(i)
        end
        if not M_blackmarket:have_inventory_tradable_item( "weapon_skins", id ) then
            M_blackmarket:tradable_add_item( j, "weapon_skins", id, "mint", true, 1 )
        end
    end

    local convert
    convert = function()
        for inst, data in pairs(inventory_tradable) do
            if type(inst) == "number" then
                inventory_tradable[tostring(inst)] = data
                inventory_tradable[inst] = nil
            end
        end
        convert = nil
    end

    function BlackMarketManager:tradable_update()
        if convert then
            convert()
        end
    end

    local weapon_skins = tweak_data.blackmarket.weapon_skins
    for _, data in pairs(weapon_skins) do
        data.locked = false
    end

    local crafted = managers.blackmarket._global.crafted_items
    for _, cat in pairs({crafted.primaries, crafted.secondaries}) do
        for _, data in pairs(cat) do
            if data.cosmetics then
                data.customize_locked = nil
            end
        end
    end

    for _, safe in pairs(tweak_data.economy.safes) do
        if not safe.market_link then
            safe.market_link = "Fake Link"
        end
    end

    managers.mission._fading_debug_output:script().log("Skin Unlocker - Activated", Color.green)
end

armor_skin_unlocker = armor_skin_unlocker or function(info)
    function BlackMarketManager:_remove_unowned_armor_skin()
        local armor_skins = {}
        Global.blackmarket_manager.armor_skins = armor_skins
        for id, skin in pairs(tweak_data.economy.armor_skins) do
            armor_skins[id] = {unlocked = true}
        end
        return false
    end
    
	managers.mission._fading_debug_output:script().log("Armor Skin Unlocker - Activated", Color.green)
end

call_unlock_all = call_unlock_all or function()
    openmenu(call_unlock_all_options)
end

back_to_main_options = back_to_main_options or function()
    openmenu(mymenu)
end

unlock_all_options = unlock_all_options or 
	{
		{},
		{ text = "Unlock All Inventory Slots", callback = unlock_all_inventory_slots },
		{ text = "Unlock All Items", callback = unlock_all_items },
		{ text = "Smart Unlocker", callback = smart_unloker },
		{ text = "Dlc Unlocker", callback = dlc_unlocker },
		{ text = "Skin Unlocker", callback = skin_unlocker },
		{ text = "Armor Skin Unlocker", callback = armor_skin_unlocker },
		{},
		{ text = "Back", callback = back_to_main_options},
		{ text = "Cancel", is_cancel_button = true, is_focused_button = true },
	}
call_unlock_all_options = call_unlock_all_options or SimpleMenu:new("Payday 2 Trainer By AntonisK", "Unlock All Options", unlock_all_options)