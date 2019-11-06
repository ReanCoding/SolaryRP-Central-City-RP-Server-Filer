local Proxy = module("vrp", "lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"user.paycheck") then
		vRP.giveBankMoney(user_id,2500)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har fået kontanthjælp! </ b> <br /> Kontanthjælp: <b style='color:#00ff00'>2500", type = "info", queue = "global", timeout = 5000, theme = "gta", layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
	if vRP.hasPermission(user_id,"postnord.paycheck") then
		vRP.giveBankMoney(user_id,5000)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har fået løn! </ b> <br /> Løn: <b style='color:#00ff00'>5000", type = "info", queue = "global", timeout = 5000, theme = "gta", layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('paycheck:bonus')
AddEventHandler('paycheck:bonus', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"user1.paycheck") then
		vRP.giveBankMoney(user_id,100)
		vRPclient.notify(source,{"Gift for play: ~g~$100"})
	end
	if vRP.hasPermission(user_id,"user1.paycheck") then
		vRP.getMoney(user_id,150)
		vRPclient.notify(source,{"Tax: R$-150"})
	end
end)
