---------- VARIABLES ----------


local treatment = false


local timer = false


local blips = {
  {name="Hospital", x= 338.85, y= -1394.56, z= 31.51},
  {name="Hospital", x= -449.24993896484, y=-346.58276367188, z=34.501747131348},
  {name="Hospital", x= 1841.425415039, y= 3669.2724609375, z= 32.679977416992},
  {name="Hospital", x= 320.38491821289, y= -594.72485351563, z= 43.291790008545},
}

---------- FONCTIONS ----------

function DrawText3Ds(x,y,z, text)
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


function Notify(text)
  SetNotificationTextEntry('STRING')
  AddTextComponentString(text)
  DrawNotification(false, false)
end


function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


function ConfigLang(lang)
  local lang = lang
  if lang == "FR" then
    lang_string = {
      text1 = "Appuyer sur ~INPUT_VEH_HORN~ pour être soigné ~r~(~h~~g~500$~r~)",
      text2 = "Le ~h~~g~docteur ~s~va te ~h~~r~soigner~s~, ~h~~b~soit patient~s~.",
      text3 = "Tu n'as pas besoin d'être ~h~~r~soigner~s~.",
      text4 = "Tu as été ~h~~r~soigné~s~.",
      text5 = "Tu as ~h~~r~bougé~s~, le ~h~~g~docteur~s~ n'as pas pu te ~h~~r~soigner~s~ !",
  }

  elseif lang == "EN" then
    lang_string = {
      text1 = "Tryk ~INPUT_VEH_HORN~ For at blive behandlet ~r~(~h~~g~Gratis~r~)",
      text2 = "~h~~g~Falck ~s~vil ~h~~r~helbrede~s~ dig, ~h~~b~vent venligst~s~.",
      text3 = "Du har ikke brug for at blive ~h~~r~behandlet~s~.",
      text4 = "~h~~g~Falck ~h~~r~Behandlede~s~ dig.",
      text5 = "~h~Du ~h~~r~gik~s~,~h~~g~Falck~s~ kunne ikke ~h~~r~behandle~s~ dig !",
  }
  end
end


---------- CITIZEN ----------

Citizen.CreateThread(function()
  for _, item in pairs(blips) do
    item.blip = AddBlipForCoord(item.x, item.y, item.z)
    SetBlipSprite(item.blip, item.id)
    SetBlipColour(item.blip, item.color)
    SetBlipAsShortRange(item.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(item.name)
    EndTextCommandSetBlipName(item.blip)
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, item in pairs(blips) do
	  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 20 then
        DrawMarker(27, item.x, item.y, item.z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x,item.y,item.z, true) <= 2 then
         -- ShowInfo(lang_string.text1, 0)
          DrawText3Ds(item.x,item.y,item.z, "Tryk ~g~[E] ~w~for at blive behandlet")
          if (IsControlJustPressed(1,38)) and (GetEntityHealth(GetPlayerPed(-1)) < 200) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
           -- Notify(lang_string.text2)
            TriggerEvent("pNotify:SendNotification",{text = "Lægen helbreder dig. Vent venligst",type = "info",timeout = (2500),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer = true})
                        treatment = true
          end
        end
      end
      if (IsControlJustPressed(1,38)) and (GetEntityHealth(GetPlayerPed(-1)) == 200) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
        --Notify(lang_string.text3)
        -- DrawText3Ds(item.x,item.y,item.z, "Du har ikke brug for at blive behandlet")
          TriggerEvent("pNotify:SendNotification",{text = "Du har ikke brug for at blive behandlet",type = "info",timeout = (2500),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer = true})
      end
      if treatment == true then
	    Citizen.Wait(15000)
        timer = true
	  end
      if treatment == true and timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
        TriggerServerEvent('hospital:price')
        SetEntityHealth(GetPlayerPed(-1), 200)
        --Notify(lang_string.text4)
         TriggerEvent("pNotify:SendNotification",{text = "Lægen har behandlet dig",type = "info",timeout = (2500),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer = true})       
          treatment = false
        timer = false
      end
      if treatment == true and timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) > 2) then
        Notify(lang_string.text5)
        treatment = false
        timer = false            
      end
    end 
  end       
end)

Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("s_m_m_doctor_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
      Wait(1)
    end

      local hospitalped =  CreatePed(4, 0xd47303ac, 338.85, -1394.56, 31.51, 49.404, false, true)
      SetEntityHeading(hospitalped, 49.404)
      FreezeEntityPosition(hospitalped, true)
      SetEntityInvincible(hospitalped, true)
      SetBlockingOfNonTemporaryEvents(hospitalped, true)
end)

--3613.6030273438,5026.7197265625,11.349423408508
Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("a_m_o_tramp_01"))
    while not HasModelLoaded(GetHashKey("a_m_o_tramp_01")) do
      Wait(1)
    end
--146.59912109375,-1192.4266357422,28.371425628662
      local wepped =  CreatePed(4, 0x174d4245, 147.1212310791,-1192.2066650391,28.371131896973, 190.404, false, true)
      SetEntityHeading(wepped, 190.404)
      FreezeEntityPosition(wepped, true)
      SetEntityInvincible(wepped, true)
      SetBlockingOfNonTemporaryEvents(wepped, true)
end)

Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("a_m_o_tramp_01"))
    while not HasModelLoaded(GetHashKey("a_m_o_tramp_01")) do
      Wait(1)
    end
--146.59912109375,-1192.4266357422,28.371425628662
      local wepped =  CreatePed(4, 0x174d4245, -2079.1486816406,2611.8684082031,2.1057350635529, 110.404, false, true)
      SetEntityHeading(wepped, 110.404)
      FreezeEntityPosition(wepped, true)
      SetEntityInvincible(wepped, true)
      SetBlockingOfNonTemporaryEvents(wepped, true)
end)



AddEventHandler("playerSpawned", function()
    local lang = "EN"
    ConfigLang(lang)
end)

---------- CREATED BY BOARO ----------


---------- RUINER ISLAND ----------
