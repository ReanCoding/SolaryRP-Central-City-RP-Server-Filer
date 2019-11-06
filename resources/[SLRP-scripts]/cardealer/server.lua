MySQL = module("vrp_mysql", "MySQL")
MySQL.createCommand("vRP/cardealeradd", "INSERT INTO vrp_cardealer(cardealer_seller, cardealer_sellername, cardealer_vehicle, cardealer_vehiclename, cardealer_vehicledesc, cardealer_price, cardealer_img) VALUES (@user_id,@name,@vehicle,@vehiclename,@vehicledesc,@price,@img)")
MySQL.createCommand("vRP/cardealer_get","SELECT user_id, vehicle, vehicle_name FROM vrp_user_vehicles WHERE NOT EXISTS (SELECT * FROM vrp_cardealer WHERE vrp_user_vehicles.user_id=vrp_cardealer.cardealer_seller AND vrp_user_vehicles.vehicle=vrp_cardealer.cardealer_vehicle AND vrp_cardealer.cardealer_deleted='0') AND user_id = @user_id")
MySQL.createCommand("vRP/cardealer_getAll","SELECT * FROM vrp_cardealer WHERE cardealer_accepted = '1' AND cardealer_deleted = '0' AND cardealer_soldtoid = '0' ORDER BY cardealer_created")
MySQL.createCommand("vRP/cardealer_getItem","SELECT * FROM vrp_cardealer WHERE cardealer_accepted = '1' AND cardealer_deleted = '0' AND cardealer_soldtoid = '0' AND cardealer_id = @user_id")
MySQL.createCommand("vRP/cardealer_getOwn","SELECT * FROM vrp_cardealer WHERE cardealer_deleted = '0' AND cardealer_seller = @user_id AND cardealer_soldtoid = '0'")
MySQL.createCommand("vRP/cardealer_getOwned","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/cardealer_getOfflineMoney","SELECT bank FROM vrp_user_moneys WHERE user_id = @user_id")
MySQL.createCommand("vRP/cardealer_addOfflineMoney","UPDATE vrp_user_moneys SET bank = @money WHERE user_id = @user_id")
MySQL.createCommand("vRP/cardealer_updateOwner","UPDATE vrp_user_vehicles SET user_id = @owner WHERE user_id = @seller AND vehicle = @vehicle")
MySQL.createCommand("vRP/cardealer_Sold","UPDATE vrp_user_vehicles SET user_id = @owner WHERE user_id = @seller AND vehicle = @vehicle")
MySQL.createCommand("vRP/cardealer_updateSold","UPDATE vrp_cardealer SET cardealer_soldtoid=@user_id,cardealer_solddate=CURRENT_TIMESTAMP WHERE cardealer_id = @cardealer_id")
MySQL.createCommand("vRP/cardealer_getProfil","SELECT * FROM vrp_cardealer WHERE cardealer_deleted = '0' AND cardealer_seller = @user_id ORDER BY cardealer_created DESC")
MySQL.createCommand("vRP/cardealer_deleteProfil","UPDATE vrp_cardealer SET cardealer_deleted='1' WHERE cardealer_id = @cardealer_id")
MySQL.createCommand("vRP/cardealer_updatePlate","UPDATE vrp_user_vehicles SET vehicle_plate=@plate WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/cardealer_getAI","SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'hyppen' AND TABLE_NAME = 'vrp_cardealer'")
MySQL.createCommand("vRP/cardealer_search","SELECT * FROM vrp_cardealer WHERE cardealer_deleted = '0' AND cardealer_accepted ='1' AND cardealer_soldtoid = '0' AND cardealer_vehiclename LIKE @search ORDER BY cardealer_created ASC")
MySQL.createCommand("vRP/cardealer_getNotAccepted", "SELECT * FROM vrp_cardealer WHERE cardealer_accepted = '0'")

