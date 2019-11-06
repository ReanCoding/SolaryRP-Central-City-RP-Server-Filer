--- SCRIPT CREATED BY DNP
--- DONT RELEASE THAT SCRIPT

local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

local Nearby = false
busy = false
-- THREADS
vRPcc = {}
Tunnel.bindInterface("vrp_radio", vRPcc)
Proxy.addInterface("vrp_radio", vRPcc)
vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()

    while true do
        --local user_id = vRP.getUserId(player)
        --local player = vRP.getUserSource({user_id})
        local player = PlayerPedId()
        Citizen.Wait(100)
        if IsControlPressed(2, Keys["Y"]) and GetLastInputMethod(2) then
            if not busy then
                busy = true
                TriggerServerEvent('vrp_radio:startAnim')
                TriggerServerEvent('vrp_radio:playSound')
            end
            TriggerServerEvent('vrp_radio:isCop', player)
        elseif IsControlReleased(2, Keys["Y"]) and GetLastInputMethod(2) then
            -- Deaktiviere vrp_radio Talkie
            if busy then
                busy = false
                TriggerServerEvent('vrp_radio:isCopOnCancel', player)
            end
        end
    end
    -- Aktiviere vrp_radio Talkie
end)
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(2, Keys["Y"]) and GetLastInputMethod(2) then
            pressed = not pressed
            --busy = true
            -- Aktiviere esx_walkie Talkie
            if pressed then
                TriggerServerEvent("vrp_radio:startActionB", false) -- Aktion für andere Personen starten
                DisableActions(GetPlayerPed(-1))
                if not busy then
                    TriggerServerEvent("vrp_radio:startAnim")
                    TriggerServerEvent("vrp_radio:playSoundWithinDistanceServer", 10, "copradiooff", 1.0)
                    busy = true
                end
            else
                if GetLastInputMethod(2) and busy then
                    -- Deaktiviere esx_walkie Talkie
                    TriggerServerEvent("vrp_radio:stopActionB", true) -- Aktion für andere Personen stoppen
                    EnableActions(GetPlayerPed(-1))
                    ClearPedTasksImmediately(PlayerPedId())
                    TriggerServerEvent("vrp_radio:playSoundWithinDistanceServer", 10, "copradio", 1.0)
                    busy = false
                end
            end
        end
    end
end)
]]
-- FUNCTIONS

function EnableActions(ped)
    EnableControlAction(1, 140, true)
    EnableControlAction(1, 141, true)
    EnableControlAction(1, 142, true)
    EnableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
    DisablePlayerFiring(ped, false) -- Disable weapon firing
end

function DisableActions(ped)
    DisableControlAction(1, 140, true)
    DisableControlAction(1, 141, true)
    DisableControlAction(1, 142, true)
    DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
    DisablePlayerFiring(ped, true) -- Disable weapon firing
end

-- EVENTS

RegisterNetEvent("vrp_radio:startAction") -- Aktion Person B
AddEventHandler("vrp_radio:startAction", function(busy)
    print("Action Start")
    NetworkSetTalkerProximity(0.00) -- Sprachreichweite wird unbegrenzt
end)

RegisterNetEvent("vrp_radio:stopAction") -- Aktion Person B
AddEventHandler("vrp_radio:stopAction", function(busy)
    print("Action Stop")
    NetworkSetTalkerProximity(6.00) -- Sprachreichweite wird 6 Meter
end)

RegisterNetEvent("vrp_radio:startAnim") -- Event, um andere Personen Animation starten zu lassen
AddEventHandler("vrp_radio:startAnim", function(player)
    Citizen.CreateThread(function()
        if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and not IsAimCamActive() then
            RequestAnimDict("random@arrests")
            while not HasAnimDictLoaded("random@arrests") do
                Citizen.Wait(1)
            end
            TaskPlayAnim(GetPlayerPed(-1), "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0)
        end
    end)
end)
RegisterNetEvent("vrp_radio:stopAnim")
AddEventHandler("vrp_radio:stopAnim", function(player)
    Citizen.CreateThread(function()
        Citizen.Wait(1)
        ClearPedTasks(GetPlayerPed(-1))
    end)
    TriggerServerEvent("vrp_radio:playSoundWithinDistanceServer", 10.0, 'copradio', 1.0)
end)

RegisterNetEvent("vrp_radio:doActions")
AddEventHandler("vrp_radio:doActions", function()
    TriggerServerEvent("vrp_radio:startActionB") -- Aktion für andere Personen starten
    DisableActions(GetPlayerPed(-1))
end)

RegisterNetEvent("vrp_radio:playSound")
AddEventHandler("vrp_radio:playSound", function()
    TriggerServerEvent("vrp_radio:playSoundWithinDistanceServer", 10, "copradiooff", 1.0)
    DisableActions(GetPlayerPed(-1))
end)

RegisterNetEvent("vrp_radio:cancelActions")
AddEventHandler("vrp_radio:cancelActions", function()
    TriggerServerEvent("vrp_radio:playSoundWithinDistanceServer", 10, "copradio", 1.0)
    TriggerServerEvent("vrp_radio:stopActionB") -- Aktion für andere Personen starten
    EnableActions(GetPlayerPed(-1))
end)

RegisterNetEvent('vrp_radio:playSoundWithinDistanceClient')
AddEventHandler('vrp_radio:playSoundWithinDistanceClient', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if (distIs <= maxDistance) then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile = soundFile,
            transactionVolume = soundVolume
        })
    end
end)