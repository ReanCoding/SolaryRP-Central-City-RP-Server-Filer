Citizen.CreateThread(function()
    local dict = "missminuteman_1ig_2"
   	local ped = GetPlayerPed(-1)
	local sitting = IsPedSittingInAnyVehicle(ped)

	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 323) and not IsPedInAnyVehicle(PlayerPedId(), true) and not IsPedSwimming(PlayerPedId(), true) then
            if not handsup and not sitting then
                TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
				ClearPedSecondaryTask(GetPlayerPed(-1))
            end
		elseif IsPedInAnyVehicle(PlayerPedId(), true) and handsup == true then
			handsup = false
			ClearPedSecondaryTask(GetPlayerPed(-1))
        end
		if handsup == true then
			DisableControlAction(0, 24, true) -- attack
			DisableControlAction(0, 25, true) -- aim
			DisableControlAction(0, 37, true) -- weapon wheel
			DisableControlAction(0, 44, true) -- cover
			DisableControlAction(0, 45, true) -- reload
			DisableControlAction(0, 140, true) -- light attack
			DisableControlAction(0, 141, true) -- heavy attack
			DisableControlAction(0, 142, true) -- alternative attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
		end
    end
end)