local sanitizes = module("cfg/sanitizes")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent('cardealer:ConfirmBuy')
AddEventHandler('cardealer:ConfirmBuy', function(id)
    local lsource = source
    Citizen.CreateThread(function()
        local user_id = vRP.getUserId({lsource})
        MySQL.query("vRP/cardealer_getItem", {user_id = id}, function(row, affected)
            local vehicle = ""
            local vehiclename = ""
            local price = ""
            local seller = ""
            if #row > 0 then
                for k,v in pairs(row) do
                    vehicle = v["cardealer_vehicle"]
                    vehiclename = v["cardealer_vehiclename"]
                    price = v["cardealer_price"]
                    seller = v["cardealer_seller"]
                end
                local wallet = vRP.getMoney({user_id})
                local bank = vRP.getBankMoney({user_id})
                local total = wallet+bank
                if(total >= price) then
                    MySQL.query("vRP/cardealer_getOwned", {user_id = user_id, vehicle = vehicle}, function(row2, affected)
                        if #row2 > 0 then
                            TriggerClientEvent("pNotify:SendNotification", lsource, {text = "Du kan ikke købe et køretøj du allerede ejer!", type = "error", timeout = 4000, layout = "centerLeft"})
                        else
                            local users = vRP.getUsers({})
                            local isselleronline = false
                            for k,v in pairs(users) do
                                if k == seller then
                                    isselleronline = true
                                end
                            end
                            Citizen.Wait(100)
                            if isselleronline then
                                local pseller = vRP.getUserSource({seller})
                                if pseller ~= nil then
                                    if vRP.tryFullPayment({user_id,total}) then
                                        local sbank = vRP.getBankMoney({seller})
                                        vRP.setBankMoney({seller,sbank+price})
                                    end
                                    vRP.setBankMoney({user_id,bank-total})
                                    TriggerClientEvent("pNotify:SendNotification", pseller, {text = "Din <b style='color:lime'>"..vehiclename.."</b> er lige blevet solgt for <b style='color: #4E9350'>" .. price .." Dkk</b>!", type = "success", timeout = 4000, layout = "centerLeft"})
                                    exports['vrp_garages']:updateGarage(seller)
                                end
                            else
                                MySQL.query("vRP/cardealer_getOfflineMoney", {user_id = seller}, function(row3, affected)
                                    if #row3 > 0 then
                                        local sbank = false
                                        for k2,v2 in pairs(row3) do
                                            sbank = v2["bank"]
                                        end
                                        if sbank then
                                            sbank = sbank+price
                                            MySQL.query("vRP/cardealer_addOfflineMoney", {money = sbank,user_id = seller})
                                        end
                                    end
                                end)
                            end
                            vRP.getUserIdentity({user_id, function(identity)
                                registration = "P "..identity.registration
                                TriggerClientEvent("pNotify:SendNotification", lsource, {text = "Tillykke med din nye <b style='color:lime'>"..vehiclename.."</b></br>Betalte <b style='color: #DB4646'>" .. price .." Dkk</b>!", type = "success", timeout = 4000, layout = "centerLeft"})
                                MySQL.query("vRP/cardealer_updateOwner", {owner = user_id, seller = seller, vehicle = vehicle})
                                MySQL.query("vRP/cardealer_updateSold", {user_id = user_id, cardealer_id = id})
                                exports['vrp_garages']:updateGarage(user_id)
                                Citizen.Wait(1000)
                                MySQL.query("vRP/cardealer_updatePlate", {plate = registration, user_id = user_id, vehicle = vehicle})
                            end})
                        end
                    end)
                else
                    local number = total-price
                    TriggerClientEvent("pNotify:SendNotification", lsource, {text = "Du mangler <b style='color:red'>"..number.."</b> DKK!", type = "success", timeout = 4000, layout = "centerLeft"})
                end
            end
        end)
    end)
end)

