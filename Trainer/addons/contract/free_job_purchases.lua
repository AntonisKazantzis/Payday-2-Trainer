function MoneyManager:get_cost_of_premium_contract(job_id, difficulty) return 0 end
function MoneyManager:on_buy_mission_asset( asset_id ) return 1 end 
function MoneyManager:get_mission_asset_cost() return 1 end 
function MoneyManager:get_mission_asset_cost_by_stars( stars ) return 1 end 
function MoneyManager:get_mission_asset_cost_by_id( id ) return 1 end