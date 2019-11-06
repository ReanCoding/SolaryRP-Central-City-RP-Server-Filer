local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vrpMySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_combatlog")

vRPmask = {}
Tunnel.bindInterface("vRP_combatlog",vRPmask)
Proxy.addInterface("vRP_combatlog",vRPmask)
vRPvRPmask = Tunnel.getInterface("vRP_combatlog","vRP_combatlog")


-- Sätt på/ta av ögonbindel
RegisterServerEvent('jsfour-blindfold')
AddEventHandler('jsfour-blindfold', function( player, hasItem )
  local src = source
  TriggerClientEvent('jsfour-blindfold', player, hasItem, src)
end)

-- Notis skickas om spelaren inte har en ögonbindel
RegisterServerEvent('jsfour-blindfold:notis')
AddEventHandler('jsfour-blindfold:notis', function( src )
  TriggerClientEvent('esx:showNotification', src, 'Du har ikke en sæk på dig..')
end)

-- Ger spelaren en ögonbindel
RegisterServerEvent('jsfour-blindfold:giveItem')
AddEventHandler('jsfour-blindfold:giveItem', function( src )
  local user_id = vRP.getUserId({src})
  vRP.giveInventoryItem({user_id,"sæk",1,true})
end)

function vRPmask.hasMaskItem(src)
  local user_id = vRP.getUserId({src})
  if vRP.tryGetInventoryItem({user_id,"sæk",1,true}) then
    return true
  else
    return false
  end
end

vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
	
    choices["Sæt en sæk på den nærmeste spiller"] = {function(player,choices)
      TriggerClientEvent("jsfour-blindfold", true, source)
    end}
    
		add(choices)
	end
end})