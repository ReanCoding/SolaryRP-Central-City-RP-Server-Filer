local cfg = {}

-- define market types like garages and weapons
-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the market)

cfg.market_types = {
  ["7-Eleven"] = {
    _config = {blipid=52, blipcolor=2},
    -- list itemid => price
    -- Drinks
    ["milk"] = 5,
    ["water"] = 20,
    ["coffee"] = 20,
    ["tea"] = 20,
    ["icetea"] = 15,
    ["orangejuice"] = 15,
    ["gocagola"] = 20,
    ["redgull"] = 30,
    ["cone"] = 10,
    ["lemonlimonad"] = 19,
    ["vodka"] = 65,
    --Food
    ["bread"] = 15,
    ["donut"] = 10,
    ["tacos"] = 20,
    ["sandwich"] = 35,
    ["kebab"] = 50,
    ["pdonut"] = 50,
    -- Ting der skal købes for at kunne bruge emoten
    ["cigaret"] = 25,
    ["ol"] = 25
    },

  ["emsshop"] = {
    _config = {permissions = {"emergency.market"}},
    ["medkit"] = 0,
	["water"] = 5,
  ["bread"] = 5,
  ["lægerapport"] = 0,
  ["pills"] =0,
  ["medicin"] = 0
  },
  
  ["Post-Nord Lageret"] = {
    _config = {blipid=473,blipcolor=3, permissions = {"postnord.adgang"}},
  ["pakke"] = 0,
	["brev"] = 0
  },

  ["Bilka"] = {
  _config = {blipid=52, blipcolor=68},
    ["water"] = 15,
    ["natrium"] = 20,
    ["sølvpapir"] = 20,
    ["strips"] = 35,
    --["pose"] = 35,
    ["milk"] = 5,
    ["water"] = 20,
    ["jern"] = 350,
    ["aluminium"] = 350,
    ["coffee"] = 20,
    ["tea"] = 20,
    ["icetea"] = 15,
    ["orangejuice"] = 15,
    ["gocagola"] = 20,
    ["redgull"] = 30,
    ["cone"] = 10,
    ["lemonlimonad"] = 19,
    ["vodka"] = 65,
    --Mad
    ["bread"] = 15,
    ["donut"] = 10,
    ["tacos"] = 20,
    ["sandwich"] = 35,
    ["kebab"] = 50,
    ["pdonut"] = 50,
    --Ting der skal haves for at lave emoten
    ["kikkert"] = 550,
    ["cigaret"] = 25,
    ["hammer"] = 250,
    ["fiskestang"] = 1150,
    ["kort"] = 175,
    ["ol"] = 25
  },
  
  ["Fængslet"] = {
  _config = {},
  ["bread"] = 1,
  ["water"] = 1
  },
  
   ["MacD"] = {
  _config = {blipid=78,blipcolor=60},
  ["Bigmac"] = 30,
  ["cct"] = 10,
  ["sodavand"] = 25,
  ["cheeseburger"] = 10
  },
  
  ["Bagmanden"] = {
   _config = {blipid=0, blipcolor=0},
  ["eddikesyre"] = 65,
  ["p2np"] = 65,
  ["isopropanol"] = 65,
  ["h2so4"] = 65,
  },
 
 ["Pizzeria"] = {
  _config = {blipid=483, blipcolor=64}, --
	["pizza"] = 25
  },

  ["Telefon shoppen"] = {
    _config = {blipid=606, blipcolor=77}, --
    ["oneplus"] = 4499,
    ["samsung"] = 4999,
    ["iphone"] = 6999
    },

  ["Sprøjter"] = {
    _config = {blipid=0, blipcolor=0}, --
    ["sprøjte"] = 50
    },

 ["Politiet"] = {
  _config = {permissions = {"police.loadshop"}}, -- -361.39273071289,275.39370727539,86.421989440918
    ["milk"] = 7,
    ["water"] = 5,
    ["coffee"] = 12,
    ["tea"] = 4,
    ["icetea"] = 8,
    ["orangejuice"] = 6,
    ["gocagola"] = 8,
    ["redgull"] = 17,
    ["lemonlimonad"] = 12,
    ["vodka"] = 45,
	  ["medkit"] = 0,
	  ["bread"] = 5,
    ["donut"] = 13,
    ["tacos"] = 26,
    ["sandwich"] = 13,
    ["kebab"] = 46,
    ["pdonut"] = 13
},
	
  ["Værktøjskasser"] = {
    _config = {permissions = {"repair.loadshop"}},
    ["repairkit"] = 25
  },

  ["Værktøjskasser"] = {
    _config = {permissions = {"repair.loadshop"}},
    ["repairkit"] = 25,
    ["kebab"] = 50,
    ["lemonlimonad"] = 20
  },

}

