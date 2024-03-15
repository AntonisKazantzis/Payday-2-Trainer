local key = ModPath .. "	" .. RequiredScript
if _G[key] then return else _G[key] = true end

local ChatManager_send_message = ChatManager.send_message

function ChatManager:send_message(channel_id, ...)
	if channel_id ~= ChatManager.GAME then
        return
    end
    
    ChatManager_send_message(self, channel_id, ...)
end