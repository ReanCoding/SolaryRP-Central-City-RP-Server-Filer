--bind client tunnel interface
vRPbm = {}
Tunnel.bindInterface("vRP_basic_menu",vRPbm)
vRP = Proxy.getInterface("vRP")

local frozen = false
local unfrozen = false
function vRPbm.loadFreeze(freeze)
	if freeze then
	  frozen = true
	  unfrozen = false
	else
	  unfrozen = true
	end
end

local state_ready = false

AddEventHandler("playerSpawned",function() -- delay state recording
  state_ready = false
  
  Citizen.CreateThread(function()
    Citizen.Wait(30000)
    state_ready = true
  end)
end)

Citizen.CreateThread(function()
	while true do
		if frozen then
			if unfrozen then
				SetEntityInvincible(GetPlayerPed(-1),false)
				SetEntityVisible(GetPlayerPed(-1),true)
				FreezeEntityPosition(GetPlayerPed(-1),false)
				frozen = false
			else
				SetEntityInvincible(GetPlayerPed(-1),true)
				SetEntityVisible(GetPlayerPed(-1),false)
				FreezeEntityPosition(GetPlayerPed(-1),true)
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		if not vRP.isHandcuffed() then 
			TriggerServerEvent('jail:removeJailedGroup')
		end
		Citizen.Wait(10000)
	end
end)