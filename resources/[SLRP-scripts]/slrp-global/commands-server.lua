local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");

	local user_id = vRP.getUserId({source})

	if string.lower(sm[1]) == "/meall" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^3[GLOBAL HANDLING] | ^7" .. name, { 128, 128, 128 }, string.sub(msg,5))
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