vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

function deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

local vehshop = {
	opened = false,
	title = "Bil Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "BaBa Business",
			name = "main",
			buttons = {
				{name = "Custom", description = ""},
				{name = "Standard", description = ""},
			}
		},
		["Custom"] = {
			title = "Custom",
			name = "Custom",
			buttons = {
				{name = "Aston Martin", description = ''},
				{name = "Audi", description = ''},
				{name = "BMW", description = ''},
				{name = "Honda", description = ''},
				{name = "Lamborghini", description = ''},
				{name = "Mercedes Benz", description = ''},
				{name = "Nissan", description = ''},
				{name = "Porsche", description = ''},
				{name = "Volkswagen", description = ''},
				{name = "Andre", description = ''},
				--{name = "cycles", description = ''},
			}
		},
		["Aston Martin"] = {
			title = "Aston Martin",
			name = "Aston Martin",
			buttons = {
				{name = "Aston Martin Rapide", costs = 2500000, description = {}, model = "rapide"},
				{name = "Aston Martin Vanquish", costs = 4000000, description = {}, model = "ast"},				
			}
		},
		["Audi"] = {
			title = "Audi",
			name = "Audi",
			buttons = {
				{name = "Audi RS3", costs = 1000000, description = {}, model = "RS3"},
				{name = "Audi RS5", costs = 1500000, description = {}, model = "2014rs5"},
				{name = "Audi RS6", costs = 1750000, description = {}, model = "audirs6tk"},
				{name = "Audi S3", costs = 2000000, description = {}, model = "2015s3"},
				{name = "Audi S7", costs = 2500000, description = {}, model = "sq72016"},
				{name = "Audi A4", costs = 3000000, description = {}, model = "buffalo"},
				{name = "Audi RS7", costs = 5000000, description = {}, model = "RS7"},
				{name = "Audi R8", costs = 7000000, description = {}, model = "r8ppi"},
			}
		},
		["BMW"] = {
			title = "BMW",
			name = "BMW",
			buttons = {
				{name = "BMW M3E30", costs = 350000, description = {}, model = "m3e30"},
				{name = "BMW M2", costs = 1000000, description = {}, model = "m2"},
				{name = "BMW 760i", costs = 1500000, description = {}, model = "17m760i"},
				{name = "BMW M4", costs = 2000000, description = {}, model = "m4f82"},
				{name = "BMW M5", costs = 3000000, description = {}, model = "bmci"},
				{name = "BMW M6", costs = 4000000, description = {}, model = "m6f13"},
				{name = "BMW X6", costs = 5000000, description = {}, model = "x6m"},
				{name = "BMW S1000RR", costs = 5000000, description = {}, model = "bmws"},
			}
		},
		["Honda"] = {
			title = "Honda",
			name = "Honda",
			buttons = {
				{name = "Honda CB Twister", costs = 500000, description = {}, model = "CBTWISTER"},
				{name = "Honda CBR", costs = 800000, description = {}, model = "hcbr17"},
			}
		},
		["Lamborghini"] = {
			title = "Lamborghini",
			name = "Lamborghini",
			buttons = {
				{name = "Lamborghini Urus", costs = 6000000, description = {}, model = "urus2018"},
				{name = "Lamborghini Aventador", costs = 10000000, description = {}, model = "aventadors"},
			}
		},
		["Mercedes Benz"] = {
			title = "Mercedes Benz",
			name = "Mercedes Benz",
			buttons = {
				{name = "Mercedes A-Class", costs = 300000, description = {}, model = "macla"},
				{name = "Mercedes S-Class", costs = 500000, description = {}, model = "s600w220"},
				{name = "Mercedes Benz V250", costs = 750000, description = {}, model = "v250"},
				{name = "Mercedes Brabus 700", costs = 2500000, description = {}, model = "brabus700"},
				{name = "Mercedes Benz S63", costs = 2000000, description = {}, model = "s63w222"},
				{name = "Mercedes ML Brabus", costs = 1500000, description = {}, model = "mlbrabus"},
				{name = "Mercedes AMG GLE", costs = 3000000, description = {}, model = "gle"},
				{name = "Mercedes G65 AMG", costs = 4000000, description = {}, model = "g65amg"},
			}
		},
		["Nissan"] = {
			title = "Nissan",
			name = "Nissan",
			buttons = {
				{name = "Nissan Skyline", costs = 5500000, description = {}, model = "skyline"},
				{name = "Nissan GTR", costs = 8500000, description = {}, model = "gtr"},
			}
		},
		["Porsche"] = {
			title = "Porsche",
			name = "Porsche",
			buttons = {
				{name = "Porsche Cayenne S", costs = 1500000, description = {}, model = "pcs18"},
				{name = "Porsche Turismo", costs = 2000000, description = {}, model = "pturismo"},
				{name = "Porsche Panamera", costs = 3000000, description = {}, model = "palameila"},
				{name = "Porsche 911", costs = 5000000, description = {}, model = "p911r"},
			}
		},
		["Volkswagen"] = {
			title = "Volkswagen",
			name = "Volkswagen",
			buttons = {
				{name = "Volkswagen Golf 6", costs = 100000, description = {}, model = "golf6"},
				{name = "Volkswagen Polo", costs = 250000, description = {}, model = "polo2018"},
				{name = "Volkswagen Passat", costs = 500000, description = {}, model = "passat"},
			}
		},
		["Andre"] = {
			title = "Andre",
			name = "Andre",
			buttons = {
                {name = "Aerox Knallert", costs = 9000, description = {}, model = "aeroxr"},
				{name = "Peugeot 207", costs = 50000, description = {}, model = "207rc"},
				{name = "Citroen DS4", costs = 100000, description = {}, model = "ds4"},
				{name = "Toyota Camry", costs = 200000, description = {}, model = "schafter2"},
				{name = "Hexer", costs = 350000, description = {}, model = "hexer"},
				{name = "Jeep Wrangler", costs = 500000, description = {}, model = "rubi3d"},
				{name = "Dodge Challenger 392", costs = 1000000, description = {}, model = "srt392"},
				{name = "Dodge Viper", costs = 3000000, description = {}, model = "viper"},
				{name = "Tesla Model S", costs = 2500000, description = {}, model = "models"},
				{name = "Jaguar XFR", costs = 2500000, description = {}, model = "xfr"},
				{name = "Ford Mustang", costs = 2500000, description = {}, model = "mgt"},
				{name = "Bentley Mulsanne", costs = 3000000, description = {}, model = "bmm"},
				{name = "Cadillac Escalade", costs = 3000000, description = {}, model = "esv"},
				{name = "Range Rover Evoque", costs = 2000000, description = {}, model = "baller"},
				{name = "Range Rover Sport", costs = 3000000, description = {}, model = "svr14"},
				{name = "Ninja Kawasaki H2R", costs = 5000000, description = {}, model = "nh2r"},
				{name = "Maserati Ghibli", costs = 4000000, description = {}, model = "ghis2"},
				{name = "Chevrolet Corvette", costs = 5000000, description = {}, model = "c7"},
				{name = "Ferrari Portofino", costs = 6000000, description = {}, model = "ferporto"},
				{name = "Rolls Royce Wraith", costs = 10000000, description = {}, model = "wraith"},
				{name = "McLaren P1", costs = 15000000, description = {}, model = "p1"},
				{name = "Bugatti Veyron", costs = 20000000, description = {}, model = "adder"},
			}
		},
		["Standard"] = {
			title = "Standard",
			name = "Standard",
			buttons = {
				{name = "Akuma", costs = 50000, description = {}, model = "AKUMA"},
				{name = "Bagger", costs = 50000, description = {}, model = "bagger"},
				{name = "Bati 801", costs = 50000, description = {}, model = "bati"},
				{name = "Bati 801RR", costs = 50000, description = {}, model = "bati2"},
				{name = "BF400", costs = 50000, description = {}, model = "bf400"},
				{name = "Carbon RS", costs = 50000, description = {}, model = "carbonrs"},
				{name = "Cliffhanger", costs = 50000, description = {}, model = "cliffhanger"},
				{name = "Daemon", costs = 50000, description = {}, model = "daemon"},
				{name = "Double T", costs = 50000, description = {}, model = "double"},
				{name = "Enduro", costs = 50000, description = {}, model = "enduro"},
				{name = "Faggio", costs = 50000, description = {}, model = "faggio2"},
				{name = "Gargoyle", costs = 50000, description = {}, model = "gargoyle"},
				{name = "Hakuchou", costs = 50000, description = {}, model = "hakuchou"},
				{name = "Innovation", costs = 50000, description = {}, model = "innovation"},
				{name = "Lectro", costs = 50000, description = {}, model = "lectro"},
				{name = "Nemesis", costs = 50000, description = {}, model = "nemesis"},
				{name = "PCJ-600", costs = 50000, description = {}, model = "pcj"},
				{name = "Ruffian", costs = 50000, description = {}, model = "ruffian"},
				{name = "Sanchez", costs = 50000, description = {}, model = "sanchez"},
				{name = "Thrust", costs = 50000, description = {}, model = "thrust"},
				{name = "Vader", costs = 50000, description = {}, model = "vader"},
				{name = "Vindicator", costs = 50000, description = {}, model = "vindicator"},
				{name = "Blista", costs = 100000, description = {}, model = "blista"},
				{name = "Issi", costs = 100000, description = {}, model = "issi2"},
				{name = "Golf", costs = 100000, description = {}, model = "golf6"},
				{name = "Dilettante", costs = 100000, description = {}, model = "Dilettante"},
				{name = "Prairie", costs = 100000, description = {}, model = "prairie"},
				{name = "Panto", costs = 100000, description = {}, model = "panto"},
				{name = "Rhapsody", costs = 100000, description = {}, model = "rhapsody"},
				{name = "Brioso R/A", costs = 100000, description = {}, model = "brioso"},
				{name = "Bison", costs = 150000, description = {}, model = "bison"},
				{name = "Bobcat XL", costs = 150000, description = {}, model = "bobcatxl"},
				{name = "Gang Burrito", costs = 150000, description = {}, model = "gburrito"},
				{name = "Journey", costs = 150000, description = {}, model = "journey"},
				{name = "Minivan", costs = 150000, description = {}, model = "minivan"},
				{name = "Paradise", costs = 150000, description = {}, model = "paradise"},
				{name = "Rumpo", costs = 150000, description = {}, model = "rumpo"},
				{name = "Surfer", costs = 150000, description = {}, model = "surfer"},
				{name = "Youga", costs = 150000, description = {}, model = "youga"},
				{name = "Bifta", costs = 200000, description = {}, model = "bifta"},
				{name = "Blazer", costs = 200000, description = {}, model = "blazer"},
				{name = "Brawler", costs = 200000, description = {}, model = "brawler"},
				{name = "Bubsta 6x6", costs = 200000, description = {}, model = "dubsta3"},
				{name = "Dune Buggy", costs = 200000, description = {}, model = "dune"},
				{name = "Rebel", costs = 200000, description = {}, model = "rebel2"},
				{name = "Sandking", costs = 200000, description = {}, model = "sandking"},
				{name = "The Liberator", costs = 200000, description = {}, model = "monster"},
				{name = "Trophy Truck", costs = 200000, description = {}, model = "trophytruck"},
				{name = "Blade", costs = 250000, description = {}, model = "blade"},
				{name = "Buccaneer", costs = 250000, description = {}, model = "buccaneer"},
				{name = "Chino", costs = 250000, description = {}, model = "chino"},
				{name = "Coquette BlackFin", costs = 250000, description = {}, model = "coquette3"},
				{name = "Dominator", costs = 250000, description = {}, model = "dominator"},
				{name = "Dukes", costs = 250000, description = {}, model = "dukes"},
				{name = "Gauntlet", costs = 250000, description = {}, model = "gauntlet"},
				{name = "Hotknife", costs = 250000, description = {}, model = "hotknife"},
				{name = "Faction", costs = 250000, description = {}, model = "faction"},
				{name = "Nightshade", costs = 250000, description = {}, model = "nightshade"},
				{name = "Picador", costs = 250000, description = {}, model = "picador"},
				{name = "Sabre Turbo", costs = 250000, description = {}, model = "sabregt"},
				{name = "Tampa", costs = 250000, description = {}, model = "tampa"},
				{name = "Virgo", costs = 250000, description = {}, model = "virgo"},
				{name = "Vigero", costs = 250000, description = {}, model = "vigero"},
				{name = "Asea", costs = 300000, description = {}, model = "asea"},
				{name = "Asterope", costs = 300000, description = {}, model = "asterope"},
				{name = "Cognoscenti", costs = 300000, description = {}, model = "cognoscenti"},
				{name = "Cognoscenti(Armored)", costs = 300000, description = {}, model = "cognoscenti2"},
				{name = "Cognoscenti 55", costs = 300000, description = {}, model = "cog55"},
				{name = "Cognoscenti 55(Armored", costs = 300000, description = {}, model = "cog552"},
				{name = "Fugitive", costs = 300000, description = {}, model = "fugitive"},
				{name = "Glendale", costs = 300000, description = {}, model = "glendale"},
				{name = "Ingot", costs = 300000, description = {}, model = "ingot"},
				{name = "Intruder", costs = 300000, description = {}, model = "intruder"},
				{name = "Premier", costs = 300000, description = {}, model = "premier"},
				{name = "Primo", costs = 300000, description = {}, model = "primo"},
				{name = "Primo Custom", costs = 300000, description = {}, model = "primo2"},
				{name = "Regina", costs = 300000, description = {}, model = "regina"},
				{name = "Stanier", costs = 300000, description = {}, model = "stanier"},
				{name = "Stratum", costs = 300000, description = {}, model = "stratum"},
				{name = "Stretch", costs = 300000, description = {}, model = "stretch"},
				{name = "Super Diamond", costs = 300000, description = {}, model = "superd"},
				{name = "Surge", costs = 300000, description = {}, model = "surge"},
				{name = "Tailgater", costs = 300000, description = {}, model = "tailgater"},
				{name = "Warrener", costs = 300000, description = {}, model = "warrener"},
				{name = "Washington", costs = 300000, description = {}, model = "washington"},	
				{name = "Jackal", costs = 400000, description = {}, model = "jackal"},
				{name = "Zion", costs = 400000, description = {}, model = "zion"},
				{name = "Sentinel XS", costs = 400000, description = {}, model = "sentinel2"},
				{name = "Zion Cabrio", costs = 400000, description = {}, model = "zion2"},
				{name = "Windsor", costs = 400000, description = {}, model = "windsor"},
				{name = "Oracle", costs = 400000, description = {}, model = "oracle"},
				{name = "F620", costs = 400000, description = {}, model = "f620"},
				{name = "Oracle XS", costs = 400000, description = {}, model = "oracle2"},
				{name = "Windsor Drop", costs = 400000, description = {}, model = "windsor2"},
				{name = "Sentinel", costs = 400000, description = {}, model = "sentinel"},
				{name = "Felon", costs = 400000, description = {}, model = "felon"},
				{name = "Felon GT", costs = 400000, description = {}, model = "felon2"},
				{name = "Cognoscenti Cabrio", costs = 400000, description = {}, model = "cogcabrio"},
				{name = "Exemplar", costs = 400000, description = {}, model = "exemplar"},
				{name = "9F", costs = 400000, description = {}, model = "ninef"},
				{name = "9F Cabrio", costs = 400000, description = {}, model = "ninef2"},
				{name = "Alpha", costs = 400000, description = {}, model = "alpha"},
				{name = "Banshee", costs = 400000, description = {}, model = "banshee"},
				{name = "Bestia GTS", costs = 400000, description = {}, model = "bestiagts"},
				{name = "Buffalo S", costs = 400000, description = {}, model = "buffalo2"},
				{name = "Carbonizzare", costs = 400000, description = {}, model = "carbonizzare"},
				{name = "Comet", costs = 400000, description = {}, model = "comet2"},
				{name = "Coquette", costs = 400000, description = {}, model = "coquette"},
				{name = "Drift Tampa", costs = 400000, description = {}, model = "tampa2"},
				{name = "Feltzer", costs = 400000, description = {}, model = "feltzer2"},
				{name = "Furore GT", costs = 400000, description = {}, model = "furoregt"},
				{name = "Fusilade", costs = 400000, description = {}, model = "fusilade"},
				{name = "Jester", costs = 400000, description = {}, model = "jester"},
				{name = "Jester(Racecar)", costs = 400000, description = {}, model = "jester2"},
				{name = "Kuruma", costs = 400000, description = {}, model = "kuruma"},
				{name = "Lynx", costs = 400000, description = {}, model = "lynx"},
				{name = "Massacro", costs = 400000, description = {}, model = "massacro"},
				{name = "Massacro(Racecar)", costs = 400000, description = {}, model = "massacro2"},
				{name = "Omnis", costs = 400000, description = {}, model = "omnis"},
				{name = "Penumbra", costs = 400000, description = {}, model = "penumbra"},
				{name = "Rapid GT", costs = 400000, description = {}, model = "rapidgt"},
				{name = "Rapid GT Convertible", costs = 400000, description = {}, model = "rapidgt2"},
				{name = "Schafter V12", costs = 400000, description = {}, model = "schafter3"},
				{name = "Sultan", costs = 400000, description = {}, model = "sultan"},
				{name = "Surano", costs = 400000, description = {}, model = "surano"},
				{name = "Tropos", costs = 400000, description = {}, model = "tropos"},
				{name = "Verkierer", costs = 400000, description = {}, model = "verlierer2"},
				{name = "Casco", costs = 750000, description = {}, model = "casco"},
				{name = "Coquette Classic", costs = 750000, description = {}, model = "coquette2"},
				{name = "JB 700", costs = 750000, description = {}, model = "jb700"},
				{name = "Pigalle", costs = 750000, description = {}, model = "pigalle"},
				{name = "Stinger", costs = 750000, description = {}, model = "stinger"},
				{name = "Stinger GT", costs = 750000, description = {}, model = "stingergt"},
				{name = "Stirling GT", costs = 750000, description = {}, model = "feltzer3"},
				{name = "Z-Type", costs = 750000, description = {}, model = "ztype"},
				{name = "Banshee 900R", costs = 1000000, description = {}, model = "banshee2"},
				{name = "Bullet", costs = 1000000, description = {}, model = "bullet"},
				{name = "Cheetah", costs = 1000000, description = {}, model = "cheetah"},
				{name = "Entity XF", costs = 1000000, description = {}, model = "entityxf"},
				{name = "ETR1", costs = 1000000, description = {}, model = "sheava"},
				{name = "FMJ", costs = 1000000, description = {}, model = "fmj"},
				{name = "Infernus", costs = 1000000, description = {}, model = "infernus"},
				{name = "Osiris", costs = 1000000, description = {}, model = "osiris"},
				{name = "RE-7B", costs = 1000000, description = {}, model = "le7b"},
				{name = "Reaper", costs = 1000000, description = {}, model = "reaper"},
				{name = "Sultan RS", costs = 1000000, description = {}, model = "sultanrs"},
				{name = "T20", costs = 1000000, description = {}, model = "t20"},
				{name = "Turismo R", costs = 1000000, description = {}, model = "turismor"},
				{name = "Tyrus", costs = 1000000, description = {}, model = "tyrus"},
				{name = "Vacca", costs = 1000000, description = {}, model = "vacca"},
				{name = "Voltic", costs = 1000000, description = {}, model = "voltic"},
				{name = "X80 Proto", costs = 1000000, description = {}, model = "prototipo"},
				{name = "Zentorno", costs = 1000000, description = {}, model = "zentorno"},
			}
		},
	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {
{entering = {-34.135414123536,-1101.555053711,26.42233467102}, inside = {-34.135414123536,-1101.555053711,26.42233467102}, outside = {-34.135414123536,-1101.555053711,26.42233467102}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 
	vehSR_ShowVehshopBlips(true)
	firstspawn = 1
end
end)

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Bilforhandler")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 3 then
						DrawMarker(27,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						vehSR_drawTxt("Pres [~g~E~s~] for at købe en ~b~bil",0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-52.116516113282,-1076.3431396484,27.222295761108})
			vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,38) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Andre" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Lamborghini" or vehshop.currentmenu == "Honda" or vehshop.currentmenu == "Nissan" or vehshop.currentmenu == "Mercedes Benz" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Standard" then
							vehSR_drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Andre" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Lamborghini" or vehshop.currentmenu == "Honda" or vehshop.currentmenu == "Nissan" or vehshop.currentmenu == "Mercedes Benz" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Standard" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								local timer = 0
								while not HasModelLoaded(hash) and timer < 255 do
									Citizen.Wait(1)
									vehSR_drawTxt("Loading...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									RequestModel(hash)
									timer = timer + 1
								end
								if timer < 255 then
									local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(1)
										vehSR_drawTxt("Loading...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									--SetEntityCollision(veh,false,false)
									TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								else
									timer = 0
									while timer < 50 do
										Citizen.Wait(1)
										vehSR_drawTxt("Failed!",0,1,0.5,0.5,1.5,255,0,0,255)
										timer = timer + 1
									end
									if last_dir then
										if vehshop.selectedbutton < buttoncount then
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										else
											last_dir = false
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										end
									else
										if vehshop.selectedbutton > 1 then
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										else
											last_dir = true
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Custom" then
			vehSR_OpenMenu('Custom')
		elseif btn == "Standard" then
			vehSR_OpenMenu('Standard')
		end
	elseif this == "Custom" then
		if btn == "BMW" then
			vehSR_OpenMenu('BMW')
		elseif btn == "Andre" then
			vehSR_OpenMenu('Andre')
		elseif btn == "Aston Martin" then
			vehSR_OpenMenu('Aston Martin')
		elseif btn == "Audi" then
			vehSR_OpenMenu('Audi')
		elseif btn == "Volkswagen" then
			vehSR_OpenMenu("Volkswagen")
		elseif btn == "Lamborghini" then
			vehSR_OpenMenu('Lamborghini')
		elseif btn == "Honda" then
			vehSR_OpenMenu('Honda')
		elseif btn == "Nissan" then
			vehSR_OpenMenu('Nissan')
		elseif btn == "Mercedes Benz" then
			vehSR_OpenMenu('Mercedes Benz')
		elseif btn == "Porsche" then
			vehSR_OpenMenu('Porsche')
		end
	elseif this == "BMW" or this == "Andre" or this == "Aston Martin" or this == "Audi" or this == "Volkswagen" or this == "Lamborghini" or this == "Honda" or this == "Nissan" or this == "Mercedes Benz" or this == "Porsche" or this == "industrial" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "car")
    elseif this == "cycles" or this == "Standard" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "bike")
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Custom" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Andre" or vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Lamborghini" or vehshop.currentmenu == "Honda" or vehshop.currentmenu == "Nissan" or vehshop.currentmenu == "Mercedes Benz" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Standard" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end