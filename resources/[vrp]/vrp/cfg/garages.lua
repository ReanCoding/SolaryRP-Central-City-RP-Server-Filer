local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.60 -- sell for 75% of the original price

cfg.garage_types = { 

    ["K�ret�jer"]  = {
    _config = {vtype="car",blipid=357,blipcolor=3},
    ["ninef"] = {"9F",120000, ""},
    ["nissantitan17"] = {"Nissan Titan 2017",560000, ""},
    ["rmodlp750"] = {"Lamborghini Aventador LP 750",6500000, ""},
    ["918"] = {"Porsche 918 Spyder",6600000, ""},
    ["675lt"] = {"McLaren 675 LT",7600000, ""},
    ["rmodlp770"] = {"Lamborghini Centenario LP770",7700000, ""},	
    ["bmwm3"] = {"BMW M3",750000, ""},
    ["ninef2"] = {"9F Cabrio",130000, ""},
    ["alpha"] = {"Alpha",150000, ""},
    ["banshee"] = {"Banshee",205000, ""},
    ["banshee2"] = {"Banshee 900R",320000, ""},
    ["carbonizzare"] = {"Carbonizzare",210000, ""},
	["chantom"] = {"Chantom Semi",110000, ""},
    ["comet2"] = {"Porsche Cayman",750000, ""},
    ["coquette"] = {"Coquette",338000, ""},
    ["coquette3"] = {"Coquette BlackFin",130000, ""},
    ["tampa2"] = {"Drift Tampa",95000, ""},
    ["furoregt"] = {"Furore GT",108000, ""},
	["elegy2"] = {"GTR Nismo",500000, ""},
    ["jester"] = {"Jester",140000, ""},
    ["jester2"] = {"Jester (Racecar)",250000, ""},
    ["f620"] = {"Lexus RC350", 80000, ""},
    ["pigalle"] = {"Pigalle",90000, ""},
    ["surano"] = {"Surano",95000, ""},
    ["baller"] = {"Range Rover",350000, ""},
    ["bestiagts"] = {"Bestia GTS",250000, ""},
    ["blista"] = {"Blista Compact",42000, ""},
	["blista2"] = {"Honda Civic",120000, ""},
    ["buffalo"] = {"Buffalo",115000, ""},
    ["buffalo2"] = {"Buffalo S",125000, ""},
    ["dominator"] = {"Ford Mustang",225000, ""},
    ["exemplar"] = {"Audi RS7", 650000, ""},
    ["fusilade"] = {"Fusilade ",36000, ""},
    ["gburrito"] = {"Gang Burrito",65000, ""},
    ["gauntlet"] = {"Gauntlet",35000, ""},
    ["granger"] = {"Grabger",40000, ""},
    ["huntley"] = {"Bentley", 750000,""},
	["kuruma"] = {"Lancer Evo",35000, ""},
    ["nightshade"] = {"Nightshade",72000, ""},
    ["rapidgt"] = {"Rapid GT",225000, ""},
    ["rapidgt2"] = {"Rapid GT Convertible",375000, ""},
    ["rocoto"] = {"Rocoto",50000, ""},
    ["sabregt"] = {"Sabre Turbo",72000, ""},
    ["schafter2"] = {"Schafter",35000, ""},
    ["sentinel2"] = {"Sentinel XS", 35000, ""},
    ["gtr"] = {"Nissan GTR", 500000, ""},
    ["superd"] = {"Super Diamond",150000, ""},
    ["tampa"] = {"Tampa",225000, ""},
    ["vigero"] = {"Dodge",150000, ""},
    ["virgo"] = {"Virgo",65000, ""},
    ["xls"] = {"XLS",45000, ""},
    ["chiron"] = {"Bugatti Chiron",12500000, ""},
    ["r8ppi"] = {"Audi R8",580000, ""},
    ["bullet"] = {"Bullet",455000, ""},
    ["cheetah"] = {"Cheetah",400000, ""},
    ["entityxf"] = {"Entity XF",650000, ""},
    ["fmj"] = {"FMJ",1750000, ""},
    ["lynx"] = {"Lynx",463000, ""},
    ["massacro"] = {"Massacro",275000, ""},
    ["massacro2"] = {"Massacro (Racecar)",395000, ""},
    ["osiris"] = {"Osiris",950000, ""},
    ["reaper"] = {"Reaper",1595000, ""},
    ["schafter3"] = {"Schafter V12",700000, ""},
    ["sultanrs"] = {"Sultan RS",180000, ""},
    ["t20"] = {"T20",2600000,""},
    ["turismor"] = {"Turismo R",1500000, ""},
    ["tyrus"] = {"Tyrus",550000, ""},
    ["vacca"] = {"Vacca",340000, ""},
    ["zentorno"] = {"Lamborghini Aventador",6200000,""},
    ["casco"] = {"Casco",680000, ""},
    ["coquette2"] = {"Coquette Classic",665000, ""},
    ["jb700"] = {"JB 700",450000, ""},
    ["pigalle"] = {"Pigalle",90000, ""},
	["firebird"] = {"Pontiac Firebird 1970",350000, ""},
    ["stinger"] = {"Stinger",550000, ""},
    ["stingergt"] = {"Stinger GT",575000, ""},
    ["feltzer3"] = {"Stirling",330000, ""},
    ["ztype"] = {"Z-Type",950000,""},
    ["asea"] = {"Asea",10000, ""},
    ["asterope"] = {"Asterope",10000, ""},
    ["blista"] = {"Blista", 15000, ""},
    ["brioso"] = {"Brioso R/A", 10000, ""},
    ["dilettante"] = {"Dilettante", 5000, ""},
    ["glendale"] = {"Glendale",8000, ""},
    ["journey"] = {"Journey",5000, ""},
    ["ingot"] = {"Ingot",9000, ""},
    ["issi2"] = {"Issi", 7000, ""},
    ["intruder"] = {"Intruder",62000, ""},
    ["panto"] = {"Panto", 2000, ""},
    ["penumbra"] = {"Penumbra", 10000, ""},
    ["picador"] = {"Picador",12000, ""},
    ["prairie"] = {"Prairie", 12000, ""},
    ["premier"] = {"Premier",10000, ""},
    ["primo"] = {"Primo",9000, ""},
    ["primo2"] = {"Primo Custom",9500, ""},
    ["regina"] = {"Regina",8000, ""},
    ["rhapsody"] = {"Rhapsody", 5000, ""},
    ["rumpo"] = {"Rumpo",13000, ""},
    ["stanier"] = {"Stanier",10000, ""},
    ["stratum"] = {"Stratum",7000, ""},
    ["surge"] = {"Surge",120000, ""},
    ["warrener"] = {"Warrener",7000, ""},
    ["washington"] = {"Washington",15000, ""},
    ["windsor"] = {"Windsor",45000, ""},
    ["brawler"] = {"Brawler",600000, ""},
    ["dubsta3"] = {"Dubsta 6x6",180000, ""},
    ["rebel2"] = {"Rebel",15000, ""},
	["fordh"] = {"Ford H",500000, ""},
    ["sandking"] = {"Sandking",120000, ""},
    ["trophytruck"] = {"Gr�n Trophytruck",525000, ""},
    ["bison"] = {"Bison",30000, ""},
    ["blade"] = {"Blade",16000, ""},
    ["bobcatxl"] = {"Bobcat XL",25000, ""},
    ["buccaneer"] = {"Buccaneer",29000, ""},
    ["cavalcade"] = {"Cavalcade",30000, ""},
    ["Chino"] = {"Chino",18000, ""},
    ["cognoscenti"] = {"Cognoscenti",25000, ""},
    ["dukes"] = {"Dukes",20000, ""},
    ["faction"] = {"Faction",23000, ""},
    ["s63w222"] = {"Mercedes AMG S63",550000, ""},
    ["teslax"] = {"Tesla X",1950000, ""},
    ["ast"] = {"Aston Martin Vanquish",450000, ""},
    ["A4"] = {"Audi A4",400000, ""},
    ["felon2"] = {"Felon GT", 93000, ""},
    ["fugitive"] = {"Maserati",675000, ""},
    ["hotknife"] = {"Hotknife",23000, ""},
    ["jackal"] = {"Jackal", 18000, ""},
    ["landstalker"] = {"Landstalker",30000, ""},
    ["minivan"] = {"Minivan",30000, ""},
    ["omnis"] = {"Omnis",18000, ""},
    ["oracle"] = {"Oracle", 20000, ""},
    ["oracle2"] = {"Oracle XS",22000, ""},
    ["paradise"] = {"Paradise",17000, ""},
    ["radi"] = {"Radius",30000, ""},
    ["seminole"] = {"Seminole",30000, ""},
    ["stretch"] = {"Stretch",30000, ""},
    ["sultan"] = {"BMW M5",75000, ""},
    ["surfer"] = {"Surfer",20000, ""},
    ["tailgater"] = {"Tailgater",117000, ""},
    ["windsor2"] = {"Windsor Drop",23000, ""},
    ["youga"] = {"Youga",16000, ""},
    ["zion"] = {"Zion", 18000, ""},
    ["zion2"] = {"Zion Cabrio", 20000, ""},
    ["AKUMA"] = {"Akuma",9000, ""},
    ["bagger"] = {"Bagger",7000, ""},
    ["bati"] = {"Bati 801",5000, ""},
    ["bati2"] = {"Bati 801RR",10000, ""},
	["lectro"] = {"Lectro",10000, ""},
    ["carbonrs"] = {"Carbon RS",11000, ""},
    ["cliffhanger"] = {"Cliffhanger",125000, ""},
    ["double"] = {"Double T",9000, ""},
    ["enduro"] = {"Enduro",6000, ""},
    ["faggio2"] = {"Faggio",1000, ""},
    ["gargoyle"] = {"Gargoyle",10000, ""},
	["i8"] = {"BMW i8 2015",750000, ""},
    ["hakuchou"] = {"Hakuchou",20000, ""},
	["daemon"] = {"Harley Knucklehead",20000, ""},
    ["hexer"] = {"Hexer",15000, ""},
    ["innovation"] = {"Innovation",20000, ""},
    ["nemesis"] = {"Nemesis",32000, ""},
    ["pcj"] = {"PCJ-600",7000, ""},
    ["thrust"] = {"Thrust",12000, ""},
    ["vader"] = {"Vader",7000, ""},
    ["vindicator"] = {"Vindicator",12000,""},
    ["AKUMA"] = {"Akuma",9000, ""},
    ["bagger"] = {"Bagger",7000, ""},
	["lectro"] = {"BMW R75 Bobber",10000, ""},
    ["carbonrs"] = {"Carbon RS",11000, ""},
    ["cliffhanger"] = {"Cliffhanger",13000, ""},
	["f131"] = {"Confederate F131 Hellcat",45000, ""},
    ["double"] = {"Double T",9000, ""},
    ["enduro"] = {"Enduro",6000, ""},
    ["gargoyle"] = {"Gargoyle",12500, ""},
    ["hakuchou"] = {"Hakuchou",20000, ""},
    ["hexer"] = {"Hexer",15000, ""},
    ["innovation"] = {"Innovation",20000, ""},
    ["nemesis"] = {"Nemesis",12000, ""},
    ["ruffian"] = {"Ruffian",7000, ""},
    ["thrust"] = {"Thrust",12000, ""},
    ["vindicator"] = {"Vindicator",12000,""}
  },
  
  ["scootershoppen"] = {
  _config = {vtype="bike",blipid=226,blipcolor=4},
  ["faggio"] = {"scooter", 500, ""}
  },

  ["Motorcykler"] = {
  _config = {vtype="motorcyle",blipid=226,blipcolor=4},
  ["gargoyle"] = {"Gargoyle", 12500, ""},
  ["hexer"] = {"Hexer", 15000,""},
  ["bati"] = {"Bati", 5000,""},
  ["pcj"] = {"PCJ", 10000,""},
  ["sanchez"] = {"Sanchez", 11000,""},
  ["manchez"] = {"Manchez", 15000,""},
  ["bf400"] = {"BF400", 85000,""},
  ["zombiea"] = {"Zombie A", 25000,""},
  ["zombieb"] = {"Zombie B", 25000,""},
  ["defiler"] = {"Defiler", 7500,""},
  ["sanctus"] = {"Sanctus", 17500,""}
  },
  
  ["DR Byen"] = {
  _config = {vtype="car",blipid=56,blicolor=1, permissions = {"journalist.garage"}},
  ["burrito"] = {"DR Rapportage", 500, ""}
  },
  
  ["The Lost MC"] = {
  _config = {vtype="car", permissions = {"thelost.garage"}},
  ["burrito"] = {"Harley", 10000, ""},
  ["sanctus"] = {"Sanctus", 17500,""},
  ["gburrito"] = {"The Lost Vogn", 75000,""}
  },

  ["Taxa"] = {
  _config = {vtype="car", blipid=198, blipcolor=5, permissions = {"taxi.garage"}},
  ["taxi"] = {"Taxa", 0, ""},
  },

  ["PizzaManden"] = {
    _config = {vtype="car",permissions={"delivery.vehicle"}},
    ["vwcaddy"] = {"Pizzabil", 0, ""},
    },

  ["B�de"] = {
    _config = {vtype="boat",blipid=427,blipcolor=4},
	["seashark"] = {"Jetski",6000, ""},
	["jetmax"] = {"jetmax",100000, ""},
	["suntrap"] = {"suntrap",100000, ""}
    },
    
	["Helikopter Politiet"] = {
    _config = {vtype="helicopter", permissions = {"police.garage"}},
	["polmav"] = {"Politi helikopter",0,""}
    },
    
	["Helikopter EMS"] = {
	_config = {vtype="helicopter",blipid=0,blicolor=0, permissions = {"emergency.garage"}},
	["supervolito"] = {"EMS helikopter",0,""}
    },

    ["Advokat Garage"] = {
        _config = {vtype="car",blipid=0,blicolor=0, permissions = {"advokat.garage"}},
        ["c63w205"] = {"Advokat Bil",0,""}
    },
    
	["Politi Garage"] = {
    _config = {vtype="car", permissions = {"police.garage"}},
	["police"] = {"Mondeo Patrujle", 0, ""},
	["police2"] = {"Touran Patrujle", 0, ""},
    ["police3"] = {"Passat Patrujle", 0, ""},
    ["policeb3"] = {"MC Crosser", 0, ""},
	["sheriff"] = {"Mercedes Patruljevogn", 0, ""},
	["policers6"] = {"RS6 Patruljevogn", 0, ""},
        ["police6"] = {"Audi A4 Civil", 0, ""},
        ["riot"] = {"AKS Vogn", 0, ""},
        ["police7"] = {" BMW M5 Civil", 0, ""},
	["policeb1"] = {"MC Patrulje", 0, ""},
        ["pranger"] = {"Jeep SUV", 0, ""},
    ["policeold5"] = {"Indsatsledervogn", 0, ""},
   ["police4"] = {"Civil BMW", 0, ""},
    ["fbi"] = {"Civil Bil 1", 0, ""},
    ["fbi2"] = {"Civil Bil 2", 0, ""}
    },
    
	["EMS Bil"] = {
	_config = {vtype="car", permissions = {"emergency.garage"}},
    ["AMBULANCE"] = {"Ambulance",0, ""},
    ["audiems"] = {"Akut (Audi)",0, ""},
    ["emstesla"] = {"Tesla",0, ""},
    ["emsrs6"] = {"RS6",0, ""},
    ["ml63"] = {"mercedes (SUV)",0, ""}
    },

	["Post-Nord"] = {
     _config = {vtype="car",blipid=318,blipcolor=3, permissions = {"postnord.adgang"}},
    ["burrito"] = {"Postbil", 0, ""}  
    },

	["Cykler"] = {
	_config = {vtype="bike",blipid=226,blipcolor=62},
	["BMX"] = {"BMX", 500, ""},
	["fixter"] = {"By cykel", 1000, ""},
	["tribike3"] = {"tribike3", 6000, ""},
	["scorcher"] = {"Mountainbike", 3500, ""}
	},
	
	["Evers Auto"] = {
        _config = {vtype="car", permissions = {"repair.loadshop"}},
        ["flatbed3"] = {"Ladvogn", 0, ""},
        ["servicemech"] = {"Service Vogn", 0, ""}
        },

    ["Golfvogn"] = {
    _config = {vtype="car", permissions = {"vdealer.adgang"}},
    ["caddy3"] = {"Golfvogn", 0, ""}
    },
	
	["Minebilen"] = {
	_config = {vtype="car",blipid=318,blipcolor=4},
	["tiptruck"] = {"Minebilen", 0,""},
	}
}

