-- define some basic inventory items

local items = {}

local function play_eat(player)
  local seq = {
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

local function play_drink(player)
  local seq = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

-- gen food choices as genfunc
-- idname
-- ftype: eat or drink
-- vary_hunger
-- vary_thirst
local function gen(ftype, vary_hunger, vary_thirst)
  local fgen = function(args)
    local idname = args[1]
    local choices = {}
    local act = "Unknown"
    if ftype == "eat" then act = "1: Spis" elseif ftype == "drink" then act = "1: Drik" end
    local name = vRP.getItemName(idname)

    choices[act] = {function(player,choice)
      local user_id = vRP.getUserId(player)
      if user_id ~= nil then
        if vRP.tryGetInventoryItem(user_id,idname,1,false) then
          if vary_hunger ~= 0 then vRP.varyHunger(user_id,vary_hunger) end
          if vary_thirst ~= 0 then vRP.varyThirst(user_id,vary_thirst) end

          if ftype == "drink" then
            TriggerClientEvent("pNotify:SendNotification",player,{text = "Drikker <b style='color:blue'>" ..name.. "</b>",type = "alert", timeout = (3000),layout = "centerLeft"})
            play_drink(player)
          elseif ftype == "eat" then
            TriggerClientEvent("pNotify:SendNotification",player,{text = "Spiser <b style='color:orange'>" ..name.. "</b>",type = "alert", timeout = (3000),layout = "centerLeft"})
            play_eat(player)
          end

          vRP.closeMenu(player)
        end
      end
    end}

    return choices
  end

  return fgen      
 
end

-- DRINKS --

items["water"] = {"Vand flaske","", gen("drink",0,-25),0.1}
items["milk"] = {"Mælk","", gen("drink",0,-5),0.1}
items["coffee"] = {"Kaffe","", gen("drink",0,-10),0.1}
items["tea"] = {"Te","", gen("drink",0,-15),0.1}
items["icetea"] = {"Is Te","", gen("drink",0,-20), 0.1}
items["orangejuice"] = {"Appelsin juice","", gen("drink",0,-25),0.1}
items["gocagola"] = {"Læskedrik","", gen("drink",0,-35),0.1}
items["redgull"] = {"Red Bull","", gen("drink",0,-40),0.1}
items["lemonlimonad"] = {"Limonade","", gen("drink",0,-45),0.1}
items["vodka"] = {"Små Sure","", gen("drink",15,-65),0.1}
items["sodavand"] = {"Stor Sodavand","", gen("drink",0,-25),0.1}

--FOOD

-- create Breed item
items["bread"] = {"Brød","", gen("eat",-10,0),0.1}
items["pizza"] = {"Pizza","", gen("eat",-10,0),0.1}
items["donut"] = {"Donut","", gen("eat",-15,0),0.1}
items["tacos"] = {"Tacos","", gen("eat",-20,0),0.1}
items["sandwich"] = {"Sandwich","A tasty snack.", gen("eat",-25,0),0.1}
items["kebab"] = {"Kebab","", gen("eat",-45,0),0.1}
items["pdonut"] = {"Chokolade donut","", gen("eat",-25,0),0.1}
items["Bigmac"] = {"Big Mac","",gen("eat",-30,0),0.5}
items["cct"] = {"Chili Cheese Tops","",gen("eat",-15,5),0.2}
items["makrel2"] = {"Grillet makrel","",gen("eat",-40,1),1.5}
items["torsk2"] = {"Grillet torsk","",gen("eat",-35,1),2.5}
items["reje2"] = {"Grillet reje","",gen("eat",-10,1),0.09}
items["cheeseburger"] = {"Cheese burger","",gen("eat",-15,1),0.40}
items["brunkager"] = {"brunkager","",gen("eat",-10,1),0.10}
items["pebernødder"] = {"pebernødder","",gen("eat",-10,1),0.10}
items["bedstemors_småkager"] = {"Bedstemors småkager","",gen("eat",-10,1),0.10}


return items
