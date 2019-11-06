RegisterNetEvent('lmc:mobil') -- Tag mobilen frem
AddEventHandler('lmc:mobil', function()
    delProps()
    Wait(1)
    Phone()
end)
 
RegisterNetEvent('lmc:mobil2') -- Fjern mobilen fra person - Tilføjet til de andre for at undgå at telefonen gennemborer hånden.
AddEventHandler('lmc:mobil2', function()
    delProps()
end)
 
function delProps(ped)
    ClearPedTasks(ped)
    DetachEntity(NetToObj(prop_net), 1, 1)
    DeleteEntity(NetToObj(prop_net))
    DeleteObject(NetToObj(prop_net))
    StopScreenEffect(Rampage)
    ClearFacialIdleAnimOverride(ped)
    emotePlaying = false
end
 
 
function Phone()
    local ped = GetPlayerPed(-1)
    if not DoesEntityExist(ped) then
        return false
    end
    local veh = GetVehiclePedIsUsing(ped)
    if DoesEntityExist(veh) then
        --TriggerEvent("pNotify:SendNotification", {text = "Du kan ikke bruge emotes i et køretøj!", type = "error", timeout = 2000, layout = "centerLeft"})
        return false
    end
    loadAnimDict("amb@world_human_stand_mobile@male@text@enter")
    local prop = "prop_amb_phone"
    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_stand_mobile@male@text@enter", "enter", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
    local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
    Citizen.Wait(100)
    local netid = ObjToNet(propspawned)
    prop_net = netid
    AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
    Wait(2000)
    loadAnimDict("amb@code_human_wander_texting@male@base")
    TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_wander_texting@male@base", "static", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    emotePlaying = true
end
 
Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then
            if IsDisabledControlJustReleased( 0, 20 ) then -- INPUT_MULTIPLAYER_INFO (Z)
                ClearPedTasks(ped)
                DetachEntity(NetToObj(prop_net), 1, 1)
                DeleteEntity(NetToObj(prop_net))
                DeleteObject(NetToObj(prop_net))
                emotePlaying = false
 
            end
        end
    end
end)