-- {garage_type,x,y,z}
cfg.garages = {
  {"Politi Garage",449.77325439453,-1018.7691040039,28.513710021973}, -- Mission Row
  {"Politi Garage",1863.0129394531,3704.1630859375,33.439643859863}, -- Sandy
  {"Politi Garage",-452.27276611328,5994.9067382813,31.340549468994}, -- Paleto
  {"Evers Auto",-180.71308898926,-1289.0858154297,31.295963287354},
  {"Evers Auto",491.95962524414,-1331.3687744141,29.339441299438},
  {"EMS Bil",362.99652099609,-607.99822998047,28.710754394531},
  {"EMS Bil",293.85427856445,-610.22631835938,43.357330322266}, -- Pillbox
  {"Helikopter EMS",351.7134399414,-588.05847167968,74.165687561036},
  {"Helikopter Politiet",449.51892089844,-987.99310302734,43.691665649414},
  {"Helikopter Politiet",-475.13912963867,5988.3642578125,31.336708068848},
  {"Helikopter Politiet",1788.1052246094,3242.3937988281,44.120239257813},
  {"Advokat Garage",122.58226013184,-719.35632324219,42.028659820557},
  {"B�de",-785.62957763672,-1498.5974121094,-0.086649641394615},
  {"B�de",1571.1760253906,3845.3767089844,30.856819152832},
  {"B�de",-1806.4201660156,-988.86822509766,0.074662901461124},
  {"B�de",3845.25390625,4445.0776367188,-0.017860990017653},
  {"B�de",3633.9829101562,4974.7978515625,0.46025761961936},
  {"Post-Nord",-155.41665649414,-593.73345947266,32.424468994141},
  {"PizzaManden",299.38412475586,-955.16693115234,29.3925666809081},
  {"Taxa",915.24536132813,-165.7215423584,74.482749938965},
  {"Golfvogn",890.96435546875,-3238.0236816406,-98.28360748291},
  {"Minebilen",496.79681396484,-1970.5522460938,24.905403137207}
  
   --{"Politi Garage", 125.66471099854,-715.40802001953,42.028957366943}, -- random
--  {"Helikopter EMS",299.33676147461,-1453.4783935547,46.509490966797},
  --{"EMS Bil",302.59814453125,-1439.2489013672,29.800493240356,true},
  --{"EMS Bil",-454.65106201172,-339.94674682617,34.363471984863,true},
  --{"EMS Bil",-491.74639892578,-336.2275390625,34.372581481934,true},


  -- {"Politi Garage", 449.77325439453,-1018.7691040039,28.513710021973,true,true}, -- Mission Row
  -- {"Politi Garage", 1863.0129394531,3704.1630859375,33.439643859863,true,true}, -- Sandy
  -- {"Politi Garage", -452.27276611328,5994.9067382813,31.340549468994,true,true}, -- Paleto
  -- {"Evers Auto",-390.77584838867,-122.70574951172,38.682392120361,true,true},
  -- {"Evers Auto",491.95962524414,-1331.3687744141,29.339441299438,true,true},
  -- {"EMS Bil",362.99652099609,-607.99822998047,28.710754394531,true},
  -- {"EMS Bil",293.85427856445,-610.22631835938,43.357330322266,true,true}, -- Pillbox
  -- {"Helikopter EMS",351.7134399414,-588.05847167968,74.165687561036,true},
  -- {"Helikopter Politiet",449.51892089844,-987.99310302734,43.691665649414,true},
  -- {"Helikopter Politiet",-475.13912963867,5988.3642578125,31.336708068848,true},
  -- {"Helikopter Politiet",1788.1052246094,3242.3937988281,44.120239257813,true},
  -- {"Advokat Garage",122.58226013184,-719.35632324219,42.028659820557,true},
  -- {"B�de",-785.62957763672,-1498.5974121094,-0.086649641394615},
  -- {"B�de",1571.1760253906,3845.3767089844,30.856819152832},
  -- {"B�de",-1806.4201660156,-988.86822509766,0.074662901461124},
  -- {"B�de",3845.25390625,4445.0776367188,-0.017860990017653},
  -- {"B�de",3633.9829101562,4974.7978515625,0.46025761961936},
  -- {"Post-Nord",-155.41665649414,-593.73345947266,32.424468994141},
  -- {"PizzaManden",299.38412475586,-955.16693115234,29.3925666809081,false,false},
  -- {"Taxa", 915.24536132813,-165.7215423584,74.482749938965},
  -- {"Golfvogn", 890.96435546875,-3238.0236816406,-98.28360748291},
  -- {"Minebilen", 496.79681396484,-1970.5522460938,24.905403137207}
}

return cfg