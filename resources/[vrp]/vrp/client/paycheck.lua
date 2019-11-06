vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function ()
	while true do
	local user_id = vRP.getUserId(source)
		Citizen.Wait(1200000) -- Every X ms you'll get paid (300000 = 25 min)
		TriggerServerEvent('paycheck:salary')
	end
end)

Citizen.CreateThread(function ()
	while true do
	local user_id = vRP.getUserId(source)
		Citizen.Wait(1200000) -- Every X ms you'll get paid (300000 = 25 min)
		TriggerServerEvent('paycheck:bonus')
	end
end)

