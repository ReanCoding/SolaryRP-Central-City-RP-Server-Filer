local cfg = {}

cfg.inventory_weight_per_strength = 10 -- weight for an user inventory per strength level (no unit, but thinking in "kg" is a good norm)

-- default chest weight for vehicle trunks
cfg.default_vehicle_chest_weight = 5

-- define vehicle chest weight by model in lower case
cfg.vehicle_chest_weights = {
  --Aston martin
  ["rapide"] = 150,
  ["ast"] = 150,
  -- Audi
  ["RS3"] = 175,
  ["2014rs5"] = 150,
  ["audirs6tk"] = 250,
  ["2015s3"] = 200,
  ["sq72016"] = 500,
  ["buffalo"] = 250,
  ["RS7"] = 250,
  ["r8ppi"] = 150,
  ["demonhawk"] = 500,
-- BMW
  ["m3e30"] = 150,
  ["m2"] = 150,
  ["17m760i"] = 250,
  ["m4f82"] = 150,
  ["bmci"] = 250,
  ["m6f13"] = 150,
  ["x6m"] = 300,
  ["bmws"] = 25,
  ["z3m"] = 150,
  ["sentinel"] = 150,
  ["x5m13"] = 500,
-- Chevrolet
  ["1500dj"] = 1500,
  ["bison"] = 1250,
  ["c7"] = 150,
-- Ferrari
  ["ferporto"] = 150,
-- Honda
  ["crfsm"] = 25,
  ["hcbr17"] = 25,
-- Jaguar
  ["xfr"] = 250,
  ["fpace"] = 500,
-- Lamborghini
  ["urus2018"] = 350,
  ["aventadors"] = 150,
-- Land Rover
  ["baller"] = 400,
  ["svr14"] = 500,
-- Mercedes Benz
  ["macla"] = 150,
  ["s600w220"] = 250,
  ["v250"] = 1000,
  ["brabus700"] = 1250,
  ["s63w222"] = 250,
  ["mlbrabus"] = 350,
  ["gle"] = 300,
  ["g65amg"] = 750,
  ["brabus850"] = 200,
  ["cla45"] = 500,
-- Nissan
  ["qashqai16"] = 500,
  ["contender"] = 1250,
  ["skyline"] = 150,
  ["gtr"] = 150,
-- Porsche
  ["pcs18"] = 400,
  ["pturismo"] = 250,
  ["palameila"] = 250,
  ["p911r"] = 150,
-- Volkswagen
  ["blista2"] = 125,
  ["golf6"] = 175,
  ["polo2018"] = 200,
  ["passat"] = 250,
-- Andre
  ["aeroxr"] = 25,
  ["207rc"] = 175,
  ["clubgtr"] = 175,
  ["ds4"] = 175,
  ["schafter2"] = 250,
  ["rubi3d"] = 300,
  ["s60pole"] = 250,
  ["srt392"] = 200,
  ["viper"] = 150,
  ["models"] = 250,
  ["mgt"] = 200,
  ["bmm"] = 300, 
  ["nh2r"] = 25,
  ["ghis2"] = 250,
  ["wraith"] = 250,
  ["p1"] = 100,
  ["adder"] = 100,
-- standard
  ["AKUMA"] = 25,
  ["bagger"] = 25,
  ["bati"] = 25,
  ["bati2"] = 25,
  ["bf400"] = 25,
  ["carbonrs"] = 25,
  ["cliffhanger"] = 25,
  ["daemon"] = 25,
  ["double"] = 25,
  ["enduro"] = 25,
  ["faggio2"] = 25,
  ["gargoyle"] = 25,
  ["hakuchou"] = 25,
  ["hexer"] = 25,
  ["innovation"] = 25,
  ["lectro"] = 25,
  ["nemesis"] = 25,
  ["pcj"] = 25,
  ["ruffian"] = 25,
  ["sanchez"] = 25,
  ["thrust"] = 25,
  ["vader"] = 25,
  ["vindicator"] = 25,
  -- Compacts
  ["blista"] = 150,
  ["brioso"] = 150,
  ["Dilettante"] = 150,
  ["issi2"] = 150,
  ["panto"] = 150,
  ["prairie"] = 150,
  ["rhapsody"] = 150,
  -- Vans
  ["bison"] = 1000,
  ["bobcatxl"] = 1000,
  ["gburrito"] = 1000,
  ["journey"] = 1000,
  ["minivan"] = 1000,
  ["paradise"] = 1000,
  ["rumpo"] = 1000,
  ["surfer"] = 1000,
  ["youga"] = 1000,
  -- Offroad
  ["bifta"] = 75,
  ["blazer"] = 30,
  ["brawler"] = 200,
  ["dubsta3"] = 1500,
  ["dune"] = 1500,
  ["rebel2"] = 500,
  ["sandking"] = 1500,
  ["monster"] = 1500,
  ["trophytruck"] = 1500,
  -- Muscle
  ["blade"] = 200,
  ["buccaneer"] = 200,
  ["chino"] = 200,
  ["coquette3"] = 175,
  ["dominator"] = 200,
  ["dukes"] = 200,
  ["gauntlet"] = 200,
  ["hotknife"] = 175,
  ["faction"] = 200,
  ["nightshade"] = 200,
  ["picador"] = 200,
  ["sabregt"] = 200,
  ["tampa"] = 200,
  ["virgo"] = 200,
  ["vigero"] = 200,
  -- Coupe
  ["asea"] = 200,
  ["asterope"] = 200,
  ["cognoscenti"] = 200,
  ["cognoscenti2"] = 200,
  ["cog55"] = 200,
  ["cog552"] = 200,
  ["fugitive"] = 200,
  ["glendale"] = 200,
  ["ingot"] = 200,
  ["intruder"] = 200,
  ["premier"] = 200,
  ["primo"] = 200,
  ["primo2"] = 200,
  ["regina"] = 200,
  ["stanier"] = 200,
  ["stratum"] = 200,
  ["stretch"] = 200,
  ["superd"] = 200,
  ["surge"] = 200,
  ["tailgater"] = 200,
  ["warrener"] = 200,
  ["washington"] = 200,
  -- Sedans
  ["cogcabrio"] = 250,
  ["exemplar"] = 250,
  ["f620"] = 250,
  ["felon"] = 250,
  ["felon2"] = 250,
  ["jackal"] = 250,
  ["oracle"] = 250,
  ["oracle2"] = 250,
  ["sentinel"] = 250,
  ["sentinel2"] = 250,
  ["windsor"] = 250,
  ["windsor2"] = 250,
  ["zion"] = 250,
  ["zion2"] = 250,
  ["ninef"] = 250,
  ["ninef2"] = 250,
  ["alpha"] = 250,
  ["banshee"] = 250,
  ["bestiagts"] = 250,
  ["buffalo2"] = 250,
  ["carbonizzare"] = 250,
  ["comet2"] = 250,
  ["coquette"] = 250,
  ["tampa2"] = 250,
  ["feltzer2"] = 250,
  ["furoregt"] = 250,
  ["fusilade"] = 250,
  ["jester"] = 250,
  ["jester2"] = 250,
  ["kuruma"] = 250,
  ["lynx"] = 250,
  ["massacro"] = 250,
  ["massacro2"] = 250,
  ["omnis"] = 250,
  ["penumbra"] = 250,
  ["rapidgt"] = 250,
  ["rapidgt2"] = 250,
  ["schafter3"] = 250,
  ["sultan"] = 250,
  ["surano"] = 250,
  ["tropos"] = 250,
  ["verlierer2"] = 250,
  -- Klassisk
  ["casco"] = 200,
  ["coquette2"] = 200,
  ["jb700"] = 200,
  ["pigalle"] = 200,
  ["stinger"] = 200,
  ["stingergt"] = 200,
  ["ztype"] = 200,
  -- Super
  ["banshee2"] = 150,
  ["bullet"] = 150,
  ["cheetah"] = 150,
  ["entityxf"] = 150,
  ["sheava"] = 150,
  ["fmj"] = 150,
  ["infernus"] = 150,
  ["osiris"] = 150,
  ["le7b"] = 150,
  ["reaper"] = 150,
  ["sultanrs"] = 150,
  ["t20"] = 150,
  ["turismor"] = 150,
  ["tyrus"] = 150,
  ["vacca"] = 150,
  ["voltic"] = 150,
  ["prototipo"] = 150,
  ["zentorno"] = 150,
--Jobs
  ["taxi"] = 500,
  ["rubble"] = 1000,
  ["towtruck2"] = 1000,
  ["towtruck"] = 200,
  ["flatbed"] = 500,
  ["Sadler"] = 200,
  ["burrito"] = 500,
  ["AMBULANCE"] = 1000,
  ["audiems"] = 500,
  ["mercedesems"] = 500,
  ["emstesla"] = 500,
  ["emsrs6"] = 500,
  ["ml63"] = 750,
  ["AMBULANCE"] = 1000,
--Donationer
  ["evoque"] = 400, --Brown
  ["s8d4"] = 250, --Brown
  ["m5e60"] = 250, --Hamza
  ["mig"] = 150, --Schou
  ["lp770"] = 150, --Gekko
  ["regera"] = 150, --tom
  ["eleanor"] = 200, --Achmed
  ["tr22"] = 150, --Snalle
  ["amggts2016"] = 150, --Kr1z
  ["tesla"] = 500, --Hunter Police
  ["arteon"] = 500, --Jakob Police
  ["ar8lb"] = 150, --Hunter
  ["vantage"] = 150, --Jakob
  ["lwgtr"] = 200, --Tobias
  ["mst"] = 500, --Våbenhandlerbil
  ["chiron17"] = 250, --Bugatti
  ["c63w205"] = 250, --c63w295
  ["c63s"] = 250, --c63coupe
  ["mercxclass"] = 500,
  ["458speciale"] = 250, --ferrari458
  ["rrphantom"] = 250, --rolce
  ["sq72016"] = 500, --sq7
  ["180sx"] = 500, --Nissan80SX
  ["h6"] = 1000, --bossbil
  ["x5e53"] = 500, --bmwx5
--Event
  ["718rs"] = 100, --Porsche
  ["260gto62"] = 200, --Ferrari
  ["feltzer3"] = 200 --Mercedes
}

return cfg