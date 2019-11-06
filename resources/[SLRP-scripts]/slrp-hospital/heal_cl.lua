local Farm = {
    x = 308.34, y = -595.38, z = 43.29
}

  
local Koordinater = 350.93536376953,-591.54113769531,44.105575561523

RequestAnimDict("amb@world_human_bum_slumped@male@laying_on_right_side@idle_a")
RequestAnimDict("get_up@directional@transition@prone_to_seated@injured")

local object = GetClosestObjectOfType(353.16323852539,-584.78894042969,44.104064941406, 2.0, GetHashKey("v_med_bed2"), 0, 0, 0)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if GetDistanceBetweenCoords(Farm.x,Farm.y,Farm.z, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
      DrawText3D(Farm.x, Farm.y, Farm.z, "Tryk [~g~E~w~] For at blive tilset")
      if (IsControlJustPressed(0,38)) then
        TaskStartScenarioAtPosition(GetPlayerPed(-1), "WORLD_HUMAN_SUNBATHE_BACK",353.16323852539,-584.58894042969,44.204064941406, GetEntityHeading(object)-26.0, 0, true,true)
        exports.pNotify:SendNotification({
          text = "Du er ved at blive undersøgt af en læge vent venligst",
          type = "info",
          timeout = math.random(1000, 10000),
          layout = "center",
          queue = "left"
        })
        Citizen.Wait(7000)
        SetEntityCoordsNoOffset(GetPlayerPed(-1),351.91244506836,-584.56494140625,43.315002441406,0,0,1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
        ClearPedTasks(targetPed)
        SetEntityHealth(PlayerPedId(), 200)
      end
    end
  end
end)




function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
		local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end