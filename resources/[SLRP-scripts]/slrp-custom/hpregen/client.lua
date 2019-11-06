Citizen.CreateThread(function()
    while true do
        Citizen.Wait(600000)
        health = GetEntityHealth(GetPlayerPed(-1))

        if health > 121 then
            SetEntityHealth(GetPlayerPed(-1), health+10)
        end
    end
end)

-- Made by Hexton bitches