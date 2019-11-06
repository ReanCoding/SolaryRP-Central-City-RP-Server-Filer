local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent('htn-clothing:hasaccess')
AddEventHandler('htn-clothing:hasaccess', function(menuname)
    local source = source
    local user_id = vRP.getUserId({source})
    local group = ""
    if menuname == "Politi Tøj" then group = "Politi-Job" elseif menuname == "Private Modeller" then group = "Peds" else group = "EMS-Job" end
    if vRP.hasGroup({user_id,group}) then
        TriggerClientEvent('htn-clothing:access', source, menuname)
    else
        TriggerClientEvent("pNotify:SendNotification", source,{text = "Ingen adgang!", type = "error", queue = "global", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
end)
