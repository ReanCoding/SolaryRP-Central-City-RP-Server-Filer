local windowup = true
RegisterNetEvent("Rulvindue")
AddEventHandler('Rulvindue', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
        if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
        
            if ( windowup ) then
                RollDownWindow(playerCar, 0)
                RollDownWindow(playerCar, 1)
                TriggerEvent('chatMessage', '', {255,0,0}, 'Vinduer Ned')
                windowup = false
            else
                RollUpWindow(playerCar, 0)
                RollUpWindow(playerCar, 1)
                TriggerEvent('chatMessage', '', {255,0,0}, 'Vinduer Op')
                windowup = true
            end
        end
    end
end )

RegisterCommand("rul", function(source, args, raw)
    TriggerEvent("Rulvindue")
end, false)