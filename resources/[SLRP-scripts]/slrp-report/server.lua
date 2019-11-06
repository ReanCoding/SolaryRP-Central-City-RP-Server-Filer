

MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ftn-report")

RegisterServerEvent('bugreport')
AddEventHandler('bugreport', function(x, y, z, message, heading, speed, health, veh)
    local source = source
    local user_id = vRP.getUserId({source})

    PerformHttpRequest('https://discordapp.com/api/webhooks/560457159108984838/1X6z6iWrXQAbaOQ5A2MCFAzdBjcP-n7orVZw87QJs8IszZ65LQ5_YYuX8rBBb_mLrW2j', 
        function(err, text, headers) end, 
        'POST', 
        json.encode({username = "Server " .. GetConvar("servernumber","0"), 
        content = user_id .. " rapporterede en fejl:\nBesked: " .. message .. "\nKoordinater: " .. x .. ", " .. y .. ", " .. z .. "\nHeading: " .. heading .. "\nHastighed: " .. speed .. "\nHP: " .. health .. "\nKøretøj: " .. veh}), 
        { ['Content-Type'] = 'application/json' })

    TriggerClientEvent("pNotify:SendNotification", source,{text ="Tak for at fortælle os omkring fejlen!", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
end)

