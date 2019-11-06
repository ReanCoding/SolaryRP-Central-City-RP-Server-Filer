--[[-----------------
	vRP_doorsControl By XanderWP from Ukraine with <3
------------------------]]--
local LockHotkey = {0,119}

doorList = {
    -- Mission Row To locker room & roof -- 449.99548339844,-986.39721679688,30.689613342285
    [1] = { ["objName"] = "v_ilev_ph_gendoor004", ["x"]= 449.698, ["y"]= -986.469,["z"]= 30.689,["locked"]= false,["txtX"]=450.104,["txtY"]=-986.388,["txtZ"]=31.739},
    -- Mission Row Armory -- 453.20541381836,-982.52575683594,30.689594268799
    [2] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 453.205, ["y"]= -982.525,["z"]= 30.6895,["locked"]= true,["txtX"]=453.079,["txtY"]=-982.600,["txtZ"]=30.839},
    -- Mission Row Captain Office -- 447.32876586914,-980.08923339844,30.689577102661
    [3] = { ["objName"] = "v_ilev_ph_gendoor002", ["x"]= 447.328, ["y"]= -980.089,["z"]= 30.6895,["locked"]= true,["txtX"]=447.200,["txtY"]=-980.010,["txtZ"]=30.839},
    -- Mission Row To downstairs right -- 444.71737670898,-989.51776123047,30.689582824707
    [4] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 444.717, ["y"]= -989.517,["z"]= 30.6895,["locked"]= true,["txtX"]=444.677,["txtY"]=-989.691,["txtZ"]=30.839},
    [5] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 443.959, ["y"]= -989.644,["z"]= 30.6896,["locked"]= true,["txtX"]=444.677,["txtY"]=-989.691,["txtZ"]=30.839},
    -- Mission Row Main cells -- 463.72085571289,-992.71032714844,24.914848327637
    [6] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 463.720, ["y"]= -992.710,["z"]= 24.9148,["locked"]= true,["txtX"]=463.465,["txtY"]=-992.664,["txtZ"]=25.064},
    -- Mission Row Cell 1 -- 461.75692749023,-993.66082763672,24.914863586426
    [7] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 461.756, ["y"]= -993.660,["z"]= 24.9148,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
    -- Mission Row Cell 2 -- 461.70291137695,-998.26898193359,24.914863586426
    [8] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 461.702, ["y"]= -998.268,["z"]= 24.9148,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
    -- Mission Row Cell 3 -- 461.79190063477,-1001.8452758789,24.914876937866
    [9] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
    -- Mission Row Backdoor in -- 464.26641845703,-1003.5427246094,24.914848327637
    [10] = { ["objName"] = "v_ilev_gtdoor", ["x"]= 464.266, ["y"]= -1003.54,["z"]= 24.9148,["locked"]= true,["txtX"]=464.570,["txtY"]=-1003.538,["txtZ"]=25.064},
    -- Mission Row Rooftop In -- 464.35491943359,-983.95361328125,43.697105407715
    [11] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 464.354, ["y"]= -983.953,["z"]= 43.6971,["locked"]= true,["txtX"]=464.361,["txtY"]=-983.430,["txtZ"]=43.934},
    -- Briefing Rum -- 442.9504699707,-993.2568359375,30.690179824829
    [12] = { ["objName"] = -131296141, ["x"]= 442.8458, ["y"]= -992.568,["z"]= 30.6934,["locked"]= true,["txtX"]=442.947,["txtY"]=-993.314,["txtZ"]=30.690},
    [13] = { ["objName"] = -131296141, ["x"]= 443.089, ["y"]= -993.967,["z"]= 30.689,["locked"]= true,["txtX"]=442.947,["txtY"]=-993.314,["txtZ"]=30.690},
    -- Bagdøre PD -- 468.55154418945,-1014.7532348633,26.386384963989
    [14] = { ["objName"] = -2023754432, ["x"]= 468.9679, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true,["txtX"]=468.766,["txtY"]=-1014.713,["txtZ"]=26.486},
    [15] = { ["objName"] = -2023754432, ["x"]= 468.3716, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true,["txtX"]=468.766,["txtY"]=-1014.713,["txtZ"]=26.486},
    -- Hospital Omklædning 1 -- 271.79925537109,-1361.1888427734,24.537811279297
    [16] = { ["objName"] = "v_ilev_cor_firedoorwide", ["x"]= 271.799, ["y"]= -1361.188,["z"]= 24.537,["locked"]= true,["txtX"]=271.367,["txtY"]=-1360.972,["txtZ"]=24.537},
    -- Hospital Omklædning 2 -- 265.69067382813,-1362.7127685547,24.537784576416
    [17] = { ["objName"] = "v_ilev_cor_firedoorwide", ["x"]= 265.626, ["y"]= -1362.778,["z"]= 24.537,["locked"]= true,["txtX"]=265.770,["txtY"]=-1362.545,["txtZ"]=24.537},
    -- Hospital Stue 1 -- 253.40689086914,-1360.5013427734,24.537786483765
    [18] = { ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 253.557, ["y"]= -1360.459,["z"]= 24.537,["locked"]= true,["txtX"]=253.557,["txtY"]=-1360.459,["txtZ"]=24.537},
    [19] = { ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 253.557, ["y"]= -1360.459,["z"]= 24.537,["locked"]= true,["txtX"]=253.557,["txtY"]=-1360.459,["txtZ"]=24.537},
    -- Hospital Stue 2 -- 266.56317138672,-1344.9075927734,24.537799835205
    [20] = { ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 266.637, ["y"]= -1344.870,["z"]= 24.537,["locked"]= true,["txtX"]=266.637,["txtY"]=-1344.870,["txtZ"]=24.537},
    [21] = { ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 266.637, ["y"]= -1344.870,["z"]= 24.537,["locked"]= true,["txtX"]=266.637,["txtY"]=-1344.870,["txtZ"]=24.537},

    [22] = { ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 256.319, ["y"]= -1347.943,["z"]= 24.537,["locked"]= true,["txtX"]=256.319,["txtY"]=-1347.943,["txtZ"]=24.537},
    [23] = { ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 256.319, ["y"]= -1347.943,["z"]= 24.537,["locked"]= true,["txtX"]=256.319,["txtY"]=-1347.943,["txtZ"]=24.537},

    [24] = { ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 282.808, ["y"]= -1341.859,["z"]= 24.537,["locked"]= true,["txtX"]=282.808,["txtY"]=-1341.859,["txtZ"]=24.537},
    [25] = { ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 282.808, ["y"]= -1341.859,["z"]= 24.537,["locked"]= true,["txtX"]=282.808,["txtY"]=-1341.859,["txtZ"]=24.537},

    [26] = { ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 286.394, ["y"]= -1345.010,["z"]= 24.537,["locked"]= true,["txtX"]=286.394,["txtY"]=-1345.010,["txtZ"]=24.537},
    [27] = { ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 286.394, ["y"]= -1345.010,["z"]= 24.537,["locked"]= true,["txtX"]=286.394,["txtY"]=-1345.010,["txtZ"]=24.537},

    [28] = { ["objName"] = "v_ilev_cor_firedoor", ["x"]= 251.960, ["y"]= -1365.917,["z"]= 24.537,["locked"]= true,["txtX"]=251.960,["txtY"]=-1365.917,["txtZ"]=24.537},
    [29] = { ["objName"] = "v_ilev_cor_firedoor", ["x"]= 252.355, ["y"]= -1366.361,["z"]= 24.537,["locked"]= true,["txtX"]=251.960,["txtY"]=-1365.917,["txtZ"]=24.537},

    [30] = { ["objName"] = 1755793225, ["x"]=  962.0298, ["y"]= -2184.6696,["z"]= 30.5218,["locked"]= true,["txtX"]=962.0298,["txtY"]=-2184.6696,["txtZ"]=31.5218},
    --Hvidvask privat
    [31] = { ["objName"] = -1468417022, ["x"]= 962.8754, ["y"]= -2105.6645,["z"]= 31.4728,["locked"]= true,["txtX"]=962.8754,["txtY"]=-2105.6645,["txtZ"]=31.8728},
    -- Station Sandy --
    -- Kontoret
    [32] = { ["objName"] = -952356348, ["x"]=  1856.9970, ["y"]= 3711.9494,["z"]= 1.0403,["locked"]= true,["txtX"]=1856.9970,["txtY"]=3711.9494,["txtZ"]=1.0403},
    -- Dobbeldørene ind til cellerne --
    -- Venstre dør (Fra lobbyen)
    [33] = { ["objName"] = -1259801187, ["x"]= 1850.5541, ["y"]= 3710.4240,["z"]= 1.0600,["locked"]= true,["txtX"]=1850.5541,["txtY"]=3710.4240,["txtZ"]=1.0600},
    -- Højre dør (Fra lobbyen)
    [34] = { ["objName"] = -1563799200, ["x"]=  1849.9060, ["y"]= 3711.4196,["z"]= 1.0600,["locked"]= true,["txtX"]=1849.9060,["txtY"]=3711.4196,["txtZ"]=1.0600},
    -- Cellerne --
    -- Nr. 1 celle på højre hånd
    [35] = { ["objName"] = -642608865, ["x"]= 1847.1502, ["y"]= 3710.4045,["z"]= 1.0600,["locked"]= true,["txtX"]=1847.1502,["txtY"]=3710.4045,["txtZ"]=1.0600},
    -- Nr. 2 celle på højre hånd
    [36] = { ["objName"] = -642608865, ["x"]=  1843.1226, ["y"]= 3707.2758,["z"]= 1.0600,["locked"]= true,["txtX"]=1843.1226,["txtY"]=3707.2758,["txtZ"]=1.0600},
    -- Nr. 1 celle på venstre hånd
    [37] = { ["objName"] = -642608865, ["x"]= 1849.0563, ["y"]= 3707.9011,["z"]= 1.06000,["locked"]= true,["txtX"]=1849.0563,["txtY"]=3707.9011,["txtZ"]=1.06000},
    -- Nr. 2 celle på venstre hånd
    [38] = { ["objName"] = -642608865, ["x"]=  1845.1818, ["y"]= 3704.8903,["z"]= 1.0600,["locked"]= true,["txtX"]=1845.1818,["txtY"]=3704.8903,["txtZ"]=1.0600},
    -- Våben lager, omklædningsrum osv. --
    [39] = { ["objName"] = -1720238398, ["x"]= 1842.4157, ["y"]= 3704.6003,["z"]= 1.0600,["locked"]= true,["txtX"]=1842.4157,["txtY"]=3704.6003,["txtZ"]=1.0600},

    [40] = { ["objName"] = 110411286, ["x"]= 238.80610656738, ["y"]= -420.46792602539,["z"]= -118.46505737305,["locked"]= true,["txtX"]= 238.80610656738, ["txtY"]= -420.46792602539,["txtZ"]= -118.46505737305},
    [41] = { ["objName"] = 110411286, ["x"]= 238.40896606445, ["y"]= -421.57379150391,["z"]= -118.46504974365,["locked"]= true,["txtX"]= 238.40896606445,["txtY"]=-421.57379150391,["txtZ"]=-118.46504974365},

    [42] = { ["objName"] = 668467214, ["x"]= 95.525215148926, ["y"]= -1285.3332519531,["z"]= 29.280517578125,["locked"]= true,["txtX"]= 95.525215148926,["txtY"]=-1285.3332519531,["txtZ"]=29.280517578125},
  --  [42] = { ["objName"] = -626684119, ["x"]= 99.640602111816, ["y"]= -1293.2287597656,["z"]= 29.26876449585,["locked"]= true,["txtX"]= 99.640602111816,["txtY"]=-1293.2287597656,["txtZ"]=29.26876449585},

    [43] = { ["objName"] = -2125423493, ["x"]= 957.72277832031, ["y"]= -138.68403625488,["z"]= 74.483116149902,["locked"]= true,["txtX"]= 957.67760009766,["txtY"]=-138.6840,["txtZ"]=74.483},

}

