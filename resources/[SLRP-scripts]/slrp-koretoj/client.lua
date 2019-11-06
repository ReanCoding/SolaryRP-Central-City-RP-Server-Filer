--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 09/05/2017
-- Time: 09:55
-- To change this template use File | Settings | File Templates.
--




local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "KØRETØJSMENU",
    menu_subtitle = "",
    color_r = 225,
    color_g = 0,
    color_b = 0,
}


------------------------------------------------------------------------------------------------------------------------

-- Base du menu
function PersonnalMenu()
    options.menu_subtitle = ""
    ClearMenu()
    Menu.addButton("Motorkontrol", "moteur", nil)
    Menu.addButton("Døre og funkioner", "portieres", nil)
    Menu.addButton("Fartbegrænser", "speedo1", nil)
	  Menu.addButton("Luk Menu", "CloseMenu", nil)
end

function moteur()
    options.menu_subtitle = ""
    ClearMenu()
    Menu.addButton("Tænd motor", "moteurOn", nil)
    Menu.addButton("Sluk motor", "moteurOff", nil)
	  Menu.addButton("Tilbage", "PersonnalMenu", nil)
end

function portieres()
    options.menu_subtitle = ""
    ClearMenu()
    Menu.addButton("Alle døre", "all", nil)
    Menu.addButton("Motorhjelm", "capot", nil)
    Menu.addButton("Bagklap", "coffre", nil)
    Menu.addButton("De forreste døre", "avant", nil)
    Menu.addButton("De bagerste døre", "arriere", nil)
	  Menu.addButton("Tilbage", "PersonnalMenu", nil)
end

function avant()
    options.menu_subtitle = ""
    ClearMenu()
    Menu.addButton("Frontdøren til venstre", "avantgauche", nil)
    Menu.addButton("Frontdøren til højre", "avantdroite", nil)
	  Menu.addButton("Tilbage", "portieres", nil)
end

function arriere()
    options.menu_subtitle = ""
    ClearMenu()
    Menu.addButton("Bagdøren til venstre", "arrieregauche", nil)
    Menu.addButton("Bagdøren til højre", "arrieredroite", nil)
	  Menu.addButton("Tilbage", "portieres", nil)
end

function speedo1()
    options.menu_subtitle = ""
    ClearMenu()
    Menu.addButton("Deaktiver", "limiter", 0)
    Menu.addButton("30 Km/t", "limiter", "30.0")
    Menu.addButton("50 Km/t", "limiter", "50.0")
    Menu.addButton("80 Km/t", "limiter", "80.0")
    Menu.addButton("110 Km/t", "limiter", "110.0")
    Menu.addButton("130 Km/t", "limiter", "130.0")
    Menu.addButton("Tilbage", "PersonnalMenu", nil)
end

function CloseMenu()
    Menu.hidden = not Menu.hidden
end

------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------
function drawTxt(options)
    SetTextFont(options.font)
    SetTextProportional(0)
    SetTextScale(options.scale, options.scale)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(0)
    SetTextEntry('STRING')
    AddTextComponentString(options.text)
    DrawRect(options.xBox,options.y,options.width,options.height,0,0,0,150)
    DrawText(options.x - options.width/2 + 0.005, options.y - options.height/2 + 0.0028)
end
function DisplayHelpText(str)
    SetTextComponentFormat('STRING')
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
function notifs(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString( msg )
    DrawNotification(false, false)
end

--------------------------------------------------- NUI CALLBACKS ------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function limiter(vit)
    speed = vit/3.6
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)

    local vehicleModel = GetEntityModel(vehicle)
    local float Max = GetVehicleMaxSpeed(vehicleModel)

    if (vit == 0) then
    SetEntityMaxSpeed(vehicle, Max)
    TriggerEvent("pNotify:SendNotification",{text = "Fartbegrænser deaktiveret",type = "success",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    else
    SetEntityMaxSpeed(vehicle, speed)
    TriggerEvent("pNotify:SendNotification",{text = "Fartbegrænser aktiveret til | <b style='color: #4E9350'>"..vit.. "</b> KM/T",type = "success",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
end

function all()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then
         SetVehicleDoorShut(playerVeh, 5, false)
         SetVehicleDoorShut(playerVeh, 4, false)
         SetVehicleDoorShut(playerVeh, 3, false)
         SetVehicleDoorShut(playerVeh, 2, false)
         SetVehicleDoorShut(playerVeh, 1, false)
         SetVehicleDoorShut(playerVeh, 0, false)
       else
         SetVehicleDoorOpen(playerVeh, 5, false)
         SetVehicleDoorOpen(playerVeh, 4, false)
         SetVehicleDoorOpen(playerVeh, 3, false)
         SetVehicleDoorOpen(playerVeh, 2, false)
         SetVehicleDoorOpen(playerVeh, 1, false)
         SetVehicleDoorOpen(playerVeh, 0, false)
         frontleft = true
      end
   end
end

function capot()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then
         SetVehicleDoorShut(playerVeh, 4, false)
       else
         SetVehicleDoorOpen(playerVeh, 4, false)
         frontleft = true
      end
   end
end

function coffre()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then
         SetVehicleDoorShut(playerVeh, 5, false)
       else
         SetVehicleDoorOpen(playerVeh, 5, false)
         frontleft = true
      end
   end
end

function avantgauche()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then
         SetVehicleDoorShut(playerVeh, 0, false)
       else
         SetVehicleDoorOpen(playerVeh, 0, false)
         frontleft = true
      end
   end
end

function avantdroite()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then
         SetVehicleDoorShut(playerVeh, 1, false)
       else
         SetVehicleDoorOpen(playerVeh, 1, false)
         frontleft = true
      end
   end
end

function arrieredroite()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then
         SetVehicleDoorShut(playerVeh, 3, false)
       else
         SetVehicleDoorOpen(playerVeh, 3, false)
         frontleft = true
      end
   end
end

function arrieregauche()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then
         SetVehicleDoorShut(playerVeh, 2, false)
       else
         SetVehicleDoorOpen(playerVeh, 2, false)
         frontleft = true
      end
   end
end

function moteurOn()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
   TriggerEvent("pNotify:SendNotification",{text = "Køretøj tændt",type = "success",timeout = (3000),layout = "center",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end

function moteurOff()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
   TriggerEvent("pNotify:SendNotification",{text = "Køretøj slukket",type = "success",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end

function SendNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

------------------------------------------------------------------------------------------------------------------------
function drawMenuRight(txt,x,y,selected)
  local menu = personnelmenu.menu
  SetTextFont(menu.font)
  SetTextProportional(0)
  SetTextScale(menu.scale, menu.scale)
  SetTextRightJustify(1)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

--------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        if IsControlJustPressed(1, 311) then
            PersonnalMenu() -- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
        Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
        if IsEntityDead(PlayerPedId()) then
            PlayerIsDead()
            -- prevent the death check from overloading the server
            playerdead = true
			else
			end
        end
    end
end)

local working
------------------------------------------------------------------------------------------------------------------------