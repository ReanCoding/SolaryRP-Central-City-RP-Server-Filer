local items = {}

-- Kikkert Menu
local kikkert_choices = {}
kikkert_choices[">Brug kikkert"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"kikkert",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_BINOCULARS"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Cigaret Menu
local ryge_choices = {}
ryge_choices[">Ryg cigaret"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"cigaret",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_SMOKING"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Hammer Menu
local hammer_choices = {}
hammer_choices[">Brug hammer"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"hammer",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_HAMMERING"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Kamera Menu
local kamera_choices = {}
kamera_choices[">Brug kamera"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"kamera",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_PAPARAZZI"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Fiskestang Menu
local fiske_choices = {}
fiske_choices[">Brug fiskestang"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"fiskestang",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_STAND_FISHING"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Guitar Menu
local guitar_choices = {}
guitar_choices[">Brug guitar"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"guitar",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_MUSICIAN"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Kort Menu
local kort_choices = {}
kort_choices[">Brug kort"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"kort",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_TOURIST_MAP"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Øl Menu
local ol_choices = {}
ol_choices[">Drik øl"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"ol",1) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_PARTYING"},false})
      vRP.closeMenu(player)
    end
  end
end}

-- Sæt strips på nærmeste person
--local strips_choices = {}
--strips_choices[">Brug strips"] = {function(player,choice)
 --vRPclient.getNearestPlayer(player,{2},function(nplayer)
  --local nuser_id = vRP.getUserId({nplayer})
  --if nuser_id == nil then
    --if vRP.tryGetInventoryItem(user_id,"strips",1) then
      --vRPclient.playAnim(player,{false,{task="random@arrests"},false}) 
      --vRPclient.toggleHandcuff(nplayer,{})
      --local user_id = vRP.getUserId({player})
        --vRP.closeMenu({nplayer})
    --else 
      --TriggerClientEvent("pNotify:SendNotification", player,{text = "Ingen spiller i nærheden!", type = "error", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
      --end
    --end
  --end)
--end}

items["kikkert"] = {"Kikkert","En kikkert er et instrument til at se genstande på lang afstand.",function(args) return kikkert_choices end,0.3}
items["cigaret"] = {"Cigaret","En vanedannende cigaret.",function(args) return ryge_choices end,0.01}
items["hammer"] = {"Hammer","En håndværker hammer. Til fx. Tømrearbejde.",function(args) return hammer_choices end,0.4}
items["kamera"] = {"Kamera","Et godt kamera der tager gode billeder.",function(args) return kamera_choices end,0.2}
items["fiskestang"] = {"Fiskestang","En fiskestang til at fiske med.",function(args) return fiske_choices end,1,2}
items["guitar"] = {"Guitar","En guitar, giver du koncert?",function(args) return guitar_choices end,1}
items["kort"] = {"Kort","Kan du ikke finde vej?",function(args) return kort_choices end,0.1}
items["ol"] = {"Øl","En kold øl",function(args) return ol_choices end,0.25}
--items["strips"] = {"Strips","Strips, et godt redskab.",function(args) return strips_choices end,0.1}



return items