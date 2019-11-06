
--GetSelectedPedWeapon
--TaskReactAndFleePed

--IsPedGettingIntoAVehicle

local colorNames = {
    ['0'] = "Metal Sort",
    ['1'] = "Metal Grafitsort",
    ['2'] = "Metal Sort Stål",
    ['3'] = "Metal Mørk Sølv",
    ['4'] = "Metal Sølv",
    ['5'] = "Metal Blå Sølv",
    ['6'] = "Metal Stålgrå",
    ['7'] = "Metal Skygge Grå",
    ['8'] = "Metal Sten Sølv",
    ['9'] = "Metal Midnat Sølv",
    ['10'] = "Metal Gun Metal",
    ['11'] = "Metal Antrasit Grå",
    ['12'] = "Mat Sort",
    ['13'] = "Mat Grå",
    ['14'] = "Mat Lys Grå",
    ['15'] = "Util Sort",
    ['16'] = "Util Sort Poly",
    ['17'] = "Util Mørkesølv",
    ['18'] = "Util Sølv",
    ['19'] = "Util Gun Metal",
    ['20'] = "Util Shadow Silver",
    ['21'] = "Slidt Sort",
    ['22'] = "Slidt Grafit",
    ['23'] = "Slidt Sølvgrå",
    ['24'] = "Slidt Sølv",
    ['25'] = "Slidt Blå Sølv",
    ['26'] = "Slidt Skyggesølv",
    ['27'] = "Metal Rød",
    ['28'] = "Metal Torino Rød",
    ['29'] = "Metal Formel Rød",
    ['30'] = "Metal Flamme Rød",
    ['31'] = "Metal Yndefuld Rød",
    ['32'] = "Metal Garnet Rød",
    ['33'] = "Metal Ørken Rød",
    ['34'] = "Metal Vinrød",
    ['35'] = "Metal Slik Rød",
    ['36'] = "Metal Sol Orange",
    ['37'] = "Metal Klassisk Guld",
    ['38'] = "Metal Orange",
    ['39'] = "Mat Rød",
    ['40'] = "Mat Mørkerød",
    ['41'] = "Mat Orange",
    ['42'] = "Mat Gul",
    ['43'] = "Util Rød",
    ['44'] = "Util Lyserød",
    ['45'] = "Util Garnet Rød",
    ['46'] = "Slidt Rød",
    ['47'] = "Slidt Gylden Rød",
    ['48'] = "Slidt Mørkerød",
    ['49'] = "Metal Mørkegrøn",
    ['50'] = "Metal Racer Grøn",
    ['51'] = "Metal Hav Grøn",
    ['52'] = "Metal Olivengrøn",
    ['53'] = "Metal Grøn",
    ['54'] = "Metal Benzin Blå-grøn",
    ['55'] = "Mat Limegrøn",
    ['56'] = "Util Mørkegrøn",
    ['57'] = "Util Grøn",
    ['58'] = "Slidt Mørkegrøn",
    ['59'] = "Slidt Grøn",
    ['60'] = "Slidt Havgrøn",
    ['61'] = "Metal Midnatsblå",
    ['62'] = "Metal Mørkeblå",
    ['63'] = "Metal Saxony Blå",
    ['64'] = "Metal Blå",
    ['65'] = "Metal Marineblå",
    ['66'] = "Metal Havne Blå",
    ['67'] = "Metal Diamant Blå",
    ['68'] = "Metal Surfer Blå",
    ['69'] = "Metal Søfarts Blå",
    ['70'] = "Metal Lyseblå",
    ['71'] = "Metal Lilla-blå",
    ['72'] = "Metal Spiler Blå",
    ['73'] = "Metal Ultra Blå",
    ['74'] = "Metal Lyseblå",
    ['75'] = "Util Mørkeblå",
    ['76'] = "Util Midnatsblå",
    ['77'] = "Util Blå",
    ['78'] = "Util Hav Blå",
    ['79'] = "Uil Lyn Blå",
    ['80'] = "Util Maui Blå Poly",
    ['81'] = "Util Lyseblå",
    ['82'] = "Mat Mørkeblå",
    ['83'] = "Mat Blå",
    ['84'] = "Mat Midnatsblå",
    ['85'] = "Slidt Mørkeblå",
    ['86'] = "Slidt Blå",
    ['87'] = "Slidt Lyseblå",
    ['88'] = "Metal Taxa Gul",
    ['89'] = "Metal Racer Gul",
    ['90'] = "Metal Bronze",
    ['91'] = "Metal Gul Fugl",
    ['92'] = "Metal Limegrøn",
    ['93'] = "Metal Champagne",
    ['94'] = "Metal Pueblo Beige",
    ['95'] = "Metal Mørk Elfenben",
    ['96'] = "Metal Chokoladebrun",
    ['97'] = "Metal Gyldenbrun",
    ['98'] = "Metal Lysebrun",
    ['99'] = "Metal Halm Beige",
    ['100'] = "Metal Mos Brun",
    ['101'] = "Metal Biston Brun",
    ['102'] = "Metal Bøgetræ",
    ['103'] = "Metal Mørkt Bøgetræ",
    ['104'] = "Metal Chocolade Orange",
    ['105'] = "Metal Strandsand",
    ['106'] = "Metal Solbleget Sand",
    ['107'] = "Metal Creme",
    ['108'] = "Util Brun",
    ['109'] = "Util Mellembrun",
    ['110'] = "Util Lysebrun",
    ['111'] = "Metal Hvid",
    ['112'] = "Metal Frost Hvid",
    ['113'] = "Slidt Honning Beige",
    ['114'] = "Slidt Brun",
    ['115'] = "Slidt Dark Brun",
    ['116'] = "Slidt Halm Beige",
    ['117'] = "Børstet Stål",
    ['118'] = "Børstet Sort Stål",
    ['119'] = "Børstet Aluminium",
    ['120'] = "Krom",
    ['121'] = "Slidt Hvid",
    ['122'] = "Util Off Hvid",
    ['123'] = "Slidt Orange",
    ['124'] = "Slidt Lyseorange",
    ['125'] = "Metal Securicor Grøn",
    ['126'] = "Slidt Taxa Gul",
    ['127'] = "Politibil Blå",
    ['128'] = "Mat Grøn",
    ['129'] = "Mat Brin",
    ['130'] = "Slidt Orange",
    ['131'] = "Mat Hvid",
    ['132'] = "Slidt Hvid",
    ['133'] = "Slidt Oliven Armygrøn",
    ['134'] = "Ren Hvid",
    ['135'] = "Varm Pink",
    ['136'] = "Lakserosa",
    ['137'] = "Metal Cinnoberrød Pink",
    ['138'] = "Orange",
    ['139'] = "Grøn",
    ['140'] = "Blå",
    ['141'] = "Metal Sortblå",
    ['142'] = "Metal Sortlilla",
    ['143'] = "Metal Sortrød",
    ['144'] = "Jagtgrøn",
    ['145'] = "Metal Lilla",
    ['146'] = "Metal Mørkeblå",
    ['147'] = "MODSHOP BLACK1",
    ['148'] = "Mat Lilla",
    ['149'] = "Mat Mørkelilla",
    ['150'] = "Metal Lavarød",
    ['151'] = "Mat Skovgrøn",
    ['152'] = "Mat Olivengrøn",
    ['153'] = "Mat Ørkenbrun",
    ['154'] = "Mat Gylden Ørken",
    ['155'] = "Mat Folie Grøn",
    ['156'] = "DEFAULT ALLOY COLOR",
    ['157'] = "Epsilon Blå"
}

