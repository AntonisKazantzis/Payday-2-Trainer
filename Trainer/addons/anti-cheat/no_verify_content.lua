function PlayerManager:verify_carry(peer, carry_id) return true end 
function PlayerManager:verify_equipment(peer_id, equipment_id) return true end
function PlayerManager:verify_grenade(peer_id) return true end
function NetworkPeer:begin_ticket_session() return true end
function NetworkPeer:on_verify_ticket() end
function NetworkPeer:end_ticket_session() end
function NetworkPeer:change_ticket_callback() end
function NetworkPeer:verify_job() end 
function NetworkPeer:verify_character() end 
function NetworkPeer:verify_bag() return true end
function NetworkPeer:verify_outfit() end 
function NetworkPeer:_verify_outfit_data() end
function NetworkPeer:_verify_cheated_outfit() end
function NetworkPeer:_verify_content() return true end
function NetworkPeer:tradable_verify_outfit() end
function NetworkPeer:on_verify_tradable_outfit() end