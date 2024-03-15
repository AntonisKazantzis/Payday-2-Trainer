if not ChatManager then return end
ChatManager_feed_system_message = ChatManager_feed_system_message or ChatManager.feed_system_message
function ChatManager:feed_system_message( channel_id, message )
    local _gmatch = {
        managers.localization:text( "menu_chat_peer_cheated_many_assets", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_wrong_equipment_server", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_wrong_equipment", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_equipments_server", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_equipments", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_bags_server", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_bags", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_bags_pickup_server", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_bags_pickup", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_grenades_server", { name = ".*" } ),
        managers.localization:text( "menu_chat_peer_cheated_many_grenades", { name = ".*" } )
    }
    for k,v in pairs(_gmatch) do
        if message:gmatch(v) then return end
    end
    ChatManager_feed_system_message( channel_id, message)
end