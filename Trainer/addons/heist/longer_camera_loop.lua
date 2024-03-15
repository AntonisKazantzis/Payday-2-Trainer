toggleLongerCameraLoop = not toggleLongerCameraLoop

if toggleLongerCameraLoop then
 
	local infinite_concurrent_camera_loops = false	-- Set to true if you want infinite camera loops, false otherwise
	local camera_loop_duration_multiplier = 2		-- Set to a multiplier higher than 1 if you want longer camera loop duration
													
	--------------------------------------------------------------------------------------------------------------------------------
	 
	local old_start = old_start or SecurityCamera._start_tape_loop
	function SecurityCamera:_start_tape_loop(tape_loop_t)
		old_start(self, tape_loop_t * camera_loop_duration_multiplier)
		if infinite_concurrent_camera_loops then SecurityCamera.active_tape_loop_unit = nil end
	end

	managers.mission._fading_debug_output:script().log("Longer Camera Loop - Activated", Color.green)
else
	local infinite_concurrent_camera_loops = false	-- Set to true if you want infinite camera loops, false otherwise
	local camera_loop_duration_multiplier = 1		-- Set to a multiplier higher than 1 if you want longer camera loop duration
	 
	local old_start = old_start or SecurityCamera._start_tape_loop
	function SecurityCamera:_start_tape_loop(tape_loop_t)
		old_start(self, tape_loop_t * camera_loop_duration_multiplier)
		if infinite_concurrent_camera_loops then SecurityCamera.active_tape_loop_unit = nil end
	end

	managers.mission._fading_debug_output:script().log("Longer Camera Loop - Deactivated", Color.red)
end