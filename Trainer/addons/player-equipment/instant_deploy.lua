toggleInstantDeploy = not toggleInstantDeploy

local PlayerManager_selected_equipment_deploy_timer = PlayerManager.selected_equipment_deploy_timer

if toggleInstantDeploy then
    function PlayerManager:selected_equipment_deploy_timer()
        return 0.1
    end

    managers.mission._fading_debug_output:script().log('Instant Equipment Deploy - Activated', Color.green)
else
    function PlayerManager:selected_equipment_deploy_timer()
        PlayerManager_selected_equipment_deploy_timer(self)
    end

    managers.mission._fading_debug_output:script().log('Instant Deploy - Deactivated', Color.red)
end