-- list of markets {type,x,y,z}

cfg.markets = {
  {"7-Eleven",128.1410369873, -1286.1120605469, 29.281036376953},
  {"7-Eleven",-47.522762298584,-1756.85717773438,29.4210109710693},
  {"7-Eleven",25.7454013824463,-1345.26232910156,29.4970207214355}, 
  {"7-Eleven",1135.57678222656,-981.78125,46.4157981872559}, 
  {"7-Eleven",1163.53820800781,-323.541320800781,69.2050552368164}, 
  {"7-Eleven",374.190032958984,327.506713867188,103.566368103027}, 
  {"7-Eleven",2555.35766601563,382.16845703125,108.622947692871}, 
  {"7-Eleven",2676.76733398438,3281.57788085938,55.2411231994629}, 
  {"7-Eleven",1960.50793457031,3741.84008789063,32.3437385559082},
  {"7-Eleven",1393.23828125,3605.171875,34.9809303283691}, 
  {"7-Eleven",1166.18151855469,2709.35327148438,38.15771484375}, 
  {"7-Eleven",547.987609863281,2669.7568359375,42.1565132141113}, 
  {"7-Eleven",1698.30737304688,4924.37939453125,42.0636749267578}, 
  {"7-Eleven",1729.54443359375,6415.76513671875,35.0372200012207}, 
  {"Post-Nord Lageret",-143.5256652832,-575.47430419922,32.424468994141}, 
  {"7-Eleven",-3243.9013671875,1001.40405273438,12.8307056427002}, 
  {"7-Eleven",-2967.8818359375,390.78662109375,15.0433149337769}, 
  {"7-Eleven",-3041.17456054688,585.166198730469,7.90893363952637}, 
  {"7-Eleven",-1820.55725097656,792.770568847656,138.113250732422}, 
  {"7-Eleven",-1486.76574707031,-379.553985595703,40.163387298584}, 
  {"7-Eleven",-1223.18127441406,-907.385681152344,12.3263463973999}, 
  {"7-Eleven",-707.408996582031,-913.681701660156,19.2155857086182},
  {"7-Eleven", -411.5983581543,6066.6064453125,31.500135421753},
  {"emsshop", 310.20764160156,-599.21459960938,43.29182434082},
 -- {"emsshop", 1842.2742919922,3674.9067382813,34.275478363037},
  {"Politiet", 436.2502746582,-986.72796630859,30.689582824707},
  {"Politiet", 1850.7177734375,3685.36328125,34.267036437988},
  {"Telefon shoppen", 393.54119873047,-832.41851806641,29.291698455811},
  {"Værktøjskasser", -200.89100646973,-1317.7557373047,31.089345932007},
  {"Værktøjskasser", 548.90466308594,-189.17837524414,54.481334686279},
  {"Bagmanden", 1099.7606201172,-3100.0666503906,-38.999954223633},
  {"Sprøjter", 316.58264160156,-588.38781738281,43.291797637939},
  {"Bilka", 68.886001586914,-1569.5915527344,29.597770690918}
}

  return cfg