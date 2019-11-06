local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
SBclient = Tunnel.getInterface("vn_scoreboard","vn_scoreboard")
vRPclient = Tunnel.getInterface("vRP","vn_scoreboard")
vRP = Proxy.getInterface("vRP")

AddEventHandler("vRP:playerLeave",function(user_id, source) 
  TriggerClientEvent("wrp:playerlist",-1,user_id,{nil,nil,nil})
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
  if first_spawn then
    local users = vRP.getUsers({})
    for k,v in pairs(users) do
      vRP.getUserIdentity({k, function(identity)
        TriggerClientEvent("wrp:playerlist",-1,k,{v,identity.firstname.." "..identity.name,vRP.getUserGroupByType({k,"job"})})
      end})
    end
  end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype) 
  if gtype == "job" then
    vRP.getUserIdentity({user_id, function(identity)
      TriggerClientEvent("wrp:playerlist",-1,user_id,{vRP.getUserSource({user_id}),identity.firstname.." "..identity.name,group})
    end})
  end
end)