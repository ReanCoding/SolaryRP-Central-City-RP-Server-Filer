---CREATED BY GADZA!   Gadza#5750 - Discord
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_banking")

vRPlogs = Proxy.getInterface("vRP_logs")

vRPbanking = {}
Tunnel.bindInterface("vRP_banking",vRPbanking)
Proxy.addInterface("vRP_banking",vRPbanking)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local thePlayer = source
	
	local user_id = vRP.getUserId({thePlayer})
	local walletMoney = vRP.getMoney({user_id})
	local bankMoney = vRP.getBankMoney({user_id})
	if(tonumber(amount))then
		if(vRP.tryPayment({user_id, amount}))then
			vRP.setBankMoney({user_id, bankMoney+amount})
			vRP.setMoney({user_id, walletMoney-amount})
			vRPclient.notify(thePlayer, {"~g~Du har indsat ~y~$"..amount.." ~g~I banken!"})
		else
			vRPclient.notify(thePlayer, {"~r~Du har ikke nok penge på dig!"})
		end
	else
		vRPclient.notify(thePlayer, {"~r~Ugyldigt nummer"})
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local thePlayer = source
	
	local user_id = vRP.getUserId({thePlayer})
	local walletMoney = vRP.getMoney({user_id})
	local bankMoney = vRP.getBankMoney({user_id})
	if(tonumber(amount))then	
		amount = tonumber(amount)
		if(amount > 0 and amount <= bankMoney)then
			vRP.setBankMoney({user_id, bankMoney-amount})
			vRP.setMoney({user_id, walletMoney+amount})
			vRPclient.notify(thePlayer, {"~g~Du fik dine Pensionspenge ~y~$"..amount.." ~g~Fra banken"})
		else
			vRPclient.notify(thePlayer, {"~r~Du har ikke nok penge i banken"})
		end
	else
		vRPclient.notify(thePlayer, {"~r~Ugyldigt nummer"})
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local thePlayer = source
	
	local user_id = vRP.getUserId({thePlayer})
	local bankMoney = vRP.getBankMoney({user_id})
	TriggerClientEvent('currentbalance1', thePlayer, bankMoney)
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amount)
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	if(tonumber(to)  and to ~= "" and to ~= nil)then
		to = tonumber(to)
		theTarget = vRP.getUserSource({to})
		if(theTarget)then
			if(thePlayer == theTarget)then
				vRPclient.notify(thePlayer, {"~r~Du kan ikke overføre dine penge."})
			else
				if(tonumber(amount) and tonumber(amount) > 0 and amount ~= "" and amount ~= nil)then
					amount = tonumber(amount)
					bankMoney = vRP.getBankMoney({user_id})
					if(bankMoney >= amount)then
						newBankMoney = tonumber(bankMoney - amount)
						vRP.setBankMoney({user_id, newBankMoney})
						vRP.giveBankMoney({to, amount})
						vRPclient.notify(thePlayer, {"~g~Du overførte ~y~$"..amount.." ~g~af ~b~"..GetPlayerName(theTarget)})
						vRPclient.notify(theTarget, {"~y~"..GetPlayerName(thePlayer).." ~g~overførte dig ~b~$"..amount})
					else
						vRPclient.notify(thePlayer, {"~r~Du har ikke penge nok i banken"})
					end
				else
					vRPclient.notify(thePlayer, {"~r~Ugyldigt nummer"})
				end
			end
		else
			vRPclient.notify(thePlayer, {"~r~Spilleren blev ikke fundet"})
		end
	end
end)