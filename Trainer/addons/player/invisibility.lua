function update_invisible_state(state)
    local statetable = {"Standard", "Civilian", "MaskOff", "Clean", "BleedOut", "ParaChuting", "Incapacitated", "Carry",
                        "Arrested"}

    if alive(managers.player:player_unit()) then
        for id, state_table in pairs(statetable) do
            Hooks:Add("Player" .. state_table .. "Update", "UpdateMovState" .. id, function(t, dt)
                self:_upd_attention()
            end)
        end

        managers.player:player_unit():movement():set_attention_settings({state})
    end
end

invisibility = invisibility or false

if not invisibility then
    if HUDManager then
        if not orig then
            orig = HUDManager.update
        end

        function HUDManager:update(t, dt)
            orig(self, t, dt)
            update_invisible_state("pl_civilian")
        end
    end

    managers.mission._fading_debug_output:script().log('Invisibility - Activated', Color.green)
else
    update_invisible_state("pl_mask_on_foe_combatant_whisper_mode_stand")
    update_invisible_state("pl_mask_on_foe_combatant_whisper_mode_crouch")

    if orig then
        HUDManager.update = orig
    end

    managers.mission._fading_debug_output:script().log('Invisibility - Deactivated', Color.red)
end

invisibility = not invisibility
