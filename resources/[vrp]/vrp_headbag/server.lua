local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vrpMySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_atm")

function vRP.hasInventoryItem(user_id, idname)
    local count = vRP.getInventoryItemAmount({user_id, idname})
    if count > 0 then
        return true
    else
        return false
    end
end

vRP.registerMenuBuilder({"main", function(add, data)
    local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
	
		if vRP.hasInventoryItem(user_id,"pose") then
			choices["Tag sæk på/af nærmeste spiller"] = {function(player,choice)
                vRPclient.getNearestPlayer(player,{5},function(nplayer)
                    if nplayer ~= nil then
                        if vRP.tryGetInventoryItem({user_id,"pose",1,true}) then
                            TriggerClientEvent("vrp:putOnBag", nplayer)
                        else
                            vRPclient.notify(player,{"Du skal have en pose!"})
                        end
                    end
                end)
            end}
		end
		add(choices)
	end
end})