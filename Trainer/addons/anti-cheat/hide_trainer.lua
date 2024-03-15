local hide_mod_list = {
	["Payday 2 Trainer"] = true,
}

local old_build_list = MenuCallbackHandler.build_mods_list

function MenuCallbackHandler:build_mods_list()
	local mods = {}
	
	if BLT and BLT.Mods and BLT.Mods then
		for _, mod in ipairs(BLT.Mods:Mods()) do
			if not hide_mod_list[mod:GetName()] then table.insert(mods, {mod:GetName(), mod:GetId()}) end
		end
	end
	
	return mods
end