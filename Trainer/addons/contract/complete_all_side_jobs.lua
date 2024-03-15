complete_all_side_jobs = complete_all_side_jobs or function(info)
    local CustomSafehouseManager_set_active_daily = CustomSafehouseManager.set_active_daily

    function CustomSafehouseManager:set_active_daily(id)
        if self:get_daily_challenge() and self:get_daily_challenge().id ~= id then
            self:generate_daily(id)
        end

        self:complete_and_reward_daily(id)
    end

    function CustomSafehouseManager:has_rewarded_daily()
        local is_just_completed = false

        for i, trophy in ipairs(self._global.completed_trophies) do
            if trophy.type == "daily" then
                is_just_completed = true
            end
        end

        return self:_get_daily_state() == "rewarded" and is_just_completed
    end

    local ChallengeManager_activate_challenge = ChallengeManager.activate_challenge

    function ChallengeManager:activate_challenge(id, key, category)
        if self:has_active_challenges(id, key) then
            local challenge = self:get_challenge(id, key)
            challenge.completed = true
            challenge.rewarded = true
            challenge.category = category
            self._global.active_challenges[key or Idstring(id):key()] = challenge

            return true
        end

        return ChallengeManager_activate_challenge(self, id, key, category)
    end

    local SideJobEventManager_load = SideJobEventManager.load

    function SideJobEventManager:load(cache, version)
        local state = cache[self.save_table_name]
        if state and state.version == self.save_version then
            for _, saved_challenge in ipairs(state.challenges or {}) do
                saved_challenge.completed = true
            end
        end
        return SideJobEventManager_load(self, cache, version)
    end

    local EventManager_load = EventManager.load

    if event_missions then
        function EventManager:load(cache, version)
            local state = cache[self.save_table_name]
            if state and state.version == self.save_version then
                for _, saved_challenge in ipairs(state.challenges or {}) do
                    saved_challenge.completed = true
                end
            end
            return EventManager_load(self, cache, version)
        end
    end

    local TangoManager_load = TangoManager.load

    function TangoManager:load(cache, version)
        local state = cache.Tango
        if state and state.version == TangoManager.SAVE_DATA_VERSION then
            for _, saved_challenge in ipairs(state.challenges or {}) do
                saved_challenge.completed = true
            end
        end
        return TangoManager_load(self, cache, version)
    end

    local SideJobGenericDLCManager_load = SideJobGenericDLCManager.load

    function SideJobGenericDLCManager:load(cache, version)
        local state = cache[self.save_table_name]
        if state and state.version == self.save_version then
            for _, saved_challenge in ipairs(state.challenges or {}) do
                saved_challenge.completed = true
            end
        end
        return SideJobGenericDLCManager_load(self, cache, version)
    end
end
