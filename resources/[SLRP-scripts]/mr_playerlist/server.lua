local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
SBclient = Tunnel.getInterface("mr_playerlist","mr_playerlist")
vRPclient = Tunnel.getInterface("vRP","mr_playerlist")
vRP = Proxy.getInterface("vRP")

AddEventHandler("vRP:playerLeave",function(user_id, source) 
  TriggerClientEvent("mr:playerlist",-1,user_id,{nil,nil,nil})
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
  if first_spawn then
    local users = vRP.getUsers({})
    for k,v in pairs(users) do
      vRP.getUserIdentity({k, function(identity)
        TriggerClientEvent("mr:playerlist",-1,k,{v,identity.firstname.." "..identity.name,vRP.getUserGroupByType({k,"job"})})
      end})
    end
  end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype) 
  if gtype == "job" then
    vRP.getUserIdentity({user_id, function(identity)
      TriggerClientEvent("mr:playerlist",-1,user_id,{vRP.getUserSource({user_id}),identity.firstname.." "..identity.name,group})
    end})
  end
end)

RegisterServerEvent("vRP:proxys")
AddEventHandler("vRP:proxys", function()
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  vRP.getUserIdentity({user_id, function(identity)
  TriggerClientEvent('proximityMessage', -1, user_id, "", {255, 153, 0}, 20, "** Du føler, at du blev kigget på **")
  end})
end)