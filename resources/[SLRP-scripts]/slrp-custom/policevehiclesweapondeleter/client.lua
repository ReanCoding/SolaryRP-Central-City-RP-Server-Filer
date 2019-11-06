local vehWeapons = {
	0x1D073A89, -- Shotgun
	0x83BF0278, -- Carbine
	0x5FC3C11, -- Sniper
	0x1B06D571, -- Pistol
}

local hasBeenInPoliceVehicle = false
local alreadyHaveWeapon = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
			if(not hasBeenInPoliceVehicle) then
				hasBeenInPoliceVehicle = true
			end
		else
			if(hasBeenInPoliceVehicle) then
				for i,k in pairs(vehWeapons) do
					if(not alreadyHaveWeapon[i]) then
						TriggerServerEvent("ft_removecopguns:askDropWeapon",k)
					end
				end
				hasBeenInPoliceVehicle = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			for i=1,#vehWeapons do
				if(HasPedGotWeapon(GetPlayerPed(-1), vehWeapons[i], false)==1) then
					alreadyHaveWeapon[i] = true
				else
					alreadyHaveWeapon[i] = false
				end
			end
		end
		Citizen.Wait(5000)
	end

end)

RegisterNetEvent("ft_removecopguns:drop")
AddEventHandler("ft_removecopguns:drop", function(wea)
	RemoveWeaponFromPed(GetPlayerPed(-1), wea)
end)
