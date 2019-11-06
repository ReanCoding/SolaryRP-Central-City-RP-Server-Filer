local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local cars = {}

-- Aston Martin
  cars["rapide"] = 2500000
  cars["ast"] = 4000000

-- Audi
  cars["RS3"] = 1000000
  cars["2014rs5"] = 1500000
  cars["audirs6tk"] = 1750000
  cars["2015s3"] = 2000000
  cars["sq72016"] = 2500000
  cars["buffalo"] = 3000000
  cars["RS7"] = 5000000
  cars["r8ppi"] = 7000000

-- BMW
  cars["m3e30"] = 350000
  cars["m2"] = 1000000
  cars["17m760i"] = 1500000
  cars["m4f82"] = 2000000
  cars["m4f82"] = 3000000
  cars["m6f13"] = 4000000
  cars["x6m"] = 5000000
  cars["bmws"] = 5000000
  
-- Lamborghini
  cars["urus2018"] = 6000000
  cars["aventadors"] = 10000000
  
  
-- Honda
  cars["CBTWISTER"] = 500000
  cars["hcbr17"] = 800000

-- Mercedes Benz
  cars["macla"] = 300000
  cars["v250"] = 750000
  cars["brabus700"] = 2500000
  cars["mlbrabus"] = 1500000
  cars["gle"] = 3000000
  cars["g65amg"] = 4000000
  
-- Nissan
  cars["skyline"] = 5500000
  cars["gtr"] = 8500000
				
-- Porsche
  cars["pcs18"] = 1500000
  cars["pturismo"] = 2000000
  cars["pturismopturismo"] = 3000000
  cars["p911r"] = 5000000

  -- Volkswagen
  cars["golf6"] = 100000
  cars["polo2018"] = 250000
  cars["passat"] = 500000
  
-- Andre
  cars["aeroxr"] = 9000
  cars["207rc"] = 50000
  cars["ds4"] = 100000
  cars["schafter2"] = 200000
  cars["hexer"] = 350000
  cars["rubi3d"] = 500000
  cars["srt392"] = 1000000
  cars["viper"] = 3000000
  cars["models"] = 2500000
  cars["xfr"] = 2500000
  cars["mgt"] = 2500000
  cars["bmm"] = 3000000 
  cars["baller"] = 2000000
  cars["svr14"] = 3000000
  cars["esv"] = 3000000
  cars["nh2r"] = 5000000
  cars["ghis2"] = 4000000
  cars["ferporto"] = 6000000
  cars["p1"] = 15000000
  cars["adder"] = 20000000

-- standard
  cars["AKUMA"] = 50000
  cars["bagger"] = 50000
  cars["bati"] = 50000
  cars["bati2"] = 50000
  cars["bf400"] = 50000
  cars["carbonrs"] = 50000
  cars["cliffhanger"] = 50000
  cars["daemon"] = 50000
  cars["double"] = 50000
  cars["enduro"] = 50000
  cars["faggio2"] = 50000
  cars["gargoyle"] = 50000
  cars["hakuchou"] = 50000
  cars["innovation"] = 50000
  cars["lectro"] = 50000
  cars["nemesis"] = 50000
  cars["pcj"] = 50000
  cars["ruffian"] = 50000
  cars["sanchez"] = 50000
  cars["thrust"] = 50000
  cars["vader"] = 50000
  cars["vindicator"] = 50000
  cars["blista"] = 100000
  cars["brioso"] = 100000
  cars["Dilettante"] = 100000
  cars["issi2"] = 100000
  cars["panto"] = 100000
  cars["prairie"] = 100000
  cars["rhapsody"] = 100000
  cars["bison"] = 150000
  cars["bobcatxl"] = 150000
  cars["gburrito"] = 150000
  cars["journey"] = 150000
  cars["minivan"] = 150000
  cars["paradise"] = 150000
  cars["rumpo"] = 150000
  cars["surfer"] = 150000
  cars["youga"] = 150000
  cars["bifta"] = 200000
  cars["blazer"] = 200000
  cars["brawler"] = 200000
  cars["dubsta3"] = 200000
  cars["dune"] = 200000
  cars["rebel2"] = 200000
  cars["sandking"] = 200000
  cars["trophytruck"] = 200000
  cars["blade"] = 250000
  cars["buccaneer"] = 250000
  cars["chino"] = 250000
  cars["coquette3"] = 250000
  cars["dominator"] = 250000
  cars["dukes"] = 250000
  cars["gauntlet"] = 250000
  cars["hotknife"] = 250000
  cars["faction"] = 250000
  cars["nightshade"] = 250000
  cars["picador"] = 250000
  cars["sabregt"] = 250000
  cars["tampa"] = 250000
  cars["virgo"] = 250000
  cars["vigero"] = 250000
  cars["asea"] = 300000
  cars["asterope"] = 300000
  cars["cognoscenti"] = 300000
  cars["cognoscenti2"] = 300000
  cars["cog55"] = 300000
  cars["cog552"] = 300000
  cars["fugitive"] = 300000
  cars["glendale"] = 300000
  cars["ingot"] = 300000
  cars["intruder"] = 300000
  cars["premier"] = 300000
  cars["primo"] = 300000
  cars["primo2"] = 300000
  cars["regina"] = 300000
  cars["stanier"] = 300000
  cars["stratum"] = 300000
  cars["stretch"] = 300000
  cars["superd"] = 300000
  cars["surge"] = 300000
  cars["tailgater"] = 300000
  cars["warrener"] = 300000
  cars["washington"] = 300000
  cars["cogcabrio"] = 400000
  cars["exemplar"] = 400000
  cars["f620"] = 400000
  cars["felon"] = 400000
  cars["felon2"] = 400000
  cars["jackal"] = 400000
  cars["oracle"] = 400000
  cars["oracle2"] = 400000
  cars["sentinel"] = 400000
  cars["sentinel2"] = 400000
  cars["windsor"] = 400000
  cars["windsor2"] = 400000
  cars["zion"] = 400000
  cars["zion2"] = 400000
  cars["ninef"] = 400000
  cars["ninef2"] = 400000
  cars["alpha"] = 400000
  cars["banshee"] = 400000
  cars["bestiagts"] = 400000
  cars["buffalo2"] = 400000
  cars["carbonizzare"] = 400000
  cars["comet2"] = 400000
  cars["coquette"] = 400000
  cars["tampa2"] = 400000
  cars["feltzer2"] = 400000
  cars["furoregt"] = 400000
  cars["fusilade"] = 400000
  cars["jester"] = 400000
  cars["jester2"] = 400000
  cars["kuruma"] = 400000
  cars["lynx"] = 400000
  cars["massacro"] = 400000
  cars["massacro2"] = 400000
  cars["omnis"] = 400000
  cars["penumbra"] = 400000
  cars["rapidgt"] = 400000
  cars["rapidgt2"] = 400000
  cars["schafter3"] = 400000
  cars["sultan"] = 400000
  cars["surano"] = 400000
  cars["tropos"] = 400000
  cars["verlierer2"] = 400000
  cars["casco"] = 750000
  cars["coquette2"] = 750000
  cars["jb700"] = 750000
  cars["pigalle"] = 750000
  cars["stinger"] = 750000
  cars["stingergt"] = 750000
  cars["feltzer3"] = 750000
  cars["ztype"] = 750000
  cars["banshee2"] = 1000000
  cars["bullet"] = 1000000
  cars["cheetah"] = 1000000
  cars["entityxf"] = 1000000
  cars["sheava"] = 1000000
  cars["fmj"] = 1000000
  cars["infernus"] = 1000000
  cars["osiris"] = 1000000
  cars["le7b"] = 1000000
  cars["reaper"] = 1000000
  cars["sultanrs"] = 1000000
  cars["t20"] = 1000000
  cars["turismor"] = 1000000
  cars["tyrus"] = 1000000
  cars["vacca"] = 1000000
  cars["voltic"] = 1000000
  cars["prototipo"] = 1000000
  cars["zentorno"] = 1000000


MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_showroom")
Gclient = Tunnel.getInterface("vRP_garages","vRP_showroom")

-- vehicle db / garage and lscustoms compatibility
MySQL.createCommand("vRP/showroom_columns", [[
ALTER TABLE vrp_user_vehicles ADD veh_type varchar(255) NOT NULL DEFAULT 'default' ;
ALTER TABLE vrp_user_vehicles ADD vehicle_plate varchar(255) NOT NULL;
]])

--MySQL.query("vRP/showroom_columns")

MySQL.createCommand("vRP/add_custom_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate,veh_type) VALUES(@user_id,@vehicle,@vehicle_plate,@veh_type)")

-- SHOWROOM
RegisterServerEvent('veh_SR:CheckMoneyForVeh')
AddEventHandler('veh_SR:CheckMoneyForVeh', function(vehicle, price ,veh_type)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
	if #pvehicle > 0 then
		vRPclient.notify(player,{"~r~Vehicle already owned."})
	else
    if cars[vehicle] then
      if price == cars[vehicle] then
        if vRP.tryFullPayment({user_id,price}) then
          vRP.getUserIdentity({user_id, function(identity)
                  MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vehicle, vehicle_plate = "P "..identity.registration, veh_type = veh_type})
          end})
          
          TriggerClientEvent('veh_SR:CloseMenu', player, vehicle, veh_type)
          vRPclient.notify(player,{"Paid ~r~"..price.."$."})
        else
          vRPclient.notify(player,{"~r~Not enough money."})
        end
      else
        vRPclient.notify(player,{"Error!"})

        local dname = "[".. tostring(user_id).. "] SPAnti-Cheat"
        local dmessage = "Id ".. tostring(user_id).. " Just tried to buy a ".. vehicle.. " for ".. price.. "$"
        PerformHttpRequest('https://discordapp.com/api/webhooks/463090625747615757/5STGuV7usPxcfuT_A_Fj7lDb_OoWcxnKWPOSoSEyuCKBhfAHzDoltC3NP-lI2ypKtoUI', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
      end
    else
      vRPclient.notify(player,{"Client and server doesn't match tell an admin this!"})
    end
	end
  end)
end)

RegisterServerEvent('veh_SR:CheckMoneyForBasicVeh')
AddEventHandler('veh_SR:CheckMoneyForBasicVeh', function(user_id, vehicle, price ,veh_type)
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
	if #pvehicle > 0 then
		vRPclient.notify(player,{"~r~Vehicle already owned."})
		vRP.giveMoney({user_id,price})
	else
        vRPclient.notify(player,{"Paid ~r~"..price.."$."})
		vRP.getUserIdentity({user_id, function(identity)
          MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vehicle, vehicle_plate = "P "..identity.registration, veh_type = veh_type})
		end})
		Gclient.spawnBoughtVehicle(player,{veh_type, vehicle})
	end
  end)
end)