local firstLoad = false
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end


Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while firstLoad == false do
        TriggerServerEvent('door:load')
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('door:statusSend')
AddEventHandler('door:statusSend', function(i, status)
doorList[i]["locked"]=status
local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, hash, false, false, false)
locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)
if heading < -0.01 or heading > 0.01 then
			syncFail = true
			else
			syncFail = false
			end
	if doorList[i]["locked"] == true and syncFail == true then
		FreezeEntityPosition(closeDoor, false)
	else
		FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
	end	
end)

RegisterNetEvent('door:loadSend')
AddEventHandler('door:loadSend', function(doorL)
	for i,v in pairs(doorL) do

		doorList[i]["locked"]=v.freeze

		local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 2.0, hash, false, false, false)
		locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)

		if heading < -0.01 or heading > 0.01 then
			syncFail = true
		else
			syncFail = false
		end
		if doorList[i]["locked"] == true and syncFail == true then
			FreezeEntityPosition(closeDoor, false)
		else
			FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
		end			
	end
firstLoad = true
end)

local drawTextNow = true
local playerCoords = 0
local playerDistance = 10

Citizen.CreateThread(function()
	while true do
		playerCoords = GetEntityCoords(GetPlayerPed(-1))
		for i = 1, #doorList do

			playerDistance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], true)
			if playerDistance < 1.15 then

				if doorList[i]["ishash"] == 0 then
					hash = GetHashKey(doorList[i]["objName"])
				else
					hash = doorList[i]["objName"]
				end

	            local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, hash, false, false, false)
	            locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)

	            SetEntityHealth(closeDoor, 1000)
				ClearEntityLastDamageEntity(closeDoor)
				SetEntityCanBeDamaged(closeDoor, false)

				if doorList[i]["locked"] == true then
					
					DrawText3Ds(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "Tryk ~r~[E]~w~ for at låse op")
					if IsControlJustPressed(table.unpack(LockHotkey)) then	
						Citizen.Wait(250)
						TriggerServerEvent('door:status', i, false)
					end
                else
				
					DrawText3Ds(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "Tryk ~g~[E]~w~ for at låse")
                    if IsControlJustPressed(table.unpack(LockHotkey)) then
						Citizen.Wait(250)
                    	TriggerServerEvent('door:status', i, true)
					end
                end

                if heading < -0.01 or heading > 0.01 then
					syncFail = true
				else
					syncFail = false
				end

                if firstLoad == true then
					if doorList[i]["locked"] == true and syncFail == true then
						FreezeEntityPosition(closeDoor, false)
					else
						FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)

function DrawText3d(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
         SetDrawOrigin(x,y,z, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
    end
end

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end