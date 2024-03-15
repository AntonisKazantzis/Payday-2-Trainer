Hooks:PostHook(PlayerTweakData, "_init_new_stances", "NoOvershotEffectInit", function(self)
	for _, weap in pairs(self.stances) do
		if weap.steelsight.vel_overshot then
			weap.steelsight.vel_overshot.yaw_neg = 0
			weap.steelsight.vel_overshot.yaw_pos = 0
			weap.steelsight.vel_overshot.pitch_neg = 0
			weap.steelsight.vel_overshot.pitch_pos = 0
		end
	end
end)