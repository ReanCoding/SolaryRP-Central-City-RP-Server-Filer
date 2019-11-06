--[[
	SCRIPTER: DGVaniX [ DGVaniX#0096 ] 
	WEBSITE: http://vanix.market
--]]

local speedBuffer = {}
local velBuffer = {}
local wasInCar = false
local beltWarning  = true
local diffTrigger = 0.255 
local minSpeed = 8.25

RegisterNetEvent("applySeatbelt")
AddEventHandler("applySeatbelt", function()
	beltOn = true
end)

RegisterNetEvent("takeoffSeatbelt")
AddEventHandler("takeoffSeatbelt", function()
	beltOn = false
end)

function IsCar(veh)
		    local vc = GetVehicleClass(veh)
		    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end	

function Fwv(entity)
		    local hr = GetEntityHeading(entity) + 90.0
		    if hr < 0.0 then hr = 360.0 + hr end
		    hr = hr * 0.0174533
		    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		
		local ped = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(ped)
		
		if car ~= 0 and (wasInCar or IsCar(car)) then
			if beltWarning then
				beltWarning = false

				TriggerEvent("pNotify:SendNotification", {
					text = "Tryk på <b style='color:#00ff00'>Z <b style='color:#fff'>for at tage sikkerhedsselen på!",
					type = "info",
					timeout = 2500,
					layout = "centerLeft",
					theme = "gta"
				})
			end

			wasInCar = true
			
			if beltOn then DisableControlAction(0, 75) end
			
			speedBuffer[2] = speedBuffer[1]
			speedBuffer[1] = GetEntitySpeed(car)
			
			if speedBuffer[2] ~= nil 
			   and not beltOn
			   and GetEntitySpeedVector(car, true).y > 1.0  
			   and speedBuffer[1] > minSpeed
			   and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * diffTrigger) then
			   
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
				SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
				Citizen.Wait(1)
				SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
			end
				
			velBuffer[2] = velBuffer[1]
			velBuffer[1] = GetEntityVelocity(car)
			
			if IsControlJustReleased(0, 48) then
				beltOn = not beltOn				  
				if beltOn then 
					TriggerEvent("pNotify:SendNotification", {
						text = "Sikkerhedssele fastspændt ✅",
						type = "info",
						timeout = 2500,
						layout = "centerLeft",
						queue = "global",
						animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
						killer = true,
						sounds = {
						sources = {"Sikkerhedssele_spndt.ogg"},
						volume = 1,
						conditions = {"docVisible"}  
		                }  
						})
				else  
					TriggerEvent("pNotify:SendNotification", {
						text = "Sikkerhedssele løsnet 🚫",
						type = "info",
						timeout = 2500,
						layout = "centerLeft",
						queue = "global",
						animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
						killer = true,
						sounds = {
						sources = {"Sikkerhedssele_lsnet.ogg"},
						volume = 1,
						conditions = {"docVisible"}  
		                }  
						})
						end 
			end
							
		elseif wasInCar then
			beltWarning = true
			wasInCar = false
			beltOn = false
			speedBuffer[1], speedBuffer[2] = 0.0, 0.0
		end
		Citizen.Wait(0)
	end
end)