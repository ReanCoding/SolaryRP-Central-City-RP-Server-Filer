vRPlyd = {}
Tunnel.bindInterface("vrp_lyd",vRPlyd)
vRPserver = Tunnel.getInterface("vRP","vrp_lyd")
VDserver = Tunnel.getInterface("vrp_lyd","vrp_lyd")
vRP = Proxy.getInterface("vRP")

local key = 212 -- https://wiki.fivem.net/wiki/Controls
local voice = 1
local pid = PlayerId()

function vRPlyd.setTalkerProxity(distance)
	NetworkSetTalkerProximity(distance) -- set range
end

function drawRct(x,y,width,height,r,g,b,a)
   DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end


Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlJustPressed(1, key) then 
 			voice = voice + 1
			if voice > 3 then voice = 1 end
			VDserver.setVoiceDisplay({false,voice})
 		end
 	end
end)

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
		if NetworkIsPlayerTalking(pid) then
			if voice == 1 then
				VDserver.voiceTalking({false,4})
			elseif voice == 2 then
				VDserver.voiceTalking({false,5})
			else 
				VDserver.voiceTalking({false,6})
			end
		else
			VDserver.voiceTalking({false,voice})
 		end
 	end
end)