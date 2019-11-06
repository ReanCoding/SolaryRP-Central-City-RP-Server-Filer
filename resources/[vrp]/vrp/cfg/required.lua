
local items = {}

items["medkit"] = {"Førstehjælpskasse","Bruges til at genoplive folk.",nil,0.5}
items["dirty_money"] = {"Sorte penge","Sorte tjente penge.",nil,0}
items["repairkit"] = {"Værktøjskasse","Bruges til at reparerer køretøjer.",nil,0.5}
items["hampblade"] = {"Hampblade", "Bruges til at fremstille joints", nil, 0.01} -- no choices
items["fersken"] = {"Fersken", "Du kan sælge dem", nil, 0.01} -- no choices
items["kokainblade"] = {"Kokainblade", "Kan laves til Kokain", nil, 0.10} -- no choices
items["guldore"] = {"Guldmalm", "Kan laves til Guldbar", nil, 7.0} -- no choices
items["guldbar"] = {"Guldbar", "Kan sælges", nil, 5.0} -- no choices
items["træstykke"] = {"Træstykke", "Kan laves om til planker", nil, 10.0} -- no choices
items["planke"] = {"Planke", "Kan sælges", nil, 3.0} -- no choices
items["joints"] = {"Joints", "Kan ryges og sælges", nil, 0.01} -- no choices
items["kokain"] = {"Kokain", "Du kan sælge det", nil, 0.01} -- no choices
items["opium"] = {"Opium", "Du kan lave det til Morphine", nil, 0.5} -- no choices
items["morphine"] = {"Morphine", "Du kan lave det til Heroin", nil, 0.5} -- no choices
items["heroin"] = {"Heroin", "Du kan sælge det", nil, 0.5} -- no choices
items["diamantore"] = {"Kul", "Du kan lave det til diamanter", nil, 5.0} -- no choices
items["diamant"] = {"Diamant", "Du kan sælge det", nil, 2.0} -- no choices
items["jointpapir"] = {"Jointpapir", "Du kan bruge det til at lave joints", nil, 0.01} -- no choices
items["brugde"] = {"Brugde", "Du kan sælge den", nil, 30.0} -- no choices
items["fisk"] = {"Fisk", "Du kan sælge det", nil, 0.5} -- no choices
items["olie"] = {"Olie", "Du kan sælge det", nil, 2.0} -- no choices
items["syre"] = {"Syre", "Kan laves til LSD", nil, 0.01} -- no choices items
items["lsd"] = {"LSD", "Du kan sælge det", nil, 0.01} -- no choices
items["ecstasy"] = {"Ecstasy", "Du kan sælge det", nil, 0.10} -- no choices
items["mdma"] = {"MDMA", "Du kan lave det til Ecstasy", nil, 0.50} -- no choices
items["opium"] = {"Opium", "En plante du kan udvinde stoffer fra", nil, 0.01} -- no choices
items["syre_anhydrid"] = {"Anhydrid Syre", "Materiale til at udvinde stoffer", nil, 0.01} -- no choices items
items["kloroform"] = {"Kloroform", "Materiale til at udvinde stoffer", nil, 0.01} -- no choices
items["sodium"] = {"Sodium", "Materiale til at udvinde stoffer", nil, 0.01} -- no choices
items["heroin"] = {"Heroin", "En stof du kan sælge", nil, 0.01} -- no choices
items["morfin"] = {"Morfin", "Et stof du kan udvinde heroin med", nil, 0.01} -- no choices
items["kanyle"] = {"Kanyle", "En kanyle du kan fylde heroin med", nil, 0.01} -- no choices
--WEAPONS--
items["løb"] = {"Løb","Løb til en Pistol50",nil,0.5}
items["skæfte"] = {"Skæfte","Skæfte til en Pistol50",nil,0.5}
items["aftrækker"] = {"Aftrækker","Aftrækker til en Pistol50",nil,0.1}
items["hovedbolt"] = {"Hovedbolt","Hovedbolt til en Pistol50",nil,1.0}
items["skudhylster"] = {"Skudhylster","Skudhylster til en Pistol50",nil,0.1}


