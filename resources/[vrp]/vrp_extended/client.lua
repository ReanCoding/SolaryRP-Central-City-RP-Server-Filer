--
-- Created by IntelliJ IDEA.
-- User: Sling
-- Date: 11-01-2019
-- Time: 20:22
-- Made for CiviliansNetwork
--

vRPsb = {}
Proxy.addInterface("vrp_extended",vRPsb)
local userid = 0
local users = {}
local server = 0
local playerBlips = {}

RegisterNetEvent("vrp_extended:server")
AddEventHandler("vrp_extended:server", function(s)
    server = s
end)

RegisterNetEvent("vrp_extended:inventory")
AddEventHandler("vrp_extended:inventory", function(user_id,inventory)
    if user_id ~= nil then
        if inventory ~= nil then
            users[tonumber(user_id)].inventory = inventory
        end
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if users[tonumber(userid)].inventory ~= nil then
            for k,v in pairs(users[tonumber(userid)].inventory) do
                print(k,v.amount)
            end
        end
    end
end)]]

local isEmergency = false
RegisterNetEvent("vrp_extended:playerlist")
AddEventHandler("vrp_extended:playerlist", function(user_id,data)
    if user_id ~= nil then
        if data ~= nil then
            local source, name, job, vip, inventory = table.unpack(data)
            if source ~= nil or name ~= nil or job ~= nil or vip ~= nil then
                users[tonumber(user_id)] = { source = tonumber(source), name = tostring(name), job = tostring(job), userid = tonumber(user_id), vip = vip, inventory = inventory}
                if PlayerId() == GetPlayerFromServerId(tonumber(source)) then
                    if checkEmergency(job) then isEmergency = true else isEmergency = false end
                    userid = user_id
                end
            else
                users[tonumber(user_id)] = nil
            end
        else
            users[tonumber(user_id)] = nil
        end
    end
end)

function checkEmergency(job)
    if job == "Rigspolitichef" or job == "Politidirektør" or job == "Vice Politidirektør" or job == "Politikommisær" or job == "Politiassistent" or job == "Politibetjent" or job == "Politielev" or job == "Regionschef" or job == "Paramediciner" then
        return true
    else
        return false
    end
end

function checkPolice(job)
    if job == "Rigspolitichef" or job == "Politidirektør" or job == "Vice Politidirektør" or job == "Politikommisær" or job == "Politiassistent" or job == "Politibetjent" or job == "Politielev" then
        return true
    else
        return false
    end
end


function vRPsb.getServerNumber()
    return server
end

function vRPsb.getUser()
    if userid ~= 0 then
        return users[tonumber(userid)]
    else
        return false
    end
end

function vRPsb.getUsers()
    return users
end

function vRPsb.checkEmergency(job)
    return checkEmergency(job)
end

function vRPsb.isEmergency()
    return isEmergency
end

function vRPsb.isPolice()
    return checkPolice(users[tonumber(userid)].job)
end

function vRPsb.getUserFromSource(source)
    return getUserFromSource(source)
end

function getUserFromSource(source)
    for k, v in pairs(users) do
        if source == GetPlayerFromServerId(v.source) then
            return users[k]
        end
    end
    return false
end

function vRPsb.getAmountOnline(group)
    local ems = 0
    local mechanic = 0
    local taxa = 0
    local advokat = 0
    local politi = 0
    local bilforhandler = 0
    local realestate = 0
    local journalist = 0
    local psykolog = 0
    local online = 0
    for k, v in pairs(users) do
        if k ~= nil and v.source ~= nil and v.name ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(v.source)) then
            online = online+1
            if v.job == "Ambulanceelev" or v.job == "Ambulanceredder" or v.job == "EMS" or v.job == "Læge" or v.job == "Regionschef" then
                ems = ems+1
            elseif v.job == "Mekaniker" or v.job == "Mekaniker Chef" then
                mechanic = mechanic+1
            elseif v.job == "Politielev" or v.job == "Politibetjent" or v.job == "Politiassistent" or v.job == "Politikommisær" or v.job == "Vice Politidirektør" or v.job == "Politidirektør" or v.job == "Rigspolitichef" then
                politi = politi+1
            elseif v.job == "Bilforhandler" or v.job == "Bilforhandler Chef" then
                bilforhandler = bilforhandler+1
            elseif v.job == "Journalist" or v.job == "Journalist Chef" then
                journalist = journalist+1
            elseif v.job == "Ejendomsmægler" or v.job == "Ejendomsmægler Chef" then
                realestate = realestate+1
            elseif v.job == "Taxi" then
                taxa = taxa+1
            elseif v.job == "Advokat" or v.job == "Advokat Chef" then
                advokat = advokat+1
            elseif v.job == "Psykolog" or v.job == "Psykolog Chef" then
                psykolog = psykolog+1
            end
        end
    end
    if group == "ems" then return ems end
    if group == "realestate" then return realestate end
    if group == "journalist" then return journalist end
    if group == "bilforhandler" then return bilforhandler end
    if group == "mechanic" then return mechanic end
    if group == "taxa" then return taxa end
    if group == "advokat" then return advokat end
    if group == "politi" then return politi end
    if group == "psykolog" then return psykolog end
    if group == "all" then return {ems=ems,realestate=realestate,journalist=journalist,bilforhandler=bilforhandler,mechanic=mechanic,taxa=taxa,advokat=advokat,politi=politi,psykolog=psykolog,online=online} end
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

function DrawID(x,y,z, text) -- some useful function, use it if you want!
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
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

