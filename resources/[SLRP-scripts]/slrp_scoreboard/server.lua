local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
SBclient = Tunnel.getInterface("htn_scoreboard","htn_scoreboard")
vRPclient = Tunnel.getInterface("vRP","htn__scoreboard")
vRP = Proxy.getInterface("vRP")

local onlinePlayers = GetNumPlayerIndices()

AddEventHandler("vRP:playerLeave",function(user_id, source) 
  TriggerClientEvent("htn_scoreboard",-1,user_id,{nil,nil,nil})
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
  if first_spawn then
    local users = vRP.getUsers({})
    for k,v in pairs(users) do
      vRP.getUserIdentity({k, function(identity)
        TriggerClientEvent("wn:playerlist",-1,k,{v,identity.firstname.." "..identity.name,vRP.getUserGroupByType({k,"job"})})
      end})
    end
  end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype) 
  if gtype == "job" then
    vRP.getUserIdentity({user_id, function(identity)
      TriggerClientEvent("wn:playerlist",-1,user_id,{vRP.getUserSource({user_id}),identity.firstname.." "..identity.name,group})
    end})
  end
end)