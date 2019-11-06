local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
	["Våbensmugling"] = {
		_config = {permissions = {"vdealer.adgang"}},
		["WEAPON_PISTOL_MK2"] = {"Pistol MK2",1750000,100,""},
		["WEAPON_MINISMG"] = {"Mini SMG",1750000,100,""},
                ["WEAPON_MicroSMG"] = {"Uzi",2750000,100,""},
                ["WEAPON_SNSPistol"] = {"SNS Pistol",875000,100,""},
                ["WEAPON_CompactRifle"] = {"Mini AK",3000000,100,""},
		["ARMOR1"] = {"Skudsikker vest",75000,0,""},
		["WEAPON_PISTOL50"] = {"PISTOL50",1750000,100,""}

	},
	["Våbenbutik"] = {
		_config = {blipid=110,blipcolor=1},
		["WEAPON_KNIFE"] = {"Kniv",20000,0,""},
		["WEAPON_KNUCKLE"] = {"Knojern",5000,0,""},
		["WEAPON_FLASHLIGHT"] = {"Lommelygte",5000,0,""},
        ["WEAPON_WRENCH"] = {"Svensknøgle",2000,0,""},
        ["WEAPON_BATTLEAXE"] = {"Kampøkse",20000,0,""},
        ["WEAPON_BALL"] = {"Baseball bold",5000,0,""},
		["WEAPON_GOLFCLUB"] = {"Golfkølle",2500,0,""},
		["WEAPON_CROWBAR"] = {"Brækjern",2000,0,""},
		["WEAPON_BAT"] = {"Baseballbat",2500,0,""},
        ["WEAPON_HAMMER"] = {"Hammer",2500,0,""}
	},
	["Politi"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"police.bodyarmor"}},
		["ARMOR"] = {"Skudsikker vest",0,0,""}
	},
	["PolitiStationen"] = {
		_config = {permissions = {"police.bodyarmor"}},
		["WEAPON_COMBATPISTOL"] = {"Tjenestepistol",1,0,""},
		["WEAPON_STUNGUN"] = {"TAZER",1,0,""},
		["WEAPON_CARBINERIFLE"] = {"M4 CARBINE",1,0,""},
		["WEAPON_FLASHLIGHT"] = {"Lommelygte",1,0,""},
		["WEAPON_NIGHTSTICK"] = {"Politi stav", 1,0,""},
		["WEAPON_BZGAS"] = {"Tåregas",5,0,""},
		["WEAPON_SMG"] = {"SMG",1,0,""},
		["WEAPON_SNIPERRIFLE"] = {"Sniper",0,0,""}
	},
	["FBI Information"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"pet.whitelisted"}},
		["ARMOR"] = {"Skudsikker vest",0,0,""},
		["WEAPON_COMBATPISTOL"] = {"Håndpistol",0,0,""}
	}
}
-- list of gunshops positions

cfg.gunshops = {
	{"Våbensmugling", 908.30017089844,-3210.9877929688,-98.222038269042,false},
	{"Våbenbutik", 1692.41, 3758.22, 34.7053,false},
	{"Våbenbutik", 252.696, -48.2487, 69.941,false},
	{"Våbenbutik", 844.299, -1033.26, 28.1949,false},
	{"Våbenbutik", -331.624, 6082.46, 31.4548,false},
	{"Våbenbutik", -664.147, -935.119, 21.8292,false},
	{"Våbenbutik", -1305.4624, -392.4640, 36.6957,false},
	{"Våbenbutik", -1119.4880,2697.0866,18.554,false},
	{"Våbenbutik", 2569.62, 294.453, 108.735,false},
	{"Våbenbutik", -3172.6037,1085.7481,20.8387,false},
	{"Våbenbutik", 21.70, -1107.41, 29.79,false},
	{"Våbenbutik", 810.15, -2156.88, 29.61,false},
	{"Vargos", 144.83152770996,-2204.5622558594,4.6880202293396,false},
	{"Politi", 460.597,-981.05,30.68,true},
	{"Politi", 1843.2662353516,3701.8459472656,1.0599994659424,true},
	{"Politi", 136.02095031738,-738.97857666016,258.15194702148,true},
	{"PolitiStationen", 457.8508605957,-979.96411132813,30.689678192139},
	{"PolitiStationen", -449.67291259766,6010.1928710938,31.716402053833},
	{"PolitiStationen", 138.32569885254,-736.02966308594,258.15194702148},
	{"PolitiStationen", 1842.4401855469,3700.9916992188,1.060000538826}
}

return cfg