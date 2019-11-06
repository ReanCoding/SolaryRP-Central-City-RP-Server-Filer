 
RegisterCommand('report', function(source, args, rawCommand)
 if not rawCommand == "" or " " or "test" then
    
    local msg = string.lower(rawCommand)
    local description = msg:gsub("report", "")

    local player = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(player)
    local heading = GetEntityHeading(player)
	local health = GetEntityHealth(player)
	local speed = GetEntitySpeed(player)

	local vehName = ""
	if IsPedInAnyVehicle(GetPlayerPed(-1)) then

		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
        local vehClass = GetVehicleClass(veh)
        local vehLblText = GetLabelText(vehicleName)
        local plate = GetVehicleNumberPlateText(veh)

        local vehicleClasses = {
		    [0] = "Compacts",
		    [1] = "Sedans",
		    [2] = "SUVs",
		    [3] = "Coupes",
		    [4] = "Muscle",
		    [5] = "Sports Classics",
		    [6] = "Sports",
		    [7] = "Super",
		    [8] = "Motorcycles",
		    [9] = "Off-road",
		    [10] = "Industrial",
		    [11] = "Utility",
		    [12] = "Vans",
		    [13] = "Cycles",
		    [14] = "Boats",
		    [15] = "Helicopters",
		    [16] = "Planes",
		    [17] = "Service",
		    [18] = "Emergency",
		    [19] = "Military",
		    [20] = "Commercial",
		    [21] = "Trains"
		}

        vehName = vehLblText .. " [Nummerplade: " .. plate .. " ]" .. "[Class: " .. vehicleClasses[vehClass] .. " ]"
	end

    TriggerServerEvent('bugreport', playerCoords.x, playerCoords.y, playerCoords.z, description, heading, speed, health, vehName)
end

end, false)

--Citizen.CreateThread(function()
    --TriggerEvent('chat:addSuggestion', '/emote', 'Ryg, giv penge..')
--end)