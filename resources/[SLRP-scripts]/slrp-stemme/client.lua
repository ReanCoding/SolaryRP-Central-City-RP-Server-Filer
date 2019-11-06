local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local defaultkey = Keys["HOME"]
local defaultdistance = 1.001 -- Default distance to voice
local highdistance = 3.501 -- Hight distance to voice
local lowdistance = 0.151 -- Low distance to voice
local currentdistancevoice = 0 -- Current distance to voice (0 to 2)
function Notify(text)
  TriggerEvent("pNotify:SendNotification", {
text = text,
type = "info",
timeout = 2500,
layout = "bottomRight",
theme = "gta"
  })
end


AddEventHandler('onClientMapStart', function()
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(defaultdistance) -- 5 meters range
	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(highdistance) -- 12 meters range
	elseif currentdistancevoice == 2 then
		NetworkSetTalkerProximity(lowdistance) -- 1 meters range
	end
end)
Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlJustPressed(1, defaultkey) then
 			currentdistancevoice = (currentdistancevoice + 1) % 3
			if currentdistancevoice == 0 then
				NetworkSetTalkerProximity(defaultdistance) -- 5 meters range
				Notify("Stemme : Normal")
			elseif currentdistancevoice == 1 then
				NetworkSetTalkerProximity(highdistance) -- 12 meters range
				Notify("Stemme : Råb")
			elseif currentdistancevoice == 2 then
				NetworkSetTalkerProximity(lowdistance) -- 1 meters range
				Notify("Stemme : Hviske")
			end
 		end
 	end
 end)
