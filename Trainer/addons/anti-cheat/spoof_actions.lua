local look_while_interacting = false
local toggle_interaction = false
 
function PlayerStandard:_check_action_interact(t, input)
	local new_action, timer, interact_object
	local interaction_wanted = input.btn_interact_press
	if toggle_interaction then
		if input.btn_interact_press and self:_interacting() then
			self:_interupt_action_interact()
			return false
		elseif input.btn_interact_release then
			return false
		end
	end
	if interaction_wanted then
		local action_forbidden = self:chk_action_forbidden("interact")
		or self._unit:base():stats_screen_visible()
		or self._ext_movement:has_carry_restriction()
		or self:_is_throwing_grenade()
		or self:_on_zipline()
		if not action_forbidden then
			new_action, timer, interact_object = managers.interaction:interact(self._unit)
			if new_action then
				self:_play_interact_redirect(t, input)
			end
			if timer then
				new_action = true
					if not look_while_interacting then
						self._ext_camera:camera_unit():base():set_limits(80, 50)
					end
				self:_start_action_interact(t, input, timer, interact_object)
			end
			new_action = new_action or self:_start_action_intimidate(t)
		end
	end
	if input.btn_interact_release then
		self:_interupt_action_interact()
	end
	return new_action
end
 
local _check_use_item_original = PlayerStandard._check_use_item
 
function PlayerStandard:_check_use_item(t, input, ...)
	_check_use_item_original(self, t, input, ...)
	local new_action
	local action_wanted = input.btn_use_item_press
	if action_wanted then
		local action_forbidden = self._use_item_expire_t
		or self:_interacting()
		or self:_is_throwing_grenade()
		or self:_is_meleeing()
		if not action_forbidden and managers.player:can_use_selected_equipment(self._unit) then
			self:_start_action_use_item(t)
			new_action = true
		end
	end
end