RegisterServerEvent('cardealer:deleteProfil')
AddEventHandler('cardealer:deleteProfil', function(id)
    MySQL.query("vRP/cardealer_deleteProfil", {cardealer_id = id})
end)
RegisterServerEvent('cardealer:getAll')
AddEventHandler('cardealer:getAll', function()
    local lsource = source
    MySQL.query("vRP/cardealer_getAll", {}, function(row, affected)
        if #row > 0 then
            TriggerClientEvent("cardealer:frontpage", lsource, json.encode(row))
        else
            TriggerClientEvent("cardealer:frontpage", lsource, "0")
        end
    end)
end)
RegisterServerEvent('cardealer:Buy')
AddEventHandler('cardealer:Buy', function(id)
    local lsource = source
    Citizen.CreateThread(function()
        local user_id = vRP.getUserId({lsource})
        MySQL.query("vRP/cardealer_getItem", {user_id = id}, function(row, affected)
            if #row > 0 then
                MySQL.query("vRP/get_user_identity", {user_id = tonumber(row[1]["cardealer_seller"])}, function(row2, affected)
                    row["phone"] = row2[1]["phone"]
                end)
                Citizen.Wait(100)
                TriggerClientEvent("cardealer:sendBuy", lsource, row, user_id)
            else
                TriggerClientEvent("cardealer:sendBuy", lsource, "0")
            end
        end)
    end)
end)

RegisterServerEvent('cardealer:getsearch')
AddEventHandler('cardealer:getsearch', function(search)
    local lsource = source
    if search ~= "" then
        search = "%"..search.."%"
        MySQL.query("vRP/cardealer_search", {search = search}, function(row, affected)
            if #row > 0 then
                TriggerClientEvent("cardealer:search", lsource, json.encode(row))
            else
                TriggerClientEvent("cardealer:search", lsource, "0")
            end
        end)
    else
        MySQL.query("vRP/cardealer_getAll", {}, function(row, affected)
            if #row > 0 then
                TriggerClientEvent("cardealer:search", lsource, json.encode(row))
            else
                TriggerClientEvent("cardealer:search", lsource, "0")
            end
        end)
    end
end)

RegisterServerEvent('cardealer:getprofil')
AddEventHandler('cardealer:getprofil', function()
    local lsource = source
    local user_id = vRP.getUserId({source})
    if (user_id > 0) then
        MySQL.query("vRP/cardealer_getProfil", { user_id = user_id }, function(row, affected)
            if #row > 0 then
                TriggerClientEvent("cardealer:showProfil", lsource, json.encode(row))
            else
                TriggerClientEvent("cardealer:showProfil", lsource, "0")
            end
        end)
    end
end)
RegisterServerEvent('cardealer:get')
AddEventHandler('cardealer:get', function()
    local lsource = source
    local user_id = vRP.getUserId({source})
    if (user_id > 0) then
        MySQL.query("vRP/cardealer_get", { user_id = user_id }, function(row, affected)
            if #row > 0 then
                TriggerClientEvent("cardealer:updatevehlist", lsource, row)
            else
                TriggerClientEvent("cardealer:updatevehlist", lsource, "0")
            end
        end)
    end
end)
RegisterServerEvent('cardealer:create')
AddEventHandler('cardealer:create', function(vehname, veh, vehdesc, price, img)
    local lsource = source
    local user_id = vRP.getUserId({source})
    Citizen.CreateThread(function()
        price = sanitizeString(price, sanitizes.text[1])
        local name = ""
        MySQL.query("vRP/get_user_identity", {user_id = user_id}, function(row, affected)
            name = row[1]["firstname"].." "..row[1]["name"]
        end)
        Citizen.Wait(100)
        local ai = "";
        MySQL.query("vRP/cardealer_getAI", {}, function(row2, affected)
            ai = row2[1]["AUTO_INCREMENT"]
        end)
        Citizen.Wait(100)
        MySQL.query("vRP/cardealeradd", {
            user_id = user_id,
            name = name,
            vehicle = veh,
            vehiclename = vehname,
            vehicledesc = vehdesc,
            price = price,
            img = img,
        })
    end)
end)
