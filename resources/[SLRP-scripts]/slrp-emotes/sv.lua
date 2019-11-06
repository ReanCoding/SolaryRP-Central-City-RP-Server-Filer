AddEventHandler('chatMessage', function(source, n, msg)
    local args = stringsplit(msg, ' ')

    if string.lower(args[1]) == "/emotes" then
        TriggerClientEvent("emote:display", source)
        CancelEvent()
    elseif string.lower(args[1]) == "/emote" then
        if args[2] ~= nil then
            TriggerClientEvent("emote:start", source, args[2])
        else
            TriggerClientEvent("chatMessage", source, "FEJL", {255,0,0}, "^7Brug \"^3/emotes^7\" for at se alle emotes")
        end
        CancelEvent()
    elseif string.lower(args[1]) == "/e" then
        if args[2] ~= nil then
            TriggerClientEvent("emote:start", source, args[2])
        else
            TriggerClientEvent("chatMessage", source, "FEJL", {255,0,0}, "^7Brug \"^3/emotes^7\" for at se alle emotes")
        end
        CancelEvent()
    elseif string.lower(args[1]) == "/hund" then
        if args[2] ~= nil then
            TriggerClientEvent("emote:dog", source, args[2])
        else
            TriggerClientEvent("chatMessage", source, "FEJL", {255,0,0}, "^7Brug /hund hund1, hund2, hund3")
        end
        CancelEvent()
    elseif string.lower(args[1]) == "/humør" then
        if args[2] ~= nil then
            TriggerClientEvent("emote:mood", source, args[2])
        else
            TriggerClientEvent("chatMessage", source, "HUMØR", {255,0,0}, "^7Brug /humør normal, sur, glad, ked, smerte, sover, forvirret, bekymret, fuld")
        end
        CancelEvent()
    elseif string.lower(args[1]) == "7emote" then
        CancelEvent()
    elseif string.lower(args[1]) == "/say" then
        CancelEvent()
    end
end)
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterCommand("cam", function(source, args, raw)
    local src = source
    TriggerClientEvent("htn-emotes:mobil", src)
end)