-- Change this
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for k, v in pairs(users) do
            if v.source ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(v.source)) then
                if IsControlPressed(0, 173) then
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(v.source)), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1,y1,z1,x2,y2,z2, true))
                    if distance < 8 and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) and IsEntityVisible(GetPlayerPed(GetPlayerFromServerId(v.source)))then
                        local player = getUserFromSource(GetPlayerFromServerId(v.source))
                        if player ~= false then
                            if player.job ~= "Våbendealer" then
                                DrawID(x2, y2, z2+1, k)
                            end
                        end
                    end
                end
                if isEmergency then
                    if GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
                        if v.job == "Rigspolitichef" or v.job == "Vice Rigspolitichef" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,63,"Rigspolitichef")
                        elseif v.job == "Politidirektør" or v.job == "Vice Politidirektør" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,38,"Politidirektør")
                        elseif v.job == "Politikommisær" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,38,"Politikommisær")
                        elseif v.job == "Politiassistent" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,42,"Politiassistent")
                        elseif v.job == "Politibetjent" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,42,"Politibetjent")
                        elseif v.job == "Politielev" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,26,"Politielev")
                        -- EMS
                        elseif v.job == "Regionschef" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,58,"Regionschef")
                        elseif v.job == "Læge" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,50,"Læge")
                        elseif v.job == "Paramediciner" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,27,"Paramediciner")
                        elseif v.job == "Ambulanceredder" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,61,"Ambulanceredder")
                        elseif v.job == "Ambulanceelev" then
                            updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,48,"Ambulanceelev")
                        else
                            if DoesBlipExist(playerBlips[k]) then RemoveBlip(playerBlips[k]) end
                            playerBlips[k] = nil
                        end
                    end
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

local offonduty = {}
RegisterNetEvent('vrp_extended:offonduty')
AddEventHandler('vrp_extended:offonduty', function(list)
    offonduty = list
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)

    text = string.gsub(text, "^.", string.upper)

    if onScreen then
        SetTextScale(0.40, 0.40)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0150, 0.035+ factor, 0.04, 0, 0, 0, 80)
    end
end

local delay = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if delay ~= 0 then delay = delay-1 end
        local ped = GetPlayerPed(-1)
        if GetEntityHealth(ped) > 100 then
            for _, duty in pairs(offonduty) do
                if GetDistanceBetweenCoords(GetEntityCoords(ped), duty.coords[1], duty.coords[2], duty.coords[3], true ) < 20 then
                    DrawMarker(27, duty.coords[1], duty.coords[2], duty.coords[3], 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 0, 155, 255, 200, 0, 0, 0, 50)
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), duty.coords[1], duty.coords[2], duty.coords[3], true ) < 1.25 then
                        if IsControlJustReleased(1, 86) then
                            if delay == 0 then
                                TriggerServerEvent("vrp_extended:duty",_)
                                delay = tonumber(500)
                            else
                                TriggerEvent("pNotify:SendNotification",{
                                    text = "Du skal vente lidt med at skifte job!",
                                    type = "error",
                                    timeout = 3000,
                                    layout = "bottomCenter",
                                    queue = "global",
                                    animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                                })
                            end
                        end
                        if duty.type then
                            local job = users[tonumber(userid)].job
                            if job == "Mekaniker" or job == "Mekaniker Chef" or job == "Våbendealer" or job == "Journalist" or job == "Journalist Chef" or job == "Bilforhandler" or job == "Bilforhandler Chef" or job == "Ejendomsmægler" or job == "Ejendomsmægler Chef" or job == "Advokat" or job == "Advokat Chef" or job == "Psykolog" or job == "Psykolog Chef" then
                                DrawText3D(duty.coords[1], duty.coords[2], duty.coords[3]+1, "~r~E~w~ For at gå af job")
                            else
                                DrawText3D(duty.coords[1], duty.coords[2], duty.coords[3]+1, "~g~E~w~ For at gå på job")
                            end
                        else
                            if isEmergency then
                                DrawText3D(duty.coords[1], duty.coords[2], duty.coords[3]+1, "~r~E~w~ For at gå af job")
                            else
                                DrawText3D(duty.coords[1], duty.coords[2], duty.coords[3]+1, "~g~E~w~ For at gå på job")
                            end
                        end
                    end

                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)

local showmarker = true
RegisterCommand("cirkel", function(source, args, rawCommand)
    showmarker = not showmarker
    local text = "Voice cirkler er slået <b style='color: #4E9350'>til</b>"
    if showmarker == false then
        text = "Voice cirkler er slået <b style='color: #DB4646'>fra</b>"
    end
    TriggerEvent("pNotify:SendNotification",{
        text = text,
        type = "success",
        timeout = (3000),
        layout = "centerLeft",
        queue = "global",
        animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
        killer = true
    })
end)

local playerNamesDist = 10
Citizen.CreateThread(function()
    while true do
        for id = 0, 31 do
            if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= GetPlayerPed( -1 )) then
                ped = GetPlayerPed( id )
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                local takeaway = 0.95
                if ((distance < playerNamesDist) and IsEntityVisible(GetPlayerPed(id))) ~= GetPlayerPed( -1 ) then
                    if NetworkIsPlayerTalking(id) then
                        local player = getUserFromSource(id)
                        if player ~= false then
                            if showmarker then
                                if player.vip then
                                    DrawMarker(27,x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 55, 160, 205, 105, 0, 0, 80, 0, 0, 0, 0)
                                else
                                    DrawMarker(27,x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 91, 202, 242, 105, 0, 0, 80, 0, 0, 0, 0)
                                end
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(1)
    end
end)