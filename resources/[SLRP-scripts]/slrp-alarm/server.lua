local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_canc")


RegisterServerEvent('dispatch')
AddEventHandler('dispatch', function(x,y,z,message)
	local players = {}
	local users = vRP.getUsers({})
	local isPolice = false
	local isEMS = false

    for k,v in pairs(users) do
    	
      	local player = vRP.getUserSource({k})
      	
      	if player ~= nil then
      		local user_id = vRP.getUserId({player})

      		isPolice = vRP.hasGroup({user_id,"Politi-Job"})
      		isEMS = vRP.hasGroup({user_id,"EMS-Job"})

	      	if isPolice or isEMS then
	      		table.insert(players,player)
	      	end
      	end
	end

	for k,v in pairs(players) do
  		TriggerClientEvent('notifyDispatch', v, x,y,z,message)
    end
end)
RegisterServerEvent('dispatch2')
AddEventHandler('dispatch2', function(x,y,z,message)
  local players = {}
  local users = vRP.getUsers({})
  local isPolice = false

    for k,v in pairs(users) do
      
        local player = vRP.getUserSource({k})
        
        if player ~= nil then
          local user_id = vRP.getUserId({player})

          isPolice = vRP.hasGroup({user_id,"Politi-Job"})

          if isPolice then
            table.insert(players,player)
          end
        end
  end

  for k,v in pairs(players) do
      TriggerClientEvent('notifyDispatch', v, x,y,z,message)
    end
end)
RegisterServerEvent('dispatchAdmin')
AddEventHandler('dispatchAdmin', function(x,y,z,message)
  local players = {}
  local users = vRP.getUsers({})
  local isStaff = false

    for k,v in pairs(users) do
      
        local player = vRP.getUserSource({k})
        
        if player ~= nil then
          local user_id = vRP.getUserId({player})

          isStaff = vRP.hasGroup({user_id,"moderator"})

          if isStaff then
            table.insert(players,player)
          end
        end
  end

  for k,v in pairs(players) do
      TriggerClientEvent('notifyDispatch', v, x,y,z,message)
    end
end)