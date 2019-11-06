--
-- Created by IntelliJ IDEA.
-- User: Sling
-- Date: 11-01-2019
-- Time: 20:20
-- Made for FreakTown
--

local Tunnel = module("vrp", "lib/Tunnel")
vRPclient = Tunnel.getInterface("vRP","vrp_extended")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

AddEventHandler("vRP:playerLeave",function(user_id, source)
    TriggerClientEvent("vrp_extended:playerlist",-1,user_id,nil)
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    local users = vRP.getUsers({})
    for k,v in pairs(users) do
        if v ~= nil then
            vRP.getUserIdentity({k, function(identity)
                local job = vRP.getUserGroupByType({k,"job"})
                local checksub = vRP.getUserGroupByType({k,job})
                if checksub ~= nil and checksub ~= "" then
                    job = checksub
                end
                vRP.isVip({k, function(vip)
                    TriggerClientEvent("vrp_extended:playerlist",-1,k,{v,identity.firstname.." "..identity.name,job,vip})
                end})
                local server = GetConvar("servernumber", "0")
                TriggerClientEvent("vrp_extended:server", source, server)
            end})
        end
    end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
    if gtype == "job" then
        vRP.getUserIdentity({user_id, function(identity)
            local job = vRP.getUserGroupByType({user_id,"job"})
            local checksub = vRP.getUserGroupByType({user_id,job})
            if checksub ~= nil and checksub ~= "" then
                job = checksub
            end
            vRP.isVip({user_id, function(vip)
                TriggerClientEvent("vrp_extended:playerlist",-1,user_id,{vRP.getUserSource({user_id}),identity.firstname.." "..identity.name,job,vip})
            end})
        end})
    end
end)


AddEventHandler('onResourceStart', function(name)
    if name:lower() == GetCurrentResourceName():lower() then
        local users = vRP.getUsers({})
        for k,v in pairs(users) do
            Citizen.Wait(50)
            if v ~= nil then
                vRP.getUserIdentity({k, function(identity)
                    local job = vRP.getUserGroupByType({k,"job"})
                    local checksub = vRP.getUserGroupByType({k,job})
                    if checksub ~= nil and checksub ~= "" then
                        job = checksub
                    end
                    vRP.isVip({k, function(vip)
                        TriggerClientEvent("vrp_extended:playerlist",-1,k,{v,identity.firstname.." "..identity.name,job,vip})
                    end})
                    local server = GetConvar("servernumber", "0")
                    TriggerClientEvent("vrp_extended:server", -1, server)
                end})
            end
        end
    end
end)


RegisterServerEvent("vrp_extended:duty")
AddEventHandler("vrp_extended:duty", function(type)
    local source = source
    local user_id = vRP.getUserId({source})
    if type == "politi" then
        if vRP.hasGroup({user_id,"Rigspolitichef"}) or vRP.hasGroup({user_id,"Politidirektør"}) or vRP.hasGroup({user_id,"Vice Politidirektør"}) or vRP.hasGroup({user_id,"Politikommisær"}) or vRP.hasGroup({user_id,"Politiassistent"}) or vRP.hasGroup({user_id,"Politibetjent"}) or vRP.hasGroup({user_id,"Politielev"}) then
            if vRP.hasGroup({user_id,"Politi-Job"}) then
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er gået af arbejde!", type = "error", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
                vRP.addUserGroup({user_id,"Arbejdsløs"})
                vRPclient.removeWeapons(source,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 250}}})
            else
                vRP.addUserGroup({user_id,"Politi-Job"})
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er gået på arbejde som <b style='color:#64A664'>"..vRP.getUserGroupByType({user_id,"Politi-Job"}).."</b>!", type = "success", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
            end
        else
            TriggerClientEvent("pNotify:SendNotification", source,{text = "Ingen adgang", type = "error", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
        end
    elseif type == "ems" then
        if vRP.hasGroup({user_id,"Paramediciner"}) or vRP.hasGroup({user_id,"Regionschef"}) then
            if vRP.hasGroup({user_id,"EMS-Job"}) then
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er gået af arbejde!", type = "error", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
                vRP.addUserGroup({user_id,"Arbejdsløs"})
            else
                vRP.addUserGroup({user_id,"EMS-Job"})
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er gået på arbejde som <b style='color:#64A664'>"..vRP.getUserGroupByType({user_id,"EMS-Job"}).."</b>!", type = "success", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
            end
        else
            TriggerClientEvent("pNotify:SendNotification", source,{text = "Ingen adgang", type = "error", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
        end
    elseif type == "mech" then
        if vRP.hasGroup({user_id,"Mekaniker"}) or vRP.hasGroup({user_id,"Mekaniker Chef"}) then
            if vRP.hasGroup({user_id,"Mekaniker-Job"}) then
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er gået af arbejde!", type = "error", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
                vRP.addUserGroup({user_id,"Arbejdsløs"})
            else
                vRP.addUserGroup({user_id,"Mekaniker-Job"})
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er gået på arbejde som <b style='color:#64A664'>"..vRP.getUserGroupByType({user_id,"Mekaniker-Job"}).."</b>!", type = "success", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
            end
        else
            TriggerClientEvent("pNotify:SendNotification", source,{text = "Ingen adgang", type = "error", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
        end
    end
end)