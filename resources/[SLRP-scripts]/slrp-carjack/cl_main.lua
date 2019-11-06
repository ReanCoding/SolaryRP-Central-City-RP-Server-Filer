--[[
  __  __           _            _                 _  __                         _____  
 |  \/  |         | |          | |               | |/ /                        |  __ \ 
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  / 
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \ 
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |                     
                                      |___/                    |_|                     

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
]]

-------------------------------------
------------- Variables -------------
-------------------------------------
local delay = 0

-------------------------------------
------------- Functions -------------
-------------------------------------
function isCar(veh)
	local vc = GetVehicleClass(veh) -- Get vehicle class 
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20) -- Return number 
end

-------------------------------------
--------------- Loops ---------------
-------------------------------------
Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(0)
			if
				DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) and isCar(GetVehiclePedIsTryingToEnter(PlayerPedId())) -- If the player is trying to enter a vehicle
			 then
				local veh = GetVehiclePedIsTryingToEnter(PlayerPedId()) -- Get current vehicle
				local plate = GetVehicleNumberPlateText(veh) -- Get vehicle plate
				if delay == 0 then -- If delay is stopped / if delay = 0
					delay = 5 -- Set delay to 5 seconds
					local ply = GetPlayerPed(-1) -- Get player PED 
					local plyCoords = GetEntityCoords(ply, 0) -- Get player coordinates 
					TriggerServerEvent("htn-carjack:call", plate, plyCoords["x"], plyCoords["y"]) -- Trigger a server event with parameters
				end
			end
		end
	end
)

Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(1000) -- Run the loop every second 
			if delay > 0 then -- If delay still activated
				delay = delay - 1 -- Decrease delay
			end
		end
	end
)
