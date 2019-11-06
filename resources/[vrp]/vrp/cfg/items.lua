-- define items, see the Inventory API on github

local cfg = {}

-- see the manual to understand how to create parametric items
-- idname = {name or genfunc, description or genfunc, genfunc choices or nil, weight or genfunc}
-- a good practice is to create your own item pack file instead of adding items here
cfg.items = {
  ["hampblade"] = {"Hampblade", "Ulovligt! Bruges til at fremstille skunk", nil, 0.05}, -- no choices
  ["skunk"] = {"Skunk", "Ulovligt! Kan sælges.", nil, 0.10}, -- no choices
  ["kokainblade"] = {"Kokainblade", "Ulovligt! Bruges til at fremstille kokain", nil, 0.10}, -- no choices
  ["kokain"] = {"Kokain", "Ulovligt! Kan sælges.", nil, 0.10}, -- no choices
  ["syre"] = {"Syre", "Ulovligt! Bruges til at fremstille LSD", nil, 0.10}, -- no choices
  ["lsd"] = {"LSD", "Ulovligt! Kan sælges.", nil, 0.15}, -- no choices
  ["kul"] = {"Kul", "Du kan lave det til diamanter", nil, 3.5}, -- no choices
  ["krudt"] = {"Krudt", "Bruges til at lave ammunition", nil, 0.10}, -- no choices
  ["diamant"] = {"Diamant", "Kan sælges for høj profit", nil, 1.50}, -- no choices
  ["guldmalm"] = {"Guldmalm", "Kan laves til guldbarre", nil, 5.00}, -- no choices
  ["guldbar"] = {"Guldbar", "Kan sælges for profit", nil, 2.50}, -- no choices
  ["jern"] = {"Jern", "Jern er navnet på et tungmetal", nil, 1.50}, -- no choices
  ["aluminium"] = {"Aluminium", "Aluminium er navnet på et stykke metal", nil, 0.25}, -- no choices
  ["rekylfjeder"] = {"Rekylfjeder", "Bruges til at samle et våben", nil, 0.50}, -- no choices  
  ["skæfte"] = {"Skæfte", "Bruges til at samle et våben", nil, 0.50}, -- no choices  
  ["løb"] = {"Våbenløb", "Bruges til at samle et våben", nil, 0.50}, -- no choices  
  ["dirty_money"] = {"Sorte penge", "Sorte penge skal hvidvaskes", nil, 0.50}, -- no choices
  ["bank_Penge"] = {"Penge Fra Banken", "DKK.", nil, 0}, -- no choices
  ["iphone"] = {"iPhone X", "Bruges til at sende beskeder mm", nil, 0.2},
  ["samsung"] = {"Samsung Galaxy S9", "Bruges til at sende beskeder mm", nil, 0.2},
  ["oneplus"] = {"OnePlus 6T", "Bruges til at sende beskeder mm", nil, 0.2},
  ["træ"] = {"Træ", "Bruges til at laves om til planker", nil, 3},
  ["vielsesring"] = {"vielsesring", "vielsesringe", nil, 0},
  ["planke"] = {"Planker", "Kan sælges i byen", nil, 1.5},
  ["rod"] = {"Mekaniker Rod", "", nil, 0.50}, -- no choices
  ["vindruer"] = {"Vindruer", "Kan sælges", nil , 0.01},
  ["pakke"] = {"Pakke", "Skal afleveres til kunder", nil , 3.0},
  ["strips"] = {"Strips", "Bruges til at binde folk med", nil , 0.05},
  ["pose"] = {"Sæk", "Bruges til at putte på folks hoveder, eller skarld!", nil , 0.05},
  ["brev"] = {"Brev", "Skal afleveres til kunder", nil , 0.5},
  ["lagerapport"] = {"Læge Journal", "Bliver krævet afleveret til andet hospital", nil , 0.2},
  ["medicin"] = {"Medicin", "Bliver krævet afleveret til andet hospital", nil , 1},
  ["morfin"] = {"Morfin", "Ulovligt! Bruges til at fremstille Herionsprøjter", nil, 0.15}, -- no choices
  ["herionsprøjte"] = {"Herionsprøjte", "Ulovligt! Kan sælges til en drugdealer!", nil, 0.3}, -- no choices
  ["sprøjte"] = {"Sprøjter", "Bruges til at fremstille Herionsprøjter", nil, 0.3}, -- no choices
  ["opium"] = {"Opium", "Bruges til at fremstille Herionsprøjter", nil, 0.10}, -- no choices

      --Amfetamin produktion
      ["amfetamin"] = {"Amfetamin", "Amfetamin.", nil, 0.2},
      ["p2np"] = {"P2NP", "P2NP.", nil, 0.1},
      ["isopropanol"] ={"Isopropanol", "Isopropanol.", nil, 0.1},
      ["sølvpapir"] = {"Sølvpapir", "Sølvpapir.", nil, 0.1},
      ["eddikesyre"] = {"Eddikesyre" , "Eddikkesyre.", nil, 0.1},
      ["naoh"] = {"NaOH", "NaOH.", nil, 0.1},
      ["h2so4"] = {"H2SO4", "H2SO4.", nil, 0.1},
      ["natrium"] = {"Natrium","Natrium", nil, 0.1},
      ["key_hvidvask"] = {"Nøgle - Slagteriet","Nøgler til slagteriet", nil, 0.01},
      ["key_bandidos"] = {"Nøgle - STTS","Nøgle til porten", nil, 0.01},
}
-- load more items function
local function load_item_pack(name)
  local items = module("cfg/item/"..name)
  if items then
    for k,v in pairs(items) do
      cfg.items[k] = v
    end
  else
    print("[vRP] item pack ["..name.."] not found")
  end
end

-- PACKS
load_item_pack("required")
load_item_pack("food")
load_item_pack("drugs")
load_item_pack("ting")

return cfg