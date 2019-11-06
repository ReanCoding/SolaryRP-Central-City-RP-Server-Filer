vRPsb = {}
Tunnel.bindInterface("vn_scoreboard",vRPsb)
users = {}
isEmergency = false
playerBlips = {}

RegisterNetEvent("wrp:playerlist")
AddEventHandler("wrp:playerlist", function(user_id,data)
  local source, name, job = table.unpack(data)
  if user_id ~= nil then
    if source ~= nil and name ~= nil then
      users[tonumber(user_id)] = { source = tonumber(source), name = tostring(name), job = tostring(job) }
      if PlayerId() == GetPlayerFromServerId(tonumber(source)) then
        if tostring(job) == "Politibetjent" or tostring(job) == "Læge" then
          isEmergency = true
        else
          isEmergency = false
        end
      end
    else
      users[tonumber(user_id)] = nil
    end
  end
end)

function DrawText3D(x,y,z,text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz,x,y,z,1)

  local scale = (1/dist)*2
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov
  
  if onScreen then
    SetTextScale(0.0*scale, 0.55*scale)
    SetTextFont(0)
    SetTextProportional(1)
    -- SetTextScale(0.0, 0.55)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
  end
end

function updatePlayerBlip(id,ped,idtype,idcolor,text)
  if not DoesBlipExist(playerBlips[id]) then
    playerBlips[id] = AddBlipForEntity(ped)
    SetBlipSprite(playerBlips[id], idtype)
    SetBlipAsShortRange(playerBlips[id], true)
    SetBlipColour(playerBlips[id],idcolor)
    SetBlipScale(playerBlips[id],0.8)
    if text ~= nil and text ~= '' then
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(text)
      EndTextCommandSetBlipName(playerBlips[id])
    end
  end
end

Citizen.CreateThread(function()
  listOn = false
  while true do
    Citizen.Wait(0)
    if IsControlPressed(0, 27)--[[ INPUT_PHONE ]] then
      if not listOn then
        local players = {}
		local police = 0
        local ems = 0
        local mechanic = 0
        local taxi = 0
        for k, v in pairs(users) do
		  if k ~= nil and v.source ~= nil and v.name ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(v.source)) then
          r, g, b = GetPlayerRgbColour(GetPlayerFromServerId(v.source))
          table.insert(players,'<tr style="color: rgb('..r..','..g..','..b..')"><td>'..v.name..'</td><td>'..v.job..'</td></tr>')
		    if v.job == "Politibetjent" then
            police = police+1
          elseif v.job == "Læge" then
            ems = ems+1
          elseif v.job == "Mekaniker" then
            mechanic = mechanic+1
          elseif v.job == "Taxi" then
            taxi = taxi+1
          end
		  end
        end
		table.insert(players,'<tr class="footer"><td colspan="3"><table width="100%"><tr><td class="job">👮 '..police..'</td><td class="job">🚑 '..ems..'</td><td class="job">🔧 '..mechanic..'</td><td class="job">🚕 '..taxi..'</td><tr></table></td></tr>')
        SendNUIMessage({text = table.concat(players)})
        listOn = true
        while listOn do
          Citizen.Wait(0)
          if(IsControlPressed(0, 27) == false) then
            listOn = false
            SendNUIMessage({meta = 'close'})
            break
          end
        end
      end
    end
  end
end)



Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for i=0,99 do
      RemoveMpGamerTag(i)
    end
    for k, v in pairs(users) do
      if v.source ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(v.source)) then
        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(v.source)),true))
        distance = math.floor(GetDistanceBetweenCoords(x1,y1,z1,x2,y2,z2,true))
        if distance < 15 and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) and IsEntityVisible(GetPlayerPed(GetPlayerFromServerId(v.source))) then
          DrawText3D(x2,y2,z2+1.25,k)
          if NetworkIsPlayerTalking(GetPlayerFromServerId(v.source)) then
            DrawMarker(2,x2,y2,z2+1.0,0,0,0,0,0,GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(v.source))),0.25,-0.1,-0.25,150,0,0,100,0,0,2,0,0,0,0)
          else
            DrawMarker(2,x2,y2,z2+1.0,0,0,0,0,0,GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(v.source))),0.25,-0.1,-0.25,0,150,0,100,0,0,2,0,0,0,0)
          end 
        end
        if isEmergency and v.job == "Politibetjent" and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
          updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,29,"Politibetjent")
        elseif isEmergency and v.job == "Læge" and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
          updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,69,"Læge")
        else
          if DoesBlipExist(playerBlips[k]) then RemoveBlip(playerBlips[k]) end
          playerBlips[k] = nil
        end
      else
        if DoesBlipExist(playerBlips[k]) then RemoveBlip(playerBlips[k]) end
        playerBlips[k] = nil
      end
    end
  end
end)