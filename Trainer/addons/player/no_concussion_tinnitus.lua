Hooks:PreHook(PlayerDamage,"update","nomoretinnitus",function(self,unit,t,dt)
	if self._concussion_data then
	self._concussion_data.intensity = (self._concussion_data.end_t - t) / self._concussion_data.duration

		if self._concussion_data.intensity <= 0 then
			self:_stop_concussion()
		else
			SoundDevice:set_rtpc("downed_state_progression", self._concussion_data.intensity * 100)
		end
		
	end
	
end)

function PlayerDamage:_start_concussion(mul)
--for criminal concussion grenades

	if self._concussion_data then
		self._concussion_data.intensity = mul
		local duration_tweak = tweak_data.projectiles.concussion.duration
		self._concussion_data.duration = duration_tweak.min + mul * math.lerp(duration_tweak.additional - 2, duration_tweak.additional + 2, math.random())
		self._concussion_data.end_t = managers.player:player_timer():time() + self._concussion_data.duration

		SoundDevice:set_rtpc("downed_state_progression", self._concussion_data.intensity * 100)
		--use a nice sound muffle instead of the ringing and echo

--formerly used "concussion_effect" which has those god-awful sfx
	else
		local duration = 4 + mul * math.lerp(8, 12, math.random())
		self._concussion_data = {
			intensity = mul,
			duration = duration,
			end_t = managers.player:player_timer():time() + duration
		}
	end

--	normally plays "concussion_player_disoriented_sfx" for tinnitus ringing
--	normally plays "concussion_effect_on" for sound duplication
end


function PlayerDamage:_start_tinnitus(sound_eff_mul, skip_explosion_sfx)
	--for cop flashbangs
	if self._tinnitus_data then
		if sound_eff_mul < self._tinnitus_data.intensity then
			return
		end

		self._tinnitus_data.intensity = sound_eff_mul
		self._tinnitus_data.duration = 4 + sound_eff_mul * math.lerp(8, 12, math.random())
		self._tinnitus_data.end_t = managers.player:player_timer():time() + self._tinnitus_data.duration

		if self._tinnitus_data.snd_event then
			self._tinnitus_data.snd_event:stop()
		end

		SoundDevice:set_rtpc("downed_state_progression", math.max(self._downed_progression or 0, self._tinnitus_data.intensity * 100))
--normally plays "tinnitus_beep", ain't having none of that
	else
		local duration = 4 + sound_eff_mul * math.lerp(8, 12, math.random())

		SoundDevice:set_rtpc("downed_state_progression", math.max(self._downed_progression or 0, sound_eff_mul * 100))

		self._tinnitus_data = {
			intensity = sound_eff_mul,
			duration = duration,
			end_t = managers.player:player_timer():time() + duration
--normally plays "tinnitus_beep"
		}
	end

	if not skip_explosion_sfx then
		self._unit:sound():play("flashbang_explode_sfx_player")
	end
end