-- money
items["money"] = {"Money","Packed money.",function(args)
  local choices = {}
  local idname = args[1]

  choices["Unpack"] = {function(player,choice,mod)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      local amount = vRP.getInventoryItemAmount(user_id, idname)
      vRP.prompt(player, "How much to unpack ? (max "..amount..")", "", function(player,ramount)
        ramount = parseInt(ramount)
        if vRP.tryGetInventoryItem(user_id, idname, ramount, true) then -- unpack the money
          vRP.giveMoney(user_id, ramount)
          vRP.closeMenu(player)
        end
      end)
    end
  end}

  return choices
end,0}

-- money binder
items["money_binder"] = {"Money binder","Used to bind 1000$ of money.",function(args)
  local choices = {}
  local idname = args[1]

  choices["Bind money"] = {function(player,choice,mod) -- bind the money
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      local money = vRP.getMoney(user_id)
      if money >= 1000 then
        if vRP.tryGetInventoryItem(user_id, idname, 1, true) and vRP.tryPayment(user_id,1000) then
          vRP.giveInventoryItem(user_id, "money", 1000, true)
          vRP.closeMenu(player)
        end
      else
        vRPclient.notify(player,{vRP.lang.money.not_enough()})
      end
    end
  end}

  return choices
end,0}

-- parametric weapon items
-- give "wbody|WEAPON_PISTOL" and "wammo|WEAPON_PISTOL" to have pistol body and pistol bullets

local get_wname = function(weapon_id)
  local name = string.gsub(weapon_id,"WEAPON_","")
  name = string.upper(string.sub(name,1,1))..string.lower(string.sub(name,2))
  -- lang translation support, ex: weapon.pistol = "Pistol", by default use the native name
  return vRP.lang.weapon[string.lower(name)]({}, name)
end

--- weapon body
local wbody_name = function(args)
  return get_wname(args[2]).." body"
end

local wbody_desc = function(args)
  return ""
end

local wbody_choices = function(args)
  local choices = {}
  local fullidname = joinStrings(args,"|")

  choices["Udstyr"] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      if vRP.tryGetInventoryItem(user_id, fullidname, 1, true) then -- give weapon body
        local weapons = {}
        weapons[args[2]] = {ammo = 0}
        vRPclient.giveWeapons(player, {weapons})

        vRP.closeMenu(player)
      end
    end
  end}

  return choices
end

local wbody_weight = function(args)
  return 0.75
end

items["wbody"] = {wbody_name,wbody_desc,wbody_choices,wbody_weight}

--- weapon ammo
local wammo_name = function(args)
  return get_wname(args[2]).." ammo"
end

local wammo_desc = function(args)
  return ""
end

local wammo_choices = function(args)
  local choices = {}
  local fullidname = joinStrings(args,"|")

  choices["Lad"] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      local amount = vRP.getInventoryItemAmount(user_id, fullidname)
      vRP.prompt(player, "Ammo der skal lades (max "..amount..")", "", function(player,ramount)
        ramount = parseInt(ramount)

        vRPclient.getWeapons(player, {}, function(uweapons)
          if uweapons[args[2]] ~= nil then -- check if the weapon is equiped
            if vRP.tryGetInventoryItem(user_id, fullidname, ramount, true) then -- give weapon ammo
              local weapons = {}
              weapons[args[2]] = {ammo = ramount}
              vRPclient.giveWeapons(player, {weapons,false})
              vRP.closeMenu(player)
            end
          end
        end)
      end)
    end
  end}

  return choices
end

local wammo_weight = function(args)
  return 0.01
end

items["wammo"] = {wammo_name,wammo_desc,wammo_choices,wammo_weight}

return items
