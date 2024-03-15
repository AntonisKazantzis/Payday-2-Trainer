function trigger_mission_elements(elem_table)
	local player = managers.player:player_unit()
	if not player or not alive(player) then
		return
	end
 
	for _, data in pairs(managers.mission._scripts) do
		for id, element in pairs(data:elements()) do
			for _, elem_id in pairs(elem_table) do
				if id == elem_id then
					if Network:is_server() then
						element:on_executed(player)
					end
				end
			end
		end
	end
end
 
local overdrill = {
	104136, -- 'yes' show the overvault gate and drill.
	104181, -- 'func_sequence_trigger_088' loads the overvault itself and open the drilled gate.
	104189, -- 'dasistcorrectsir' disables the floor button interactions and open the overvault door
	104326  -- 'trigger_area_110' enables the interaction for the 70 gold bars and gives the overdrill achievement to all players that have been there from start of the heist.
}
 
if Global.level_data.level_id == "red2" then
	trigger_mission_elements(overdrill)
end