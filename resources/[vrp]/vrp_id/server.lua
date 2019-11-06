local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local cfg = module("vrp_id", "cfg/blips")
vRP = {}
IDDclient = Tunnel.getInterface("vrp_id","vrp_id")
vRPclient = Tunnel.getInterface("vRP","vrp_id")
Tunnel.bindInterface("vrp_id",vRP)
Proxy.addInterface("vrp_id",vRP)
vRP = Proxy.getInterface("vRP")

AddEventHandler("vRP:playerLeave",function(user_id, source) 
	local users = vRP.getUsers({})
	for k,v in pairs(users) do
	  IDDclient.removeUser(v,{user_id})
	  IDDclient.removeBlip(v,{user_id})
	end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn) 
	local users = vRP.getUsers({})
	local job = vRP.getUserGroupByType({user_id,"job"})
	local team = vRP.getUserTeamByGroup(user_id,job)
	
	for k,v in pairs(users) do
	  IDDclient.insertUser(source,{k,v})
	  IDDclient.insertUser(v,{user_id,source})
	  	  
	  local ujob = vRP.getUserGroupByType({k,"job"})
	  local uteam = vRP.getUserTeamByGroup(k,ujob)
	
	  IDDclient.insertBlip(source,{k,v,ujob,uteam})
	  IDDclient.insertBlip(v,{user_id,source,job,team})
	end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
	if gtype == "job" then
	  local player = vRP.getUserSource({user_id})
	  local users = vRP.getUsers({})
	  local job = vRP.getUserGroupByType({user_id,"job"})
	  local team = vRP.getUserTeamByGroup(user_id,job)
	
	  for k,v in pairs(users) do
	    local ujob = vRP.getUserGroupByType({k,"job"})
	    local uteam = vRP.getUserTeamByGroup(k,ujob)
	
	    IDDclient.insertBlip(player,{k,v,ujob,uteam})
	    IDDclient.insertBlip(v,{user_id,player,job,team})
	  end
	end
end)

AddEventHandler("vRP:playerLeaveGroup", function(user_id, group, gtype)
	if gtype == "job" then
	  local users = vRP.getUsers({})
	  for k,v in pairs(users) do
	    IDDclient.removeBlip(v,{user_id})
	  end
	end
end)

function vRP.getUserTeamByGroup(user_id,group)
  for k,v in pairs(cfg.teams) do
	for l,w in pairs(v) do
	  if group == w then
	    return k
	  end
	end
  end
  return nil
end