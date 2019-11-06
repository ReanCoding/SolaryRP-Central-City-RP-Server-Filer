--Made by Skovsbøll#3650
RegisterNetEvent("murtaza:fix")
AddEventHandler("murtaza:fix", function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed)
		local Health = GetVehicleEngineHealth(vehicle)
		if Health <= 950 then
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
		SetVehicleFixed(vehicle)
		TriggerEvent("pNotify:SendNotification",{
                        text = "Dit køretøj er fikset",
                        type = "info",
                        timeout = (3000),
                        layout = "bottomCenter",
                        queue = "global",
                        killer=true,
                        animation = {
                        open = "gta_effects_fade_in", 
                        close = "gta_effects_fade_out",
                        }
                        })
	elseif Health > 951 then
		TriggerEvent("pNotify:SendNotification",{
                        text = "Dit køretøj er allerede fikset",
                        type = "error",
                        timeout = (3000),
                        layout = "bottomCenter",
                        queue = "global",
                        killer=true,
                        animation = {
                        open = "gta_effects_fade_in", 
                        close = "gta_effects_fade_out",
                        }
                        })
		end
	end
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end
