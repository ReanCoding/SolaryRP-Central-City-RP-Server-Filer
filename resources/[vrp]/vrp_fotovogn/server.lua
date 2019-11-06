local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_fart")

RegisterServerEvent('betalFart')
AddEventHandler('betalFart', function(tax)
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.tryFullPayment({user_id,tax})
end)