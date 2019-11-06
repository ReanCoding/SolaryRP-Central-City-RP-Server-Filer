--[[Proxy/Tunnel]]--

vRPgt = {}
Tunnel.bindInterface("vRP_garages",vRPgt)
Proxy.addInterface("vRP_garages",vRPgt)
vRP = Proxy.getInterface("vRP")

--[[Local/Global]]--

GVEHICLES = {}
local inrangeofgarage = false
local currentlocation = nil

local garages = {
  {name="Garage", colour=3, id=357, marker=27, x=215.124, y=-791.377, z=29.946, h=0.0, hidden=false}, -- Centrum P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-334.685, y=289.773, z=84.905, h=0.0, hidden=false}, -- Tequilala ved P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-55.272, y=-1838.71, z=25.638, h=0.0, hidden=false}, -- Gang P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=126.434, y=6610.04, z=30.880, h=0.0, hidden=false}, -- Paleto Bay P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-1791.6076660156, y=459.33410644531, z=128.30799865723, h=0.0, hidden=true}, -- Kartellet
  {name="Garage", colour=3, id=357, marker=27, x=-2035.372, y=-470.555, z=10.466, h=0.0, hidden=false}, -- Strand P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-976.59875488281, y=-2702.88671875, z=12.9, h=0.0, hidden=false}, -- Lufthavn
  {name="Garage", colour=3, id=357, marker=27, x=291.60162353516, y=-336.40170288086, z=44.219876098633, h=0.0, hidden=false}, -- Retssal-garage
  {name="Banddios Klubhus", colour=1, id=226, marker=27, x=2006.6551, y=3055.0170, z=46.1497, h=0.0, hidden=true}, --Yellow Jack P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-1063.9470214844, y=-1419.7119140625, z=4.545440788269, h=0.0, hidden=false}, --Vestlig P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=436.12869262695, y=-1021.3997192383, z=27.8041456604, h=0.0, hidden=true}, -- Garage PD
  {name="Garage", colour=3, id=357, marker=27, x=-463.47357177734, y=6037.0473632813, z=30.340528488159, h=0.0, hidden=true}, -- Paleto PD
  {name="Garage", colour=3, id=357, marker=27, x=460.80130004883, y=-1157.5744628906, z=28.291790008545, h=0.0, hidden=true}, -- P-Plads ved Politistation
  {name="Garage", colour=3, id=357, marker=27, x=1189.2893066406, y=-3230.6276855469, z=5.0287690162659, h=0.0, hidden=true}, -- Lastbiljob
  {name="Garage", colour=3, id=357, marker=27, x=2661.7719726563, y=2848.2077636719, z=38.47466583252, h=0.0, hidden=true}, -- P-Plads ved minearbejder
  {name="Garage", colour=3, id=357, marker=27, x=-796.51721191406, y=303.63195800781, z=84.800401306152, h=0.0, hidden=true}, -- P-Plads Penthouse lejligheder
  {name="Garage", colour=3, id=357, marker=27, x=180.84309387207, y=2821.6760253906, z=43.489575958252, h=0.0, hidden=true}, -- P-Plads et sted i Sandyshores.
  {name="Garage", colour=3, id=357, marker=27, x=460.60110473633, y=-577.65887451172, z=27.500807357788, h=0.0, hidden=true}, -- Mekaniker garage
  {name="Garage", colour=3, id=357, marker=27, x=1137.5103759766, y=-1606.0947265625, z=33.692562103271, h=0.0, hidden=true},  -- Ambulance garage
  {name="Garage", colour=3, id=357, x=-125.97478485107, y=1003.4663085938, z=235.73216247559, h=0.0, hidden=true}, -- MOB GARAGE
  {name="Garage", colour=3, id=357, marker=27, x=902.69830322266, y=-184.05155944824, z=73.05, h=0.0, hidden=true}, -- Taxa job
  {name="Garage", colour=3, id=357, marker=27,  x=-576.91052246094, y=5250.8061523438,  z=69.46715087891, h=0.0, hidden=true}, -- Træhugger job
  {name="Garage", colour=3, id=357, marker=27, x=1862.4067382813, y=2567.0131835938, z=44.7, h=0.0, hidden=true}, -- Fængsel
  {name="Garage", colour=3, id=357, marker=27,  x=1866.0242919922, y=3698.72265625,  z=32.68, h=0.0, hidden=true}, -- PD i Sandy Shores
  {name="Garage", colour=3, id=357, marker=27,  x=-1767.4169921875, y=-1151.4920654297,  z=12.270, h=0.0, hidden=true}, -- Civil båd/tivoli 
  {name="Garage", colour=3, id=357, marker=27,  x=977.68688964844, y=-3002.0490722656,  z=-40.603710174561, h=0.0, hidden=true}, -- Mekaniker garage
  {name="Garage", colour=3, id=357, marker=27,  x=328.68539428711, y=-1471.995727539,  z=28.8124168396, h=0.0, hidden=true}, -- Hospitals garage
  {name="Garage", colour=3, id=357, marker=27,  x=3636.0817871094, y=3760.9877929688, z=28.515718460083, h=0.0, hidden=true}, -- NAOH garage
  {name="Garage", colour=3, id=357, marker=27,  x=1971.9014892578, y=5180.505859375, z=47.868618011475, h=0.0, hidden=true}, -- Amf produktion garage
 
  -- Gruppering / specielle huse garager
  {name="Garage", colour=3, id=357, marker=27,  x=3816.6108398438, y=4462.6479492188,  z=3.8819859027862, h=0.0, hidden=true}, -- Morfin garage
  {name="Garage", colour=3, id=357, marker=27,  x=-388.95373535156, y=4339.8168945312,  z=56.17886352539, h=0.0, hidden=true}, -- Bunker garage udenfor
  {name="Garage", colour=3, id=357, marker=27,  x=-814.5706, y=160.5650,  z=69.7000, h=0.0, hidden=true}, -- Rockford Hills 3
  {name="Garage", colour=3, id=357, marker=27,  x=12.7956, y=548.4217,  z=174.8835, h=0.0, hidden=true}, -- Whispymound Drive 3671
  {name="Garage", colour=3, id=357, marker=27,  x=1393.4357, y=1117.334,  z=113.8976, h=0.0, hidden=true}, -- La Torre
  {name="Garage", colour=3, id=357, marker=27,  x=970.2740, y=-138.7984,  z=73.4351, h=0.0, hidden=true}, -- The Lost MC
  {name="Garage", colour=3, id=357, marker=27,  x=1943.619140625, y=3828.4538574219, z=30.540386962891, h=0.0, hidden=true}, -- Uno Por Ciento
  {name="Garage", colour=3, id=357, marker=27,  x=-103.9112, y=-607.6959,  z=35.0732, h=0.0, hidden=true}, -- RoadRunners
  {name="Garage", colour=3, id=357, marker=27,  x=-24.4812, y=-1439.1867,  z=29.7531, h=0.0, hidden=true}, -- The Family
  {name="Garage", colour=3, id=357, marker=27,  x=-82.44026184082, y=-810.80102539063,  z=36.332328796387, h=0.0, hidden=true}, -- Gambino
  {name="Garage", colour=3, id=357, marker=27,  x=353.79428100586, y=437.59439086914, z=146.64436340332, h=0.0, hidden=true}, -- De Lilla
  {name="Garage", colour=3, id=357, marker=27,  x=-189.39443969727, y=-1289.6297607422, z=30.395978546143, h=0.0, hidden=true}, -- CiviliansAutoværksted garage
  {name="Garage", colour=3, id=357, marker=27,  x=-3031.5537109375, y=3334.0876464844, z=9.193376541138, h=0.0, hidden=true}, -- Bunker
  {name="Garage", colour=3, id=357, marker=27,  x=-335.58090209961, y=-757.57702636719, z=32.968517303467, h=0.0, hidden=true}, -- Parkingshus
  {name="Garage", colour=3, id=357, marker=27,  x=-615.70324707031, y=-920.34558105469, z=22.24633102417, h=0.0, hidden=true}, -- Parkingshus
  {name="Garage", colour=3, id=357, marker=27,  x=-1098.5596923828, y=-256.49667358398, z=36.586393737793, h=0.0, hidden=true}, -- Lifeinvader
  {name="Garage", colour=3, id=357, marker=27,  x=-1899.5939941406, y=-560.90447998047, z=10.696368598938, h=0.0, hidden=true}, -- Psykolog
  {name="Garage", colour=3, id=357, marker=27,  x=-8.1947259902954, y=-1083.6663818359, z=25.67590713501, h=0.0, hidden=true}, -- Bilforhandler
  {name="Garage", colour=3, id=357, marker=27,  x=-392.64999389648, y=-119.03176116943, z=38.54358291626, h=0.0, hidden=true}, -- BaBa Business
  {name="Garage", colour=3, id=357, marker=27,  x=-34.459495544434, y=-673.12292480468, z=32.338069915772, h=0.0, hidden=true}, -- Våbenhandler
  {name="Garage", colour=3, id=357, marker=27,  x=116.46975708008, y=-1949.7036132813, z=20.729612350464, h=0.0, hidden=true}, -- Black Army
  {name="Garage", colour=3, id=357, marker=27,  x=50.668685913086, y=3662.4553222656, z=39.750648498535, h=0.0, hidden=true}, -- Hells Angels
  {name="Garage", colour=3, id=357, marker=27,  x=548.35021972656, y=-205.12403869629, z=54.248615264893, h=0.0, hidden=true}, -- STTS Mekaniker

}
vehicles = {}
garageSelected = {x=nil, y=nil, z=nil, h=nil}
selectedPage = 0