local vehicleClasses = {
    [0] = "Compacts",
    [1] = "Sedan",
    [2] = "SUV",
    [3] = "Coupé",
    [4] = "Muskelbil",
    [5] = "Sportsklassiker",
    [6] = "Sportsvogn",
    [7] = "Superbil",
    [8] = "Motorcykl",
    [9] = "Off-road",
    [10] = "Industri",
    [11] = "Redskabsvogn",
    [12] = "Varevogn",
    [13] = "Cykel",
    [14] = "Båd",
    [15] = "Helikopter",
    [16] = "Fly",
    [17] = "Servicekøretøj",
    [18] = "Udrykningskøretøj",
    [19] = "Militærkøretøj",
    [20] = "Kommercielkøretøj",
    [21] = "Tog"
}

Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)

        if IsPedShooting(player) then

            local playerCoords = GetEntityCoords(player)
            local message = ""
            local alreadyNotified = true

            local gender = ""

            
                gender = "En person"
            

            local street = GetStreetName(playerCoords)

            message = "^7^*" .. gender .. " affyrer skud ved " .. street .. "!"

            if message ~= "" then
                local handle, object = FindFirstPed()
                local success

                if CheckDistance(object, playerCoords, true) and alreadyNotified then
                    NotifyPeople(message, playerCoords, object)
                    alreadyNotified = false
                    Citizen.Wait(5000)
                end

                repeat 
                    success, object = FindNextPed(handle)

                    if CheckDistance(object, playerCoords, true) and alreadyNotified then
                        NotifyPeople(message, playerCoords, object)
                        alreadyNotified = false
                        Citizen.Wait(5000)
                    end

                until not success

                EndFindPed(handle)
            end

            message = ""
            alreadyNotified = true
        end

        Citizen.Wait(30)
    end
