local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        TriggerEvent("vrp-chat:chat_message",source,author,message)
        end

    print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        if vRP.hasPermission({user_id,"player.phone"}) then
            TriggerClientEvent('chatMessage', player, "^2Denne ^1["..command.."]^2 er ikke tilgængelig se tilgængelige kommandoer ved at trykke DEL")
        else
            TriggerClientEvent('chatMessage', -1, "^1[OOC]^0 " .. name .. " - [ID - "..user_id.."] ", { 128, 128, 128 }, '/' .. command)
        end
    end

    CancelEvent()
end)

-- player join messages
-- AddEventHandler('playerConnecting', function()
-- TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
-- end)

-- AddEventHandler('playerDropped', function(reason)
-- TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
-- end)

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'SERVER' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)

AddEventHandler('chatMessage', function(source, name, message)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest('https://discordapp.com/api/webhooks/558994850033434625/hUazdxFLO7Dobct5Hl6q8lWKuwAF7-m57iqlstnAd5m85xSH6Yswruubta9UR1QisePm', function(err, text, headers) end, 'POST', json.encode({username = "Chatlog - " .. name, content = message}), { ['Content-Type'] = 'application/json' })
end)