lang_string = {
menu1 = "Parker køretøj",
menu2 = "Hent køretøj",
menu3 = "Luk",
menu4 = "Køretøjer",
menu5 = "Valgmuligheder",
menu6 = "Hent",
menu7 = "Tilbage",
menu8 = "[~g~E~s~] for at åbne garagen",
menu9 = "Sælg",
menu10 = "[~g~E~s~] for at sælge køretøjet",
menu11 = "Opdater Garage",
menu12 = "Næste",
daybournekek = "Du kan ikke bruge garagen når du er i koma",
state1 = "Ude",
state2 = "Inde",
text1 = "Området er overfyldt",
text2 = "Køretøjet er ikke parkeret",
text3 = "Køretøjer er ude",
text4 = "Dette er ikke dit køretøj",
text5 = "Køretøj parkeret",
text6 = "Intet køretøj i nærheden",
text7 = "Køretøj solgt",
text8 = "Køretøj købt, god tur",
text9 = "Du har ikke råd",
text10 = "Køretøj opdateret"
}
--[[Functions]]--

function vRPgt.spawnGarageVehicle(vtype, name, vehicle_plate, vehicle_colorprimary, vehicle_colorsecondary, vehicle_pearlescentcolor, vehicle_wheelcolor, vehicle_plateindex, vehicle_neoncolor1, vehicle_neoncolor2, vehicle_neoncolor3, vehicle_windowtint, vehicle_wheeltype, vehicle_mods0, vehicle_mods1, vehicle_mods2, vehicle_mods3, vehicle_mods4, vehicle_mods5, vehicle_mods6, vehicle_mods7, vehicle_mods8, vehicle_mods9, vehicle_mods10, vehicle_mods11, vehicle_mods12, vehicle_mods13, vehicle_mods14, vehicle_mods15, vehicle_mods16, vehicle_turbo, vehicle_tiresmoke, vehicle_xenon, vehicle_mods23, vehicle_mods24, vehicle_neon0, vehicle_neon1, vehicle_neon2, vehicle_neon3, vehicle_bulletproof, vehicle_smokecolor1, vehicle_smokecolor2, vehicle_smokecolor3, vehicle_modvariation) -- vtype is the vehicle type (one vehicle per type allowed at the same time)

  local vehicle = vehicles[vtype]
  if vehicle and not IsVehicleDriveable(vehicle[3]) then -- precheck if vehicle is undriveable
    -- despawn vehicle
    SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
    Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle[3], false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
	
                  
	  TriggerEvent("vrp_garages:setVehicle", vtype, nil)
  end

  vehicle = vehicles[vtype]
  if vehicle == nil then
    -- load vehicle model
    local mhash = GetHashKey(name)

    local i = 0
    while not HasModelLoaded(mhash) and i < 10000 do
      RequestModel(mhash)
      Citizen.Wait(10)
      i = i+1
    end

    -- spawn car
    if HasModelLoaded(mhash) then
      local x,y,z = vRP.getPosition({})
      local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
      SetVehicleOnGroundProperly(nveh)
      SetEntityInvincible(nveh,false)
      SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
      SetVehicleNumberPlateText(nveh, "P " .. vRP.getRegistrationNumber({}))
      --Citizen.InvokeNative(0xAD738C3085FE7E11, nveh, true, true) -- set as mission entity
      SetVehicleHasBeenOwnedByPlayer(nveh,true)

	  local nid = NetworkGetNetworkIdFromEntity(nveh)
      SetNetworkIdCanMigrate(nid,true)

	  
    TriggerEvent("vrp_garages:setVehicle", vtype, {vtype,name,nveh})

      SetModelAsNoLongerNeeded(mhash)
    
    --grabbing customization
      local plate = plate
      local primarycolor = tonumber(vehicle_colorprimary)
      local secondarycolor = tonumber(vehicle_colorsecondary)
      local pearlescentcolor = vehicle_pearlescentcolor
      local wheelcolor = vehicle_wheelcolor
      local plateindex = tonumber(vehicle_plateindex)
      local neoncolor = {vehicle_neoncolor1,vehicle_neoncolor2,vehicle_neoncolor3}
      local windowtint = vehicle_windowtint
      local wheeltype = tonumber(vehicle_wheeltype)
      local mods0 = tonumber(vehicle_mods0)
      local mods1 = tonumber(vehicle_mods1)
      local mods2 = tonumber(vehicle_mods2)
      local mods3 = tonumber(vehicle_mods3)
      local mods4 = tonumber(vehicle_mods4)
      local mods5 = tonumber(vehicle_mods5)
      local mods6 = tonumber(vehicle_mods6)
      local mods7 = tonumber(vehicle_mods7)
      local mods8 = tonumber(vehicle_mods8)
      local mods9 = tonumber(vehicle_mods9)
      local mods10 = tonumber(vehicle_mods10)
      local mods11 = tonumber(vehicle_mods11)
      local mods12 = tonumber(vehicle_mods12)
      local mods13 = tonumber(vehicle_mods13)
      local mods14 = tonumber(vehicle_mods14)
      local mods15 = tonumber(vehicle_mods15)
      local mods16 = tonumber(vehicle_mods16)
      local turbo = vehicle_turbo
      local tiresmoke = vehicle_tiresmoke
      local xenon = vehicle_xenon
      local mods23 = tonumber(vehicle_mods23)
      local mods24 = tonumber(vehicle_mods24)
      local neon0 = vehicle_neon0
      local neon1 = vehicle_neon1
      local neon2 = vehicle_neon2
      local neon3 = vehicle_neon3
      local bulletproof = vehicle_bulletproof
      local smokecolor1 = vehicle_smokecolor1
      local smokecolor2 = vehicle_smokecolor2
      local smokecolor3 = vehicle_smokecolor3
      local variation = vehicle_modvariation
    
    --setting customization
      SetVehicleColours(nveh, primarycolor, secondarycolor)
      SetVehicleExtraColours(nveh, tonumber(pearlescentcolor), tonumber(wheelcolor))
      SetVehicleNumberPlateTextIndex(nveh,plateindex)
      SetVehicleNeonLightsColour(nveh,tonumber(neoncolor[1]),tonumber(neoncolor[2]),tonumber(neoncolor[3]))
      SetVehicleTyreSmokeColor(nveh,tonumber(smokecolor1),tonumber(smokecolor2),tonumber(smokecolor3))
      SetVehicleModKit(nveh,0)
      SetVehicleMod(nveh, 0, mods0)
      SetVehicleMod(nveh, 1, mods1)
      SetVehicleMod(nveh, 2, mods2)
      SetVehicleMod(nveh, 3, mods3)
      SetVehicleMod(nveh, 4, mods4)
      SetVehicleMod(nveh, 5, mods5)
      SetVehicleMod(nveh, 6, mods6)
      SetVehicleMod(nveh, 7, mods7)
      SetVehicleMod(nveh, 8, mods8)
      SetVehicleMod(nveh, 9, mods9)
      SetVehicleMod(nveh, 10, mods10)
      SetVehicleMod(nveh, 11, mods11)
      SetVehicleMod(nveh, 12, mods12)
      SetVehicleMod(nveh, 13, mods13)
      SetVehicleMod(nveh, 14, mods14)
      SetVehicleMod(nveh, 15, mods15)
      SetVehicleMod(nveh, 16, mods16)
      if turbo == "on" then
        ToggleVehicleMod(nveh, 18, true)
      else          
        ToggleVehicleMod(nveh, 18, false)
      end
      if tiresmoke == "on" then
        ToggleVehicleMod(nveh, 20, true)
      else          
        ToggleVehicleMod(nveh, 20, false)
      end
      if xenon == "on" then
        ToggleVehicleMod(nveh, 22, true)
      else          
        ToggleVehicleMod(nveh, 22, false)
      end
    SetVehicleWheelType(nveh, tonumber(wheeltype))
      SetVehicleMod(nveh, 23, mods23)
      SetVehicleMod(nveh, 24, mods24)
      if neon0 == "on" then
        SetVehicleNeonLightEnabled(nveh,0, true)
      else
        SetVehicleNeonLightEnabled(nveh,0, false)
      end
      if neon1 == "on" then
        SetVehicleNeonLightEnabled(nveh,1, true)
      else
        SetVehicleNeonLightEnabled(nveh,1, false)
      end
      if neon2 == "on" then
        SetVehicleNeonLightEnabled(nveh,2, true)
      else
        SetVehicleNeonLightEnabled(nveh,2, false)
      end
      if neon3 == "on" then
        SetVehicleNeonLightEnabled(nveh,3, true)
      else
        SetVehicleNeonLightEnabled(nveh,3, false)
      end
      if bulletproof == "on" then
        SetVehicleTyresCanBurst(nveh, false)
      else
        SetVehicleTyresCanBurst(nveh, true)
      end
      --if variation == "on" then
      --  SetVehicleModVariation(nveh,23)
      --else
      --  SetVehicleModVariation(nveh,23, false)
      --end
      SetVehicleWindowTint(nveh,tonumber(windowtint))
    end
  else
    local cartype = ""
	if vtype == "car" then
        cartype = "bil"
	elseif vtype == "bike" then 
        cartype = "motorcykel"
	elseif vtype == "citybike" then
        cartype = "cykel"
	end
  TriggerEvent("pNotify:SendNotification",{text = "Du kan kun have én <b style='color:#B22222'>"..cartype.."</b> ude",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
  end
end

function vRPgt.spawnBoughtVehicle(vtype, name)

local vehicle = vehicles[vtype]
  if vehicle then -- precheck if vehicle is undriveable
    -- despawn vehicle
    SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
    SetEntityAsMissionEntity(vehicle[3], false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
  TriggerEvent("vrp_garages:setVehicle", vtype, nil)
  end

  vehicle = vehicles[vtype]
  if vehicle == nil then
    -- load vehicle model
    local mhash = GetHashKey(name)

    local i = 0
    while not HasModelLoaded(mhash) and i < 10000 do
      RequestModel(mhash)
      Citizen.Wait(10)
      i = i+1
    end

    -- spawn car
    if HasModelLoaded(mhash) then
      local x,y,z = vRP.getPosition({})
      local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
      SetVehicleOnGroundProperly(nveh)
      SetEntityInvincible(nveh,false)
      SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
      SetVehicleNumberPlateText(nveh, "P " .. vRP.getRegistrationNumber({}))
      Citizen.InvokeNative(0xAD738C3085FE7E11, nveh, true, true) -- set as mission entity
      SetVehicleHasBeenOwnedByPlayer(nveh,true)

      local nid = NetworkGetNetworkIdFromEntity(nveh)
      SetNetworkIdCanMigrate(nid,true)

    TriggerEvent("vrp_garages:setVehicle", vtype, {vtype,name,nveh})
    
    Citizen.CreateThread(function()
      Citizen.Wait(1000)
    TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))))
    end)

      SetModelAsNoLongerNeeded(mhash)
    end
  else
	if vtype == "car" then
        local cartype = "bil"
	elseif vtype == "bike" then 
        local cartype = "motorcykel"
	elseif vtype == "citybike" then
        local cartype = "cykel"
	end
  TriggerEvent("pNotify:SendNotification",{text = "Du kan kun have én <b style='color:#B22222'>"..cartype.."</b> ude",type = "info",timeout = (2000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
  end
end

function vRPgt.despawnGarageVehicle(vtype,max_range)
  local vehicle = vehicles[vtype]
    if vehicle then
      local x,y,z = table.unpack(GetEntityCoords(vehicle[3],true))
      local px,py,pz = vRP.getPosition()

    if GetDistanceBetweenCoords(x,y,z,px,py,pz,true) < max_range then -- check distance with the vehicule
      -- remove vehicle
      SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
      Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle[3], false, true) -- set not as mission entity
      SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
      Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
		    DetachEntity(caissei, 1, 1)
        DeleteEntity(caissei)
				DeleteObject(caissei)

        TriggerEvent("vrp_garages:setVehicle", vtype, nil)
  
        TriggerEvent("pNotify:SendNotification",{text = "Køretøj <b style='color:#4E9350'>parkeret</b>",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
         else
        TriggerEvent("pNotify:SendNotification",{text = "Du er for <b style='color:#DB4646'>langt væk</b> fra køretøjet",type = "error",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      end
        else
      TriggerEvent("pNotify:SendNotification",{text = "Du har <b style='color:#DB4646'>intet</b> køretøj ude",type = "info",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
end

--[[function vRPgt.despawnGarageVehicle(vtype,max_range)
  local vehicle = vehicles[vtype]
    if vehicle then
      local x,y,z = table.unpack(GetEntityCoords(vehicle[3],true))
      local px,py,pz = vRP.getPosition()

      if GetDistanceBetweenCoords(x,y,z,px,py,pz,true) < max_range then -- check distance with the vehicule
         -- remove vehicle
		local caissei = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
        SetVehicleHasBeenOwnedByPlayer(caissei,false)
        Citizen.InvokeNative(0xAD738C3085FE7E11, caissei, false, true) -- set not as mission entity
        DeleteEntity(caissei)
        SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(caissei))
        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
		    DetachEntity(caissei, 1, 1)
        DeleteEntity(caissei)
				DeleteObject(caissei)

        TriggerEvent("vrp_garages:setVehicle", vtype, nil)
  
        TriggerEvent("pNotify:SendNotification",{text = "Køretøj <b style='color:#4E9350'>parkeret</b>",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
         else
        TriggerEvent("pNotify:SendNotification",{text = "Du er for <b style='color:#DB4646'>langt væk</b> fra køretøjet",type = "error",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      end
        else
      TriggerEvent("pNotify:SendNotification",{text = "Du har <b style='color:#DB4646'>intet</b> køretøj ude",type = "info",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
end]]

function EnVyGembil()
  Citizen.CreateThread(function()
  local ped = GetPlayerPed(-1)
  local caissei = GetVehiclePedIsIn(ped, false)
  SetEntityAsMissionEntity(caissei, true, true)
  local plate = GetVehicleNumberPlateText(caissei)
	local vtype = "car"
	if IsThisModelABike(GetEntityModel(caissei)) and not IsThisModelABicycle(GetEntityModel(caissei)) then
		vtype = "bike"
	end
	if IsThisModelAQuadbike(GetEntityModel(caissei)) then
		vtype = "bike"
	end
	if IsThisModelABicycle(GetEntityModel(caissei)) then
		vtype = "citybike"
	end
	if DoesEntityExist(caissei) then
		local damage = GetVehicleBodyHealth(caissei)
		if damage < 480 then
			TriggerEvent("pNotify:SendNotification",{text = "Dit køretøj er skadet, reparer det før du parkerer",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		else
		TriggerServerEvent('ply_garages:CheckForVeh', plate, vehicles[vtype][2],vtype)
			 -- remove vehicle
		end
	else
     TriggerEvent("pNotify:SendNotification",{text = "<b style='color:#DB4646'>Intet køretøj i nærheden</b> ude",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end   
  end)
end

function MenuGarage()
    ped = GetPlayerPed(-1)
    selectedPage = 0
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton(lang_string.menu11,"CloseMenu",nil)
    Menu.addButton(lang_string.menu2,"ListVehicle",selectedPage)
    Menu.addButton(lang_string.menu3,"CloseMenu",nil) 
end

function StoreVehicle()
  Citizen.CreateThread(function()
    local caissei = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
    SetEntityAsMissionEntity(caissei, true, true)
    local plate = GetVehicleNumberPlateText(caissei)
	local vtype = "car"
	if IsThisModelABike(GetEntityModel(caissei)) and not IsThisModelABicycle(GetEntityModel(caissei)) then
		vtype = "bike"
	end
	if IsThisModelAQuadbike(GetEntityModel(caissei)) then
		vtype = "bike"
	end
	if IsThisModelABicycle(GetEntityModel(caissei)) then
		vtype = "citybike"
	end
	if DoesEntityExist(caissei) then
		local damage = GetVehicleBodyHealth(caissei)
		if damage < 480 then
			TriggerEvent("pNotify:SendNotification",{text = "Dit køretøj er skadet, reparer det før du parkerer",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		else
		TriggerServerEvent('ply_garages:CheckForVeh', plate, vehicles[vtype][2],vtype)
			 -- remove vehicle
		end
	else
     TriggerEvent("pNotify:SendNotification",{text = "<b style='color:#DB4646'>Intet køretøj i nærheden</b> ude",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end   
  end)
  CloseMenu()
end

function ListVehicle(page)
    ped = GetPlayerPed(-1)
  selectedPage = page
    MenuTitle = lang_string.menu4
    ClearMenu()
  local count = 0
    for ind, value in pairs(GVEHICLES) do
    if ((count >= (page*10)) and (count < ((page*10)+10))) then
        Menu.addButton(tostring(value.vehicle_model), "OptionVehicle", tostring(value.vehicle_model))
    end
    count = count + 1
    end   
    Menu.addButton(lang_string.menu12,"ListVehicle",page+1)
  if page == 0 then
      Menu.addButton(lang_string.menu7,"MenuGarage",nil)
  else
      Menu.addButton(lang_string.menu7,"ListVehicle",page-1)
  end
end

function OptionVehicle(vehID)
  local vehID = vehID
    MenuTitle = "Valg"
    ClearMenu()
    Menu.addButton(lang_string.menu6, "SpawnVehicle", vehID)
    Menu.addButton(lang_string.menu7, "ListVehicle", selectedPage)
end

function SpawnVehicle(vehID)
  local vehID = vehID
  TriggerServerEvent('ply_garages:CheckForSpawnVeh', vehID)
  CloseMenu()
end


function drawNotification(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(false, false)
end

function CloseMenu()
    Menu.hidden = true    
    TriggerServerEvent("ply_garages:CheckGarageForVeh")
end

function LocalPed()
  return GetPlayerPed(-1)
end

function IsPlayerInRangeOfGarage()
  return inrangeofgarage
end

function Chat(debugg)
    TriggerEvent('chatMessage', '', { 0, 0x99, 255 }, tostring(debugg))
end

function ply_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end

function ply_drawTxt2(x,y,z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())

  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end


--[[Citizen]]--

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, garage in pairs(garages) do
      DrawMarker(27, garage.x, garage.y, garage.z, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 50)      	
      	local player = GetPlayerPed(-1)
	  	local health = GetEntityHealth(player)
      	
      	if GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and IsPedInAnyVehicle(LocalPed(), true) == false then
      		if health >= 106 then	
        	  ply_drawTxt2(garage.x, garage.y, garage.z + 0.5, "Tryk [~g~E~s~] for at åbne garagen")
        	 	if IsControlJustPressed(1, 51) then
          			garageSelected.x = garage.x
          			garageSelected.y = garage.y
          			garageSelected.z = garage.z
          			MenuGarage()
          			Menu.hidden = not Menu.hidden 
		  			TriggerServerEvent("ply_garages:CheckGarageForVeh")
        		end
        	  Menu.renderGUI() 
          else
          ply_drawTxt2(garage.x, garage.y, garage.z + 0.5, "Du kan ikke bruge garagen når du er i koma")
      	   end
       end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, garage in pairs(garages) do
      DrawMarker(27, garage.x, garage.y, garage.z, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 50)
      if GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
        ply_drawTxt2(garage.x, garage.y, garage.z + 0.5, "Tryk [~g~E~s~] for at parkere")
        if IsControlJustPressed(1, 38) then
          garageSelected.x = garage.x
          garageSelected.y = garage.y
          garageSelected.z = garage.z
          EnVyGembil()
        end
      end
    end
  end
  end)

Citizen.CreateThread(function()
  while true do
    local near = false
    Citizen.Wait(0)
    for _, garage in pairs(garages) do    
      if (GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and near ~= true) then 
        near = true             
      end
    end
    if near == false then 
      Menu.hidden = true
    end
  end
end)

Citizen.CreateThread(function()
  for _, item in pairs(garages) do
    if not item.hidden then
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      SetBlipColour(item.blip, item.colour)
      SetBlipScale(item.blip, 0.8)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
  end
end)


--[[Events]]--

RegisterNetEvent('vrp_garages:setVehicle')
AddEventHandler('vrp_garages:setVehicle', function(vtype, vehicle)
  vehicles[vtype] = vehicle
end)

RegisterNetEvent('ply_garages:addAptGarage')
AddEventHandler('ply_garages:addAptGarage', function(gx,gy,gz,gh)
local alreadyExists = false
for _, garage in pairs(garages) do
  if garage.x == gx and garage.y == gy then
    alreadyExists = true
  end
end
if not alreadyExists then
  table.insert(garages, #garages + 1, {name="Lejligheds garage", colour=3, id=357, x=gx, y=gy, z=gz, h=gh})
end
end)

RegisterNetEvent('ply_garages:getVehicles')
AddEventHandler("ply_garages:getVehicles", function(THEVEHICLES)
    GVEHICLES = {}
    GVEHICLES = THEVEHICLES
end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("ply_garages:CheckGarageForVeh")
    TriggerServerEvent("ply_garages:CheckForAptGarages")
end)