end)


Citizen.CreateThread(function()
    local alreadyNotified = true

    while true do

        local player = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(player)
        local message = ""
        
        local gender = ""

        local health = GetEntityHealth(player)

        if health <= 105 then
            if alreadyNotified then

                
                    gender = "person"
                

                local street = GetStreetName(playerCoords)

                message = "^7^*En " .. gender .. " er tæt på at dø her! | " .. street .. " !"


                if message ~= "" then

                    local handle, object = FindFirstPed()
                    local success

                    if CheckDistance(object, playerCoords, false) and alreadyNotified then
                        NotifyPeople(message, playerCoords, object)
                        alreadyNotified = false
                        Citizen.Wait(6000)
                    end

                    repeat 
                        success, object = FindNextPed(handle)

                        if CheckDistance(object, playerCoords, false) and alreadyNotified then
                            NotifyPeople(message, playerCoords, object)
                            alreadyNotified = false
                            Citizen.Wait(6000)
                        end

                    until not success

                    EndFindPed(handle)
                end
            end
        end

        if health > 105 then
            alreadyNotified = true
        end

        Citizen.Wait(30)
    end
end)


local blipList = {}

RegisterNetEvent('notifyDispatch')
AddEventHandler('notifyDispatch', function(x,y,z,message)
    local ped = GetPlayerPed(PlayerPedId())
    local blip = AddBlipForCoord(x+0.001,y+0.001,z+0.001)
    SetBlipSprite(blip, 304)
    SetBlipColour(blip, 67)
    SetBlipAlpha(blip, 250)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Alarmcentralen")
    SetBlipScale(blip, 0.8)
    EndTextCommandSetBlipName(blip)

    table.insert(blipList, blip)
    
    --Citizen.Trace("x:" .. x .. " y:" .. y .. " z:" .. z)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    TriggerEvent('chatMessage', '^3[Alarmcentralen]', "^3[Alarmcentralen]", message)
end)

RegisterNetEvent('notifyDispatches')
AddEventHandler('notifyDispatches', function(message)
    local ped = GetPlayerPed(PlayerPedId())
    --Citizen.Trace("x:" .. x .. " y:" .. y .. " z:" .. z)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    TriggerEvent('chatMessage', '^3[Staff]', "^3[Staff]", message)
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(PlayerPedId())
        for k,v in pairs(blipList) do
            RemoveBlip(v)
        end
        blipList = {}
        Citizen.Wait(180000)
    end
end)

function Lockvehicle(object)
    if object ~= nil then
        local pedInVehicle = GetPedInVehicleSeat(object, -1)
        local lock = false
        local numberPlate = GetVehicleNumberPlateText(object)

        if numberPlate ~= nil then

            if tostring(numberPlate) ~= tostring(currentPlate) and currentPlate ~= nil then 
                lock = true
            end

            if tostring(numberPlate) ~= tostring(lastPlate) and lastPlate ~= nil then
                lock = true
            end

            local firstDigit = tonumber(string.sub(tostring(numberPlate), 1, 1))
            local secondDigit = tonumber(string.sub(tostring(numberPlate), 2, 2))
            
            if firstDigit ~= nil and secondDigit ~= nil then

                if firstDigit >= 0 and secondDigit >= 0 then
                    lock = true
                else
                    lock = false
                end
            else
                lock = false
            end                   

            if lock then

                if pedInVehicle == 0 then
                    local lock = GetVehicleDoorLockStatus(object)
                    
                    if lock == 7 then
                        Citizen.Trace("Bil: " .. tostring(GetVehicleNumberPlateText(object)) .. " - " .. tostring(currentPlate) .. " - " .. tostring(lastPlate))
                        SetVehicleDoorsLocked(object,2)
                        SetVehicleDoorsLockedForAllPlayers(object, true)
                    end
                end
            end
        end
    end 
end



function CheckDistance(object, pos, checkAlertness)
    local pedCoords = GetEntityCoords(object)
    local dis = Vdist(pos.x, pos.y, pos.z, pedCoords.x, pedCoords.y, pedCoords.z)

    if dis <= 100.0 and dis > 1.0 then
        --Citizen.Trace(tostring(dis))
        if checkAlertness then
            if GetPedAlertness(object) >= 1 then
                return true
            else
                return false
            end
        end

        return true
    end

    return false
end

function GetStreetName(playerPos)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerPos.x, playerPos.y, playerPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)

    if s2 == 0 then
        return street1
    elseif s2 ~= 0 then
        return street1 .. " - " .. street2
    end
end

function NotifyPeople(message, pos, npc)
    TriggerServerEvent('dispatch', pos.x, pos.y, pos.z, message)
end