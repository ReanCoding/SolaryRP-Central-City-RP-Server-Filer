--[[-----------------
	vRP_doorsControl By XanderWP from Ukraine with <3 - I love you XanderWP, love Hawk from Denmark <3
------------------------]]--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","doorsControl")

doorList = {
  [1] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [2] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [3] = {freeze = true, key = "key_lspd", permission="politi.ledelse.doors", name = "Ledelses Kontor"},
  [4] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [5] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [6] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [7] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [8] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [9] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [10] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [11] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [12] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [13] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [14] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [15] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},

  [16] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [17] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [18] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [19] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [20] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [21] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [22] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [23] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [24] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [25] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [26] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [27] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [28] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [29] = {freeze = true, key = "key_lspd", permission="emergency.key", name = "Hospital"},
  [30] = {freeze = true, key = "key_hvidvask", permission="", name = "Hvidvask"},
  [31] = {freeze = true, key = "key_hvidvask", permission="", name = "Hvidvask"},
  -- Politidøre i Sandy
  [32] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [33] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [34] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [35] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [36] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [37] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [38] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},
  [39] = {freeze = true, key = "key_lspd", permission="police.pc", name = "Politistation"},

  [40] = {freeze = true, key = "key_lspd", permission="court.doors", name = "Retssal", pairs = 41},
  [41] = {freeze = true, key = "key_lspd", permission="court.doors", name = "Retssal", pairs = 40},

  [42] = {freeze = true, key = "key_lspd", permission="stripklubben.doors", name = "Stripklubben"},

  [43] = {freeze = true, key = "key_bandidos", permission="bandidos.doors", name = "HellsAngels"},
}


RegisterServerEvent('door:status')
AddEventHandler('door:status', function(id, status)
  user_id = vRP.getUserId({source})
  player = vRP.getUserSource({user_id})
  if vRP.hasPermission({user_id, "#"..doorList[id].key..".>0"}) or vRP.hasPermission({user_id,doorList[id].permission}) then
    doorList[id].freeze=status
    TriggerClientEvent('door:statusSend', -1, id, status)
    if status then
	  TriggerClientEvent("pNotify:SetQueueMax", -1, "lmao1", 1)
      TriggerClientEvent("pNotify:SendNotification", player,{text = "Døren blev <b style='color: #DB4646'>låst</b>.", type = "error", queue = "lmao1",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})  
    else
	  TriggerClientEvent("pNotify:SetQueueMax", -1, "lmao2", 1)
    TriggerClientEvent("pNotify:SendNotification", player,{text = "Døren blev <b style='color: #4E9350'>låst op</b>.", type = "success", queue = "lmao2",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})  
    end
  else

  TriggerClientEvent("pNotify:SetQueueMax", -1, "lmao", 1)
  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du mangler nøglen til <b style='color: #FFC832'>"..doorList[id].name.."</b>.", type = "error", queue = "lmao",timeout = 1500, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})  
    end 
end)

RegisterServerEvent('door:load')
AddEventHandler('door:load', function(id, status)
  TriggerClientEvent('door:loadSend', -1, doorList) 
end)


local function doorSync() 
TriggerClientEvent('door:loadSend', -1, doorList) 
  SetTimeout(5000, doorSync)
end
doorSync()