if not CarryStackerSetupDone then
    CarryStackerSetupDone = true

    if managers and managers.player and IntimitateInteractionExt and CarryInteractionExt then
        managers.player.carry_stack = {}
        managers.player.carrystack_lastpress = 0
        managers.player.drop_all_bags = false

        ofuncs = {
            managers_player_set_carry = managers.player.set_carry,
            managers_player_drop_carry = managers.player.drop_carry,
            IntimitateInteractionExt__interact_blocked = IntimitateInteractionExt._interact_blocked
        }

        function managers.player:refresh_stack_counter()
            local count = #self.carry_stack + (self:is_carrying() and 1 or 0)

            managers.hud:remove_special_equipment("carrystacker")

            if count > 0 then
                managers.hud:add_special_equipment({
                    id = "carrystacker",
                    icon = BagIcon,
                    amount = count
                })
            end
        end

        function managers.player:rotate_stack(dir)
            if #managers.player.carry_stack < 1 or (#managers.player.carry_stack < 2 and not self:is_carrying()) then
                return
            end

            if self:is_carrying() then
                table.insert(self.carry_stack, self:get_my_carry_data())
            end

            if dir == "up" then
                table.insert(self.carry_stack, 1, table.remove(self.carry_stack))
            else
                table.insert(self.carry_stack, table.remove(self.carry_stack, 1))
            end

            local cdata = table.remove(self.carry_stack)

            if cdata then
                if self:is_carrying() then
                    self:carry_discard()
                end

                ofuncs.managers_player_set_carry(self, cdata.carry_id, cdata.multiplier, cdata.dye_initiated,
                    cdata.has_dye_pack, cdata.dye_value_multiplier, cdata.zipline_unit)
            end
        end

        function managers.player:drop_carry(zipline_unit)
            ofuncs.managers_player_drop_carry(self, zipline_unit)

            if #self.carry_stack > 0 then
                local cdata = table.remove(self.carry_stack)

                if cdata then
                    self:set_carry(cdata.carry_id, cdata.multiplier or 1, cdata.dye_initiated, cdata.has_dye_pack,
                        cdata.dye_value_multiplier, cdata.zipline_unit)
                end
            end

            self:refresh_stack_counter()

            if self.drop_all_bags then
                if #self.carry_stack > 0 or self:is_carrying() then
                    self:drop_carry()
                end

                self.drop_all_bags = false
            end
        end

        function managers.player:set_carry(carry_id, carry_multiplier, dye_initiated, has_dye_pack,
            dye_value_multiplier, zipline_unit)

            if self:is_carrying() and self:get_my_carry_data() then
                table.insert(self.carry_stack, self:get_my_carry_data())
            end

            ofuncs.managers_player_set_carry(self, carry_id, carry_multiplier, dye_initiated, has_dye_pack,
                dye_value_multiplier, zipline_unit)

            self:refresh_stack_counter()
        end

        function managers.player:carry_discard()
            managers.hud:remove_teammate_carry_info(HUDManager.PLAYER_PANEL)
            managers.hud:temp_hide_carry_bag()

            self:update_removed_synced_carry_to_peers()

            if self._current_state == "carry" then
                managers.player:set_player_state("standard")
            end
        end

        function IntimitateInteractionExt:_interact_blocked(player)
            if self.tweak_data == "corpse_dispose" then
                if not managers.player:has_category_upgrade("player", "corpse_dispose") then
                    return true
                end

                return not managers.player:can_carry("person")
            end

            return ofuncs.IntimitateInteractionExt__interact_blocked(self, player)
        end

        function CarryInteractionExt:_interact_blocked(player)
            return not managers.player:can_carry(self._unit:carry_data():carry_id())
        end

        function CarryInteractionExt:can_select(player)
            return CarryInteractionExt.super.can_select(self, player)
        end

        function managers.player:carry_stacker()
            if _debugEnabled then
                io.stderr:write("current stack size: " .. tostring(#managers.player.carry_stack) .. "\n")

                if #managers.player.carry_stack > 0 then
                    for _, v in pairs(managers.player.carry_stack) do
                        io.stderr:write("item: " .. v.carry_id .. "\n")
                    end
                end
            end

            local cdata = self:get_my_carry_data()

            if self:is_carrying() and cdata then
                table.insert(self.carry_stack, self:get_my_carry_data())

                self:carry_discard()

                managers.hud:present_mid_text({
                    title = "Carry Stack",
                    text = cdata.carry_id .. " Pushed",
                    time = 1
                })
            elseif #self.carry_stack > 0 then
                cdata = table.remove(self.carry_stack)

                self:set_carry(cdata.carry_id, cdata.multiplier, cdata.dye_initiated, cdata.has_dye_pack,
                    cdata.dye_value_multiplier, cdata.zipline_unit)

                managers.hud:present_mid_text({
                    title = "Carry Stack",
                    text = cdata.carry_id .. " Popped",
                    time = 1
                })
            else
                managers.hud:present_mid_text({
                    title = "Carry Stack",
                    text = "Empty",
                    time = 1
                })
            end
            if (Application:time() - self.carrystack_lastpress) < 0.3 and (self:is_carrying() or #self.carry_stack > 0) then

                self.drop_all_bags = true

                self:drop_carry()
            end
            self.carrystack_lastpress = Application:time()

            self:refresh_stack_counter()
        end

    end

end
