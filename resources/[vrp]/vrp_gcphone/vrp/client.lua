RegisterNetEvent('esx_addons_gcphone:call')
AddEventHandler('esx_addons_gcphone:call', function(data)
  local playerPed   = GetPlayerPed(-1)
  local coords      = GetEntityCoords(playerPed)
  local message     = data.message
  local number      = data.number
  if message == nil then
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 200)
    while (UpdateOnscreenKeyboard() == 0) do
      DisableAllControlActions(0);
      Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
      message =  GetOnscreenKeyboardResult()
    end
  end
  if message ~= nil and message ~= "" then
    TriggerServerEvent('vrp_addons_gcphone:startCall', number, message, {
      x = coords.x,
      y = coords.y,
      z = coords.z
    })
  end
end)
--[[
policeOperator = nil

politicoords = {
  {x=440.1731262207,y=-975.63262939453,z=30.539582824707}
}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for k,v in pairs(politicoords) do
      local ped = PlayerPedId()
      local pos = GetEntityCoords(ped, true)
      if GetDistanceBetweenCoords(v.x, v.y, v.z, pos.x, pos.y, pos.z) <= 25 then
        DrawMarker(27, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0, 0, 0, 128, 255)
        SetTextComponentFormat("STRING")
        AddTextComponentString("Tryk Z for at være alarmcentral operatør")
        DisplayHelpTextFromStringLabel(0, 0, 0, -1)
        if GetDistanceBetweenCoords(v.x, v.y, v.z, pos.x, pos.y, pos.z) <= 3 then
          if IsControlJustPressed(0, 20) then
            TriggerEvent("pNotify:SendNotification", {
              text = "Du er nu alarmcentral operatør!",
              timeout = 3000,
              layout = bottomCenter,
              type = info
            })
            TriggerServerEvent("policeDispatch", source)
            policeOperator = source
          end
        end
      end
    end
  end
end)

RegisterNetEvent("policeOperator")
AddEventHandler("policeOperator", function(_source)
  if _source ~= nil then
    local playerIdx = GetPlayerFromServerId(_source)
    local ped = GetPlayerPed(playerIdx)
    local pos = GetEntityCoords(ped, true)

    repeat
      Citizen.Wait(1000)
    until Vdist2(v.x, v.y, v.z, pos.x, pos.y, pos.z) > 3 or IsPedAPlayer(ped) == false

    TriggerEvent("pNotify:SendNotification", {
      text = "Du ikke længere alarmcentral operatør!",
      timeout = 3000,
      layout = bottomCenter,
      type = info
    })
    TriggerServerEvent("noDispatch", _source)
    policeOperator = nil
  end
end)


AddEventHandler("playerDropped", function(source)
  if source == policeOperator then
    TriggerServerEvent("noDispatch", policeOperator)
    policeOperator = nil
  end
end)]]
