if not orig_is_dlc_unlocked then orig_is_dlc_unlocked = GenericDLCManager.is_dlc_unlocked end

function GenericDLCManager:is_dlc_unlocked(dlc)
	if dlc == 'pd2_clan' then
		return true
	end
	return orig_is_dlc_unlocked(self, dlc)
end