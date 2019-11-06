--bind client tunnel interface
vRP = Proxy.getInterface("vRP")

local priceperdamage = 200

local lsc = {
	inside = false,
	title = "Tropical Mekaniker",
	currentmenu = "repair",
	lastmenu = nil,
	currentpos = nil,
	currentgarage = 0,
	selectedbutton = 0,
	locations = { -- LSCUSTOMS LOCATIONS -- ADD SERVER LOCKS TOO
		[1] = { locked = false, outside = { x = -362.7962, y = -132.4005, z = 38.25239, heading = 71.187133}, inside = {x = -337.3863,y = -136.9247,z = 38.5737, heading = 269.455}},
		[2] = { locked = false, outside = { x = -1140.191, y = -1985.478, z = 12.72923, heading = 315.290466}, inside = {x = -1155.536,y = -2007.183,z = 12.744, heading = 155.413}},
		[3] = { locked = false, outside = { x = 716.4645, y = -1088.869, z = 21.92979, heading = 88.768}, inside = {x = 731.8163,y = -1088.822,z = 21.733, heading = 269.318}},
		[4] = { locked = false, outside = { x = 1174.811, y = 2649.954, z = 37.37151, heading = 0.450}, inside = {x = 1175.04,y = 2640.216,z = 37.32177, heading = 182.402}},
		[5] = { locked = false, outside = { x = 118.6830, y = 6618.4130, z = 30.9185, heading = 0.450}, inside = {x = 110.8406,y = 6626.568, z = 31.787, heading = 182.402}},
		[6] = { locked = false, outside = { x = -189.8931, y = -1387.7177, z = 30.9185, heading = 0.450}, inside = {x = -189.8931, y = -1387.7177, z = 30.9185, heading = 182.402}},
		[7] = { locked = false, outside = { x = -205.8569, y = -1308.5686, z = 30.9185, heading = 0.450}, inside = {x = -210.9009, y = -1324.5775, z = 30.9185, heading = 182.402}},
	},
	menu = {
		x = 0.8,
		y = 0.1,
		width = 0.25,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		["bumpers"] = { 
			title = "Kofangere", 
			name = "bumpers",
			buttons = { 
			}
		},
		["frontbumper"] = { 
			title = "Forkofanger", 
			name = "frontbumper",
			buttons = { 

			}
		},
		["rearbumper"] = { 
			title = "Bagkofanger", 
			name = "rearbumper",
			buttons = { 

			}
		},
		["main"] = { 
			title = "Kategorier", 
			name = "main",
			buttons = { 
				
			}
		},["exhaust"] = { 
			title = "Udstødning", 
			name = "exhaust",
			buttons = { 
				
			}
		},
		["fenders"] = { 
			title = "Skærme", 
			name = "fenders",
			buttons = { 
				
			}
		},
		["grille"] = { 
			title = "Grill", 
			name = "grille",
			buttons = { 
				
			}
		},
		["hood"] = { 
			title = "Frontklap", 
			name = "hood",
			buttons = { 
				
			}
		},
		["rollcage"] = { 
			title = "Bur", 
			name = "rollcage",
			buttons = { 
				
			}
		},
		["roof"] = { 
			title = "Tag", 
			name = "roof",
			buttons = { 
				
			}
		},
		["skirts"] = { 
			title = "Skørter", 
			name = "skirts",
			buttons = { 
				
			}
		}
		,
		["spoiler"] = { 
			title = "Spoiler", 
			name = "spoiler",
			buttons = { 
				
			}
		},["wheeliebar"] = { 
			title = "Wheeliebar", 
			name = "wheeliebar",
			buttons = { 
				
			}
		},
		["chassis"] = { 
			title = "Karosseri", 
			name = "chassis",
			buttons = { 
				
			}
		}
	,["primarymetallic"] = { 
			title = "Primær Farve", 
			name = "primarymetallic",
			buttons = { 
				{name = "Sort",costs = 2500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Karbon Sort",costs = 2500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grafit",costs = 2500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Antracit Sort",costs = 2500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sort Stål",costs = 2500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkt Stål",costs = 2500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sølv",costs = 2500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blålig Sølv",costs = 2500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Valset Stål",costs = 2500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Skygge Sølv",costs = 2500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sten Sølv",costs = 2500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatssølv",costs = 2500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Støbejernsølv",costs = 2500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rød",costs = 2500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Rød",costs = 2500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formel Rød",costs = 2500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Rød",costs = 2500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Flammerød",costs = 2500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yndefuld Rød",costs = 2500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Rød",costs = 2500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solnedgang Rød",costs = 2500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Rød",costs = 2500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Vinrød",costs = 2500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slik Rød",costs = 2500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Varm Pink",costs = 2500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs = 2500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Laksrosa",costs = 2500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sol Orange",costs = 2500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs = 2500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Orange",costs = 2500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Guld",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs = 2500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul",costs = 2500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Gul",costs = 2500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dug Gul",costs = 2500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkegrøn",costs = 2500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Grøn",costs = 2500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havgrøn",costs = 2500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olivengrøn",costs = 2500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Grøn",costs = 2500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasolin Grøn",costs = 2500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limegrøn",costs = 2500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatsblå",costs = 2500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galakse Blå",costs = 2500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkeblå",costs = 2500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blå",costs = 2500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå",costs = 2500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Marineblå",costs = 2500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havneblå",costs = 2500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamant Blå",costs = 2500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surfer Blå",costs = 2500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Søfarts Blå",costs = 2500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Blå",costs = 2500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blå",costs = 2500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Blå",costs = 2500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolade Brun",costs = 2500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brun",costs = 2500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brun",costs = 2500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brun",costs = 2500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ahorn Brun",costs = 2500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bøgetræ Brun",costs = 2500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brun",costs = 2500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddel Brun",costs = 2500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mosbrun",costs = 2500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Amerikansk Bøg Brun",costs = 2500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Halmbrun",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandbrun",costs = 2500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Afbleget Brun",costs = 2500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Lilla",costs = 2500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spiler Lilla",costs = 2500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnats Lilla",costs = 2500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Lilla",costs = 2500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creme",costs = 2500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Is Hvid",costs = 2500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost Hvid",costs = 2500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["secondarymetallic"] = { 
			title = "Sekundær Farve", 
			name = "secondarymetallic",
			buttons = { 
				{name = "Sort",costs = 2500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Karbon Sort",costs = 2500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grafit",costs = 2500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Antracit Sort",costs = 2500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sort Stål",costs = 2500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkt Stål",costs = 2500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sølv",costs = 2500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blålig Sølv",costs = 2500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Valset Stål",costs = 2500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Skygge Sølv",costs = 2500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sten Sølv",costs = 2500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatssølv",costs = 2500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Støbejernsølv",costs = 2500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rød",costs = 2500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Rød",costs = 2500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formel Rød",costs = 2500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Rød",costs = 2500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Flammerød",costs = 2500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yndefuld Rød",costs = 2500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Rød",costs = 2500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solnedgang Rød",costs = 2500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Rød",costs = 2500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Vinrød",costs = 2500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slik Rød",costs = 2500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Varm Pink",costs = 2500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs = 2500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Laksrosa",costs = 2500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sol Orange",costs = 2500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs = 2500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Orange",costs = 2500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Guld",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs = 2500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul",costs = 2500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Gul",costs = 2500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dug Gul",costs = 2500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkegrøn",costs = 2500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Grøn",costs = 2500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havgrøn",costs = 2500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olivengrøn",costs = 2500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Grøn",costs = 2500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasolin Grøn",costs = 2500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limegrøn",costs = 2500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatsblå",costs = 2500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galakse Blå",costs = 2500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkeblå",costs = 2500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blå",costs = 2500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå",costs = 2500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Marineblå",costs = 2500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havneblå",costs = 2500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamant Blå",costs = 2500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surfer Blå",costs = 2500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Søfarts Blå",costs = 2500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Blå",costs = 2500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blå",costs = 2500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Blå",costs = 2500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolade Brun",costs = 2500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brun",costs = 2500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brun",costs = 2500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brun",costs = 2500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ahorn Brun",costs = 2500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bøgetræ Brun",costs = 2500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brun",costs = 2500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddel Brun",costs = 2500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mosbrun",costs = 2500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Amerikansk Bøg Brun",costs = 2500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Halmbrun",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandbrun",costs = 2500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Afbleget Brun",costs = 2500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Lilla",costs = 2500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spiler Lilla",costs = 2500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnats Lilla",costs = 2500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Lilla",costs = 2500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creme",costs = 2500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Is Hvid",costs = 2500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost Hvid",costs = 2500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},

		["primarymatte"] = { 
				title = "Primær Farve", 
				name = "primarymatte",
				buttons = { 
					{name = "Sort", colorindex = 12,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Grå", colorindex = 13,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Lys Grå", colorindex = 14,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Is Hvid", colorindex = 131,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Blå", colorindex = 83,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Mørkeblå", colorindex = 82,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnatsblå", colorindex = 84,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnatslilla", colorindex = 149,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Schafter Lilla", colorindex = 148,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Rød", colorindex = 39,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Mørkerød", colorindex = 40,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Orange", colorindex = 41,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Gul", colorindex = 42,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Limegrøn", colorindex = 55,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Grøn", colorindex = 128,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Frost Grøn", colorindex = 151,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Folie Grøn", colorindex = 155,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Olivengrøn", colorindex = 152,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Mørk Jord", colorindex = 153,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Gylden Sand", colorindex = 154,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["secondarymatte"] = { 
				title = "Sekundær Farve", 
				name = "secondarymatte",
				buttons = { 
					{name = "Sort", colorindex = 12,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Grå", colorindex = 13,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Lys Grå", colorindex = 14,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Is Hvid", colorindex = 131,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Blå", colorindex = 83,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Mørkeblå", colorindex = 82,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnatsblå", colorindex = 84,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnatslilla", colorindex = 149,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Schafter Lilla", colorindex = 148,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Rød", colorindex = 39,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Mørkerød", colorindex = 40,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Orange", colorindex = 41,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Gul", colorindex = 42,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Limegrøn", colorindex = 55,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Grøn", colorindex = 128,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Frost Grøn", colorindex = 151,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Folie Grøn", colorindex = 155,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Olivengrøn", colorindex = 152,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Mørk Jord", colorindex = 153,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Gylden Sand", colorindex = 154,costs = 3000, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["primarymetal"] = { 
				title = "Primær Farve", 
				name = "primarymetal",
				buttons = { 
					{name = "Børstet Stål",colorindex = 117,costs = 4000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Børstet Sort Stål",colorindex = 118,costs = 4000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Børstet Aluminium",colorindex = 119,costs = 4000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Ren Guld",colorindex = 158,costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Børstet Guld",colorindex = 159,costs = 6300, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["secondarymetal"] = { 
				title = "Sekundær Farve", 
				name = "secondarymetal",
				buttons = { 
					{name = "Børstet Stål",colorindex = 117,costs = 4000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Børstet Sort Stål",colorindex = 118,costs = 4000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Børstet Aluminium",colorindex = 119,costs = 4000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Ren Guld",colorindex = 158,costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Børstet Guld",colorindex = 159,costs = 6300, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["wheelcolor"] = { 
			title = "Fælgfarve", 
			name = "wheelcolor",
			buttons = { 
				{name = "Sort",costs = 2500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Karbon Sort",costs = 2500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grafit",costs = 2500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Antracit Sort",costs = 2500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sort Stål",costs = 2500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkt Stål",costs = 2500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sølv",costs = 2500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blålig Sølv",costs = 2500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Valset Stål",costs = 2500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Skygge Sølv",costs = 2500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sten Sølv",costs = 2500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatssølv",costs = 2500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Støbejernsølv",costs = 2500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rød",costs = 2500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Rød",costs = 2500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formel Rød",costs = 2500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Rød",costs = 2500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Flammerød",costs = 2500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yndefuld Rød",costs = 2500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Rød",costs = 2500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solnedgang Rød",costs = 2500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Rød",costs = 2500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Vinrød",costs = 2500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slik Rød",costs = 2500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Varm Pink",costs = 2500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs = 2500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Laksrosa",costs = 2500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sol Orange",costs = 2500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs = 2500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Orange",costs = 2500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Guld",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs = 2500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul",costs = 2500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Gul",costs = 2500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dug Gul",costs = 2500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkegrøn",costs = 2500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Grøn",costs = 2500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havgrøn",costs = 2500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olivengrøn",costs = 2500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Grøn",costs = 2500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasolin Grøn",costs = 2500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limegrøn",costs = 2500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatsblå",costs = 2500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galakse Blå",costs = 2500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkeblå",costs = 2500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blå",costs = 2500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå",costs = 2500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Marineblå",costs = 2500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havneblå",costs = 2500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamant Blå",costs = 2500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surfer Blå",costs = 2500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Søfarts Blå",costs = 2500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Blå",costs = 2500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blå",costs = 2500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Blå",costs = 2500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolade Brun",costs = 2500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brun",costs = 2500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brun",costs = 2500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brun",costs = 2500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ahorn Brun",costs = 2500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bøgetræ Brun",costs = 2500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brun",costs = 2500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddel Brun",costs = 2500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mosbrun",costs = 2500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Amerikansk Bøg Brun",costs = 2500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Halmbrun",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandbrun",costs = 2500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Afbleget Brun",costs = 2500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Lilla",costs = 2500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spiler Lilla",costs = 2500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnats Lilla",costs = 2500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Lilla",costs = 2500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creme",costs = 2500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Is Hvid",costs = 2500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost Hvid",costs = 2500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["windows"] = { 
			title = "Vinduer", 
			name = "windows",
			buttons = { 
				{name = "Ingen",tint = false, costs = 1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ren Sort",tint = 1, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkt Røg",tint = 2, costs = 4500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lyst Røg",tint = 3, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limo",tint = 4, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grøn",tint = 5, costs = 3000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["wheelaccessories"] = { 
			title = "Dæktilbehør", 
			name = "wheelaccessories",
			buttons = { 
				{name = "Almindelige Dæk", costs = 1000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hvid Tire Smoke", color = {254,254,254}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sort Tire Smoke", color = {1,1,1}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå Tire Smoke", color = {0,150,255}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul Tire Smoke", color = {255,255,50}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange Tire Smoke", color = {255,153,51}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rød Tire Smoke", color = {255,10,10}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grøn Tire Smoke", color = {10,255,10}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lilla Tire Smoke", color = {153,10,153}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pink Tire Smoke", color = {255,102,178}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grå Tire Smoke", color = {128,128,128}, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["respray"] = { 
			title = "Maling", 
			name = "respray",
			buttons = { 
				{name = "Primær Farve", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sekundær Farve", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["primarycolor"] = { 
			title = "Farvegrupper", 
			name = "primarycolor",
			buttons = { 
				{name = "Krom", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mat", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metallisk", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metal", description = "", centre = 0, font = 0, scale = 0.4}
			}
		}
		,
		["secondarycolor"] = { 
			title = "Farvegrupper", 
			name = "secondarycolor",
			buttons = { 
				{name = "Krom", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mat", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metallisk", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metal", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["primarychrome"] = { 
			title = "Primær Farve", 
			name = "primarycolchrome",
			buttons = { 
				{name = "Krom", costs = 25000, colorindex = 120, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["secondarychrome"] = { 
			title = "Sekundær Farve", 
			name = "secondarycolchrome",
			buttons = { 
				{name = "Krom", costs = 25000, colorindex = 120, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},

		["primaryclassic"] = { 
			title = "Primær Farve", 
			name = "primaryclassic",
			buttons = { 
				{name = "Sort",costs = 2500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Karbon Sort",costs = 2500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grafit",costs = 2500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Antracit Sort",costs = 2500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sort Stål",costs = 2500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkt Stål",costs = 2500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sølv",costs = 2500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blålig Sølv",costs = 2500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Valset Stål",costs = 2500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Skygge Sølv",costs = 2500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sten Sølv",costs = 2500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatssølv",costs = 2500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Støbejernsølv",costs = 2500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rød",costs = 2500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Rød",costs = 2500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formel Rød",costs = 2500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Rød",costs = 2500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Flammerød",costs = 2500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yndefuld Rød",costs = 2500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Rød",costs = 2500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solnedgang Rød",costs = 2500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Rød",costs = 2500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Vinrød",costs = 2500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slik Rød",costs = 2500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Varm Pink",costs = 2500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs = 2500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Laksrosa",costs = 2500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sol Orange",costs = 2500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs = 2500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Orange",costs = 2500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Guld",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs = 2500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul",costs = 2500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Gul",costs = 2500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dug Gul",costs = 2500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkegrøn",costs = 2500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Grøn",costs = 2500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havgrøn",costs = 2500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olivengrøn",costs = 2500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Grøn",costs = 2500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasolin Grøn",costs = 2500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limegrøn",costs = 2500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatsblå",costs = 2500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galakse Blå",costs = 2500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkeblå",costs = 2500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blå",costs = 2500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå",costs = 2500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Marineblå",costs = 2500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havneblå",costs = 2500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamant Blå",costs = 2500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surfer Blå",costs = 2500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Søfarts Blå",costs = 2500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Blå",costs = 2500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blå",costs = 2500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Blå",costs = 2500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolade Brun",costs = 2500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brun",costs = 2500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brun",costs = 2500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brun",costs = 2500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ahorn Brun",costs = 2500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bøgetræ Brun",costs = 2500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brun",costs = 2500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddel Brun",costs = 2500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mosbrun",costs = 2500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Amerikansk Bøg Brun",costs = 2500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Halmbrun",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandbrun",costs = 2500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Afbleget Brun",costs = 2500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Lilla",costs = 2500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spiler Lilla",costs = 2500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnats Lilla",costs = 2500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Lilla",costs = 2500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creme",costs = 2500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Is Hvid",costs = 2500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost Hvid",costs = 2500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["secondaryclassic"] = { 
			title = "Sekundær Farve", 
			name = "secondaryclassic",
			buttons = { 
				{name = "Sort",costs = 2500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Karbon Sort",costs = 2500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grafit",costs = 2500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Antracit Sort",costs = 2500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sort Stål",costs = 2500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkt Stål",costs = 2500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sølv",costs = 2500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blålig Sølv",costs = 2500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Valset Stål",costs = 2500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Skygge Sølv",costs = 2500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sten Sølv",costs = 2500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatssølv",costs = 2500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Støbejernsølv",costs = 2500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rød",costs = 2500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Rød",costs = 2500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formel Rød",costs = 2500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Rød",costs = 2500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Flammerød",costs = 2500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yndefuld Rød",costs = 2500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Rød",costs = 2500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solnedgang Rød",costs = 2500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Rød",costs = 2500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Vinrød",costs = 2500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slik Rød",costs = 2500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Varm Pink",costs = 2500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs = 2500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Laksrosa",costs = 2500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sol Orange",costs = 2500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs = 2500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Orange",costs = 2500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Guld",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs = 2500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul",costs = 2500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Gul",costs = 2500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dug Gul",costs = 2500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkegrøn",costs = 2500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Grøn",costs = 2500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havgrøn",costs = 2500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olivengrøn",costs = 2500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Grøn",costs = 2500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasolin Grøn",costs = 2500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limegrøn",costs = 2500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnatsblå",costs = 2500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galakse Blå",costs = 2500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mørkeblå",costs = 2500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blå",costs = 2500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå",costs = 2500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Marineblå",costs = 2500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Havneblå",costs = 2500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamant Blå",costs = 2500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surfer Blå",costs = 2500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Søfarts Blå",costs = 2500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Blå",costs = 2500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blå",costs = 2500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Blå",costs = 2500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolade Brun",costs = 2500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brun",costs = 2500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brun",costs = 2500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brun",costs = 2500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ahorn Brun",costs = 2500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bøgetræ Brun",costs = 2500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brun",costs = 2500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddel Brun",costs = 2500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mosbrun",costs = 2500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Amerikansk Bøg Brun",costs = 2500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Halmbrun",costs = 2500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandbrun",costs = 2500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Afbleget Brun",costs = 2500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Lilla",costs = 2500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spiler Lilla",costs = 2500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnats Lilla",costs = 2500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lys Lilla",costs = 2500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creme",costs = 2500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Is Hvid",costs = 2500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost Hvid",costs = 2500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},["suspension"] = { 
			title = "Affjedring", 
			name = "suspensions",
			buttons = { 
				{name = "Almindelig Affjedring",mod = -1,modtype =15, costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sænket Affjedring",mod = false,modtype =15, costs = 12500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gade Affjedring",mod = 1,modtype =15, costs = 14500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sport Affjedring",mod = 2,modtype =15, costs = 16000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Konkurrence Affjedring",mod = 3,modtype =15, costs = 18000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["transmission"] = { 
			title = "Gearkasse", 
			name = "transmission",
			buttons = { 
				{name = "Almindelig Gearkasse",mod = -1,modtype =13, costs = 5000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gade Gearkasse",mod = false,modtype =13, costs = 12000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sports Gearkasse",mod = 1,modtype =13, costs = 18000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Gearkasse",mod = 2,modtype =13, costs = 31000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		}
		,
		["turbo"] = { 
			title = "Turbo", 
			name = "turbo",
			buttons = { 
				{name = "Ingen",mod = false,modtype =18, costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Turbo",mod = true,modtype =18, costs = 21000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["wheels"] = { 
			title = "Dæk", 
			name = "wheels",
			buttons = { 
				{name = "Fælgtyper", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fælgfarve", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dæktilbehør", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["wheeltype"] = { 
			title = "Fælgtyper", 
			name = "wheeltype",
			buttons = { 
				{name = "Sport", wtype = false, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Muscle", wtype = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lowrider", wtype = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "SUV", wtype = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Offroad", wtype = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Tuner", wtype = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Highend", wtype = 7, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["sport"] = { 
			title = "Sport", 
			name = "sport",
			buttons = { 
				{name = "Almindelig", wtype = false, modtype = 23, mod = -1, costs = 2000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Inferno", wtype = false, modtype = 23, mod = false, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Deepfive", wtype = false, modtype = 23, mod = 1, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeed", wtype = false, modtype = 23, mod = 2, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamondcut", wtype = false, modtype = 23, mod = 3, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chrono", wtype = false, modtype = 23, mod = 4, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feroccirr", wtype = false, modtype = 23, mod = 5, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fiftynine", wtype = false, modtype = 23, mod = 6, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mercie", wtype = false, modtype = 23, mod = 7, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Syntheticz", wtype = false, modtype = 23, mod = 8, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Organictyped", wtype = false, modtype = 23, mod = 9, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov1", wtype = false, modtype = 23, mod = 10, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Duper7", wtype = false, modtype = 23, mod = 11, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Uzer", wtype = false, modtype = 23, mod = 12, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Groundride", wtype = false, modtype = 23, mod = 13, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spacer", wtype = false, modtype = 23, mod = 14, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Venum", wtype = false, modtype = 23, mod = 15, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cosmo", wtype = false, modtype = 23, mod = 16, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dashvip", wtype = false, modtype = 23, mod = 17, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Icekid", wtype = false, modtype = 23, mod = 18, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ruffeld", wtype = false, modtype = 23, mod = 19, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wangenmaster", wtype = false, modtype = 23, mod = 20, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Superfive", wtype = false, modtype = 23, mod = 21, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov2", wtype = false, modtype = 23, mod = 22, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slitsix", wtype = false, modtype = 23, mod = 23, costs = 6200, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["suv"] = { 
			title = "SUV", 
			name = "suv",
			buttons = { 
				{name = "Almindelig", wtype = 3, modtype = 23, mod = -1, costs = 2000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "VIP", wtype = 3, modtype = 23, mod = false, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Benefactor", wtype = 3, modtype = 23, mod = 1, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cosmo", wtype = 3, modtype = 23, mod = 2, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bippu", wtype = 3, modtype = 23, mod = 3, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Royalsix", wtype = 3, modtype = 23, mod = 4, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fagorme", wtype = 3, modtype = 23, mod = 5, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Deluxe", wtype = 3, modtype = 23, mod = 6, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Icedout", wtype = 3, modtype = 23, mod = 7, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cognscenti", wtype = 3, modtype = 23, mod = 8, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeedten", wtype = 3, modtype = 23, mod = 9, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Supernova", wtype = 3, modtype = 23, mod = 10, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Obeyrs", wtype = 3, modtype = 23, mod = 11, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeedballer", wtype = 3, modtype = 23, mod = 12, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Extra vaganzo", wtype = 3, modtype = 23, mod = 13, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Splitsix", wtype = 3, modtype = 23, mod = 14, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Empowered", wtype = 3, modtype = 23, mod = 15, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise", wtype = 3, modtype = 23, mod = 16, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dashvip", wtype = 3, modtype = 23, mod = 17, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cutter", wtype = 3, modtype = 23, mod = 18, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["offroad"] = { 
			title = "Offroad", 
			name = "offroad",
			buttons = { 
				{name = "Almindelig", wtype = 4, modtype = 23, mod = -1, costs = 2000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Raider", wtype = 4, modtype = 23, mod = false, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mudslinger", modtype = 23, mod = 1, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nevis", wtype = 4, modtype = 23, mod = 2, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cairngorm", wtype = 4, modtype = 23, mod = 3, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Amazon", wtype = 4, modtype = 23, mod = 4, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Challenger", wtype = 4, modtype = 23, mod = 5, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dunebasher", wtype = 4, modtype = 23, mod = 6, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fivestar", wtype = 4, modtype = 23, mod = 7, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rockcrawler", wtype = 4, modtype = 23, mod = 8, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Milspecsteelie", wtype = 4, modtype = 23, mod = 9, costs = 6000, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["tuner"] = { 
			title = "Tuner", 
			name = "tuner",
			buttons = { 
				{name = "Almindelig", wtype = 5, modtype = 23, mod = -1, costs = 2000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cosmo", wtype = 5, modtype = 23, mod = false, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Supermesh", wtype = 5, modtype = 23, mod = 1, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Outsider", wtype = 5, modtype = 23, mod = 2, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rollas", wtype = 5, modtype = 23, mod = 3, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Driffmeister", wtype = 5, modtype = 23, mod = 4, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slicer", wtype = 5, modtype = 23, mod = 5, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Elquatro", wtype = 5, modtype = 23, mod = 6, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dubbed", wtype = 5, modtype = 23, mod = 7, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fivestar", wtype = 5, modtype = 23, mod = 8, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slideways", wtype = 5, modtype = 23, mod = 9, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Apex", wtype = 5, modtype = 23, mod = 10, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stancedeg", wtype = 5, modtype = 23, mod = 11, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Countersteer", wtype = 5, modtype = 23, mod = 12, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov1", wtype = 5, modtype = 23, mod = 13, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov2dish", wtype = 5, modtype = 23, mod = 14, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Guppez", wtype = 5, modtype = 23, mod = 15, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chokadori", wtype = 5, modtype = 23, mod = 16, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chicane", wtype = 5, modtype = 23, mod = 17, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saisoku", wtype = 5, modtype = 23, mod = 18, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dishedeight", wtype = 5, modtype = 23, mod = 19, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fujiwara", wtype = 5, modtype = 23, mod = 20, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Zokusha", wtype = 5, modtype = 23, mod = 21, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Battlevill", wtype = 5, modtype = 23, mod = 22, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rallymaster", wtype = 5, modtype = 23, mod = 23, costs = 8500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["highend"] = { 
			title = "Luxus", 
			name = "highend",
			buttons = { 
				{name = "Almindelig", wtype = 7, modtype = 23, mod = -1, costs = 2000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow", wtype = 7, modtype = 23, mod = false, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hyper", wtype = 7, modtype = 23, mod = 1, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blade", wtype = 7, modtype = 23, mod = 2, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond", wtype = 7, modtype = 23, mod = 3, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Supagee", wtype = 7, modtype = 23, mod = 4, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chromaticz", wtype = 7, modtype = 23, mod = 5, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Merciechlip", wtype = 7, modtype = 23, mod = 6, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Obeyrs", wtype = 7, modtype = 23, mod = 7, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gtchrome", wtype = 7, modtype = 23, mod = 8, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cheetahr", wtype = 7, modtype = 23, mod = 9, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solar", wtype = 7, modtype = 23, mod = 10, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Splitten", wtype = 7, modtype = 23, mod = 11, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dashvip", wtype = 7, modtype = 23, mod = 12, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeedten", wtype = 7, modtype = 23, mod = 13, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carboninferno", wtype = 7, modtype = 23, mod = 14, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonshadow", wtype = 7, modtype = 23, mod = 15, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonz", wtype = 7, modtype = 23, mod = 16, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonsolar", wtype = 7, modtype = 23, mod = 17, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carboncheetahr", wtype = 7, modtype = 23, mod = 18, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonsracer", wtype = 7, modtype = 23, mod = 19, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["lowrider"] = { 
			title = "Lowrider", 
			name = "lowrider",
			buttons = { 
				{name = "Almindelig", wtype = 2, modtype = 23, mod = -1, costs = 2000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Flare", wtype = 2, modtype = 23, mod = false, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wired", wtype = 2, modtype = 23, mod = 1, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Triplegolds", wtype = 2, modtype = 23, mod = 2, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bigworm", wtype = 2, modtype = 23, mod = 3, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sevenfives", wtype = 2, modtype = 23, mod = 4, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Splitsix", wtype = 2, modtype = 23, mod = 5, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Freshmesh", wtype = 2, modtype = 23, mod = 6, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Leadsled", wtype = 2, modtype = 23, mod = 7, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Turbine", wtype = 2, modtype = 23, mod = 8, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Superfin", wtype = 2, modtype = 23, mod = 9, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicrod", wtype = 2, modtype = 23, mod = 10, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dollar", wtype = 2, modtype = 23, mod = 11, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dukes", wtype = 2, modtype = 23, mod = 12, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lowfive", wtype = 2, modtype = 23, mod = 13, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gooch", wtype = 2, modtype = 23, mod = 14, costs = 5500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["muscle"] = { 
			title = "Muskel", 
			name = "muscle",
			buttons = { 
				{name = "Almindelig", wtype = 1, modtype = 23, mod = -1, costs = 2000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicfive", wtype = 1, modtype = 23, mod = false, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dukes", wtype = 1, modtype = 23, mod = 1, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musclefreak", wtype = 1, modtype = 23, mod = 2, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Kracka", wtype = 1, modtype = 23, mod = 3, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Azrea", wtype = 1, modtype = 23, mod = 4, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mecha", wtype = 1, modtype = 23, mod = 5, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blacktop", wtype = 1, modtype = 23, mod = 6, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dragspl", wtype = 1, modtype = 23, mod = 7, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Revolver", wtype = 1, modtype = 23, mod = 8, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicrod", wtype = 1, modtype = 23, mod = 9, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spooner", wtype = 1, modtype = 23, mod = 10, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fivestar", wtype = 1, modtype = 23, mod = 11, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Oldschool", wtype = 1, modtype = 23, mod = 12, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Eljefe", wtype = 1, modtype = 23, mod = 13, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dodman", wtype = 1, modtype = 23, mod = 14, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sixgun", wtype = 1, modtype = 23, mod = 15, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mercenary", wtype = 1, modtype = 23, mod = 16, costs = 3500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["frontwheel"] = { 
			title = "Forhjul", 
			name = "frontwheel",
			buttons = { 
				{name = "Almindelig", wtype = 6, modtype = 23, mod = -1, costs = 1000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Speedway", wtype = 6, modtype = 23, mod = false, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Streetspecial", wtype = 6, modtype = 23, mod = 1, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer", wtype = 6, modtype = 23, mod = 2, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trackstar", wtype = 6, modtype = 23, mod = 3, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Overlord", wtype = 6, modtype = 23, mod = 4, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trident", wtype = 6, modtype = 23, mod = 5, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Triplethreat", wtype = 6, modtype = 23, mod = 6, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stilleto", wtype = 6, modtype = 23, mod = 7, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wires", wtype = 6, modtype = 23, mod = 8, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bobber", wtype = 6, modtype = 23, mod = 9, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solidus", wtype = 6, modtype = 23, mod = 10, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Iceshield", wtype = 6, modtype = 23, mod = 11, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Loops", wtype = 6, modtype = 23, mod = 12, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["backwheel"] = { 
			title = "Baghjul", 
			name = "backwheel",
			buttons = { 
				{name = "Almindelig", wtype = 6, modtype = 24, mod = -1, costs = 1000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Speedway", wtype = 6, modtype = 24, mod = false, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Streetspecial", wtype = 6, modtype = 24, mod = 1, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer", wtype = 6, modtype = 24, mod = 2, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trackstar", wtype = 6, modtype = 24, mod = 3, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Overlord", wtype = 6, modtype = 24, mod = 4, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trident", wtype = 6, modtype = 24, mod = 5, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Triplethreat", wtype = 6, modtype = 24, mod = 6, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stilleto", wtype = 6, modtype = 24, mod = 7, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wires", wtype = 6, modtype = 24, mod = 8, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bobber", wtype = 6, modtype = 24, mod = 9, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solidus", wtype = 6, modtype = 24, mod = 10, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Iceshield", wtype = 6, modtype = 24, mod = 11, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Loops", wtype = 6, modtype = 24, mod = 12, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["lights"] = { 
			title = "Lys", 
			name = "lights",
			buttons = { 
				{name = "Forlygter", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Neon Sæt", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["neonkits"] = { 
			title = "neonkits", 
			name = "neonkits",
			buttons = { 
				{name = "Neon Opsætning", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Neon Farve", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["neonlayout"] = { 
			title = "Neon Opsætning", 
			name = "neonlayout",
			buttons = { 
				{name = "Ingen",costs = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Front, Bag og Sider", costs = 200, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["neoncolor"] = { 
			title = "Neon Farve", 
			name = "neoncolor",
			buttons = { 
				{name = "Hvid", color = {255,255,255}, costs = 5000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå", color = {0,0,255}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Elektrisk Blå", color = {0,150,255}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mintgrøn", color = {50,255,155}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limegrøn", color = {0,255,0}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul", color = {255,255,0}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gyldent Bad", color = {204,204,0}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange", color = {255,128,0}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rød", color = {255,0,0}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pony Pink", color = {255,102,255}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Varm Pink", color = {255,0,255}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lilla", color = {153,0,153}, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["headlights"] = { 
			title = "Forlygter", 
			name = "headlights",
			buttons = { 
				{name = "Almindelige Lygter",mod = false, modtype = 22,costs = 20, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Xenon Lygter",mod = true,modtype = 22,costs = 7500, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["plate"] = { 
			title = "Plader", 
			name = "plate",
			buttons = { 
				{name = "Blå på Hvid 1",plateindex = false,costs = 1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå på Hvid 2",plateindex = 3,costs = 1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blå på Hvid 3",plateindex = 4,costs = 1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul på Blå",plateindex = 2,costs = 1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gul på Sort",plateindex = 1,costs = 1500, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["repair"] = { 
			title = "Kategorier", 
			name = "repair",
			buttons = { 
				{name = "Reparer køretøj", description = "Fuld reparation af karosseri og motor.", costs = 0, centre = 0, font = 0, scale = 0.4}
				
			}
		},
		["repairbike"] = { 
			title = "Kategorier", 
			name = "repairbike",
			buttons = { 
				{name = "Reparer cykel", description = "Fuld reparation og service af cykel.", costs = math.random(750,1750), centre = 0, font = 0, scale = 0.4}
				
			}
		},
		["brakes"] = { 
			title = "Bremser", 
			name = "brakes",
			buttons = { 
				{name = "Almindelige Bremser",modtype = 12, mod = -1, costs = 3000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gade Bremser",modtype = 12, mod = false, costs = 11000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sport Bremser",modtype = 12, mod = 1, costs = 15000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer Bremser",modtype = 12, mod = 2, costs = 19000, description = "", centre = 0, font = 0, scale = 0.4}
				
			}
		},
		["engine"] = { 
			title = "Motor", 
			name = "engine",
			buttons = { 
				{name = "Motor Opgradering, 1",modtype = 11, mod = -1, costs = 8000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Motor Opgradering, 2",modtype = 11, mod = false, costs = 16000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Motor Opgradering, 3",modtype = 11, mod = 1, costs = 24000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Motor Opgradering, 4",modtype = 11, mod = 2, costs = 32000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["horn"] = { 
			title = "Horn", 
			name = "horn",
			buttons = { 
				{name = "Almindelig Horn",modtype = 14, mod = -1,costs = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lastbil",modtype = 14, mod = false,costs = 500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klovn",modtype = 14, mod = 2,costs = 600, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musikalsk 1",modtype = 14, mod = 3,costs = 650, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musikalsk 2",modtype = 14, mod = 4,costs = 650, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musikalsk 3",modtype = 14, mod = 5,costs = 650, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musikalsk 4",modtype = 14, mod = 6,costs = 650, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musikalsk 5",modtype = 14, mod = 7,costs = 650, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trist Basun",modtype = 14, mod = 8,costs = 700, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk 1",modtype = 14, mod = 9,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Horn 2",modtype = 14, mod = 10,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Horn 3",modtype = 14, mod = 11,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Horn 4",modtype = 14, mod = 12,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Horn 5",modtype = 14, mod = 13,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Horn 6",modtype = 14, mod = 14,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Horn 7",modtype = 14, mod = 15,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - Do",modtype = 14, mod = 16,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - Re",modtype = 14, mod = 17,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - Mi",modtype = 14, mod = 18,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - Fa",modtype = 14, mod = 19,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - Sol",modtype = 14, mod = 20,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - La",modtype = 14, mod = 21,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - Ti",modtype = 14, mod = 22,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scale - Do (high)",modtype = 14, mod = 23,costs = 750, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazz 1",modtype = 14, mod = 25,costs = 800, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazz 2",modtype = 14, mod = 26,costs = 800, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazz 3",modtype = 14, mod = 27,costs = 800, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazz Loop",modtype = 14, mod = 28,costs = 800, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban 1",modtype = 14, mod = 29,costs = 900, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban 2",modtype = 14, mod = 30,costs = 900, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban 3",modtype = 14, mod = 31,costs = 900, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban 4",modtype = 14, mod = 32,costs = 900, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Loop 1",modtype = 14, mod = 33,costs = 1000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk 8",modtype = 14, mod = 34,costs = 1000, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Klassisk Loop 2",modtype = 14, mod = 35,costs = 1000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
	}
}

local vehiclecol = {}
local extracol = {}
local wheeltype = nil
local neoncolor = nil
local plateindex = nil
local windowtint = nil
local mods = {
[0] = { mod = nil },
[1] = { mod = nil },
[2] = { mod = nil },
[3] = { mod = nil },
[4] = { mod = nil },
[5] = { mod = nil },
[6] = { mod = nil },
[7] = { mod = nil },
[8] = { mod = nil },
[9] = { mod = nil },
[10] = { mod = nil },
[11] = { mod = nil },
[12] = { mod = nil },
[13] = { mod = nil },
[14] = { mod = nil },
[15] = { mod = nil },
[16] = { mod = nil },
[23] = { mod = nil },
[24] = { mod = nil },
}

function f(n)
return n + 0.0001
end

function LocalPed()
return GetPlayerPed(-1)
end

function try(f, catch_f)
local status, exception = pcall(f)
if not status then
catch_f(exception)
end
end
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
function DriveInGarage()
		local pos = lsc.currentpos.inside
		Citizen.Trace("forcin' respawn\n")
		local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsUsing(ped)
		local damage = GetVehicleBodyHealth(veh)
		if DoesEntityExist(veh) then
			if damage < 995 or not AreAllVehicleWindowsIntact(veh) or IsVehicleDoorDamaged(veh,0) or IsVehicleDoorDamaged(veh,1) or IsVehicleDoorDamaged(veh,2) or IsVehicleDoorDamaged(veh,3) then
				if GetVehicleClass(veh) == 13 then 
					lsc.currentmenu = 'repairbike'
				else
					lsc.currentmenu = 'repair'
					local ped = GetPlayerPed(-1)
					local car = GetVehiclePedIsUsing(ped)
					local damage = GetEntityHealth(car)
					local pricecalc = 1000 - damage
					local repairprice = pricecalc * priceperdamage
					if repairprice > 50000 then repairprice = 50000 end
					if repairprice == 0 then repairprice = 5000 end
					TriggerEvent("pNotify:SetQueueMax", "lsrepair0", 2)
					TriggerEvent("pNotify:SendNotification",{text = "Du skal betale <b style='color: #FFC832'>"..repairprice.." DKK</b> for at få dit køretøj repareret.",type = "info",timeout = (3000),layout = "centerRight",queue = "lsrepair0",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				end
			else
				lsc.currentmenu = "main"
			end
			
			SetVehicleModKit(veh,0)	
			local bumper = false
			local insrt = table.insert
			lsc.menu["main"].buttons = {}
			lsc.menu["bumpers"].buttons = {}
			for i = 0,16 do
				if GetNumVehicleMods(veh,i) ~= nil and GetNumVehicleMods(veh,i) ~= false then
					if i == 16 then
						-- insrt(lsc.menu["main"].buttons, {name = "Armor", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 15 then
						insrt(lsc.menu["main"].buttons, {name = "Affjedring", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 13 then
						insrt(lsc.menu["main"].buttons, {name = "Gearkasse", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 14 then
						insrt(lsc.menu["main"].buttons, {name = "Horn", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 12 then
						insrt(lsc.menu["main"].buttons, {name = "Bremser", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 11 then
						insrt(lsc.menu["main"].buttons, {name = "Motor", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 0 then
						insrt(lsc.menu["main"].buttons, {name = "Spoiler", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 1 then
						bumper = true
						insrt(lsc.menu["bumpers"].buttons, {name = "Forkofanger", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 2 then
						bumper = true
						insrt(lsc.menu["bumpers"].buttons, {name = "Bagkofanger", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 3 then
						insrt(lsc.menu["main"].buttons, {name = "Skørter", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 4 then
						insrt(lsc.menu["main"].buttons, {name = "Udstødning", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 5 then
						insrt(lsc.menu["main"].buttons, {name = "Bur", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 6 then
						insrt(lsc.menu["main"].buttons, {name = "Grill", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 7 then
						insrt(lsc.menu["main"].buttons, {name = "Frontklap", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 8 then
						insrt(lsc.menu["main"].buttons, {name = "Skærme", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 9 then
						-- insrt(lsc.menu["main"].buttons, {name = "Fenders2", description = "", centre = 0, font = 0, scale = 0.4})
					elseif i == 10 then
						insrt(lsc.menu["main"].buttons, {name = "Tag", description = "", centre = 0, font = 0, scale = 0.4})
					end
				end
			end
			
			if bumper then
			insrt(lsc.menu["main"].buttons, {name = "Kofangere", description = "", centre = 0, font = 0, scale = 0.4})
			end
			insrt(lsc.menu["main"].buttons, {name = "Lys", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Plader", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Maling", description = "Respray your vehicle", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Turbo", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Dæk", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Vinduer", description = "", centre = 0, font = 0, scale = 0.4})
			if IsThisModelABike(GetEntityModel(veh)) then
				lsc.menu["wheeltype"].buttons = {}
				insrt(lsc.menu["wheeltype"].buttons, {name = "Forhjul", wtype = 6, description = "", centre = 0, font = 0, scale = 0.4})
				insrt(lsc.menu["wheeltype"].buttons, {name = "Baghjul", wtype = 6, description = "", centre = 0, font = 0, scale = 0.4})
			end
			SetVehicleModKit(veh,0)	
			local mod = 1
			lsc.menu["frontbumper"].buttons = {}
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["frontbumper"].buttons , {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0, tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					--TriggerServerEvent('print',tostring(lbl))
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["frontbumper"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							Citizen.Trace(name.." "..mod.." "..i)
						end
					end
				end
			end
			Citizen.Trace('finished frontbumper')
			SetVehicleModKit(veh,0)	
			Citizen.Trace('set modkit')
			mod = 2
			Citizen.Trace('finished mod setting')
			lsc.menu["rearbumper"].buttons = {}
			Citizen.Trace('finished clearning btns')
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["rearbumper"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,  tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["rearbumper"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end
			end
			mod = 4
			SetVehicleModKit(veh,0)	
			lsc.menu["exhaust"].buttons = {}
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["exhaust"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["exhaust"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end		
			end
			mod = 8
			lsc.menu["fenders"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["fenders"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["fenders"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			mod = 9
			SetVehicleModKit(veh,0)	
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["fenders"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end	
			end
			mod = 7
			lsc.menu["hood"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["hood"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,    tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["hood"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			
			mod = 5
			lsc.menu["rollcage"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["rollcage"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,    tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["rollcage"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			
			mod = 10
			lsc.menu["roof"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["roof"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,    tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["roof"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			
			mod = 3
			lsc.menu["skirts"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["skirts"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["skirts"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			
			mod = 0
			lsc.menu["spoiler"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["spoiler"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["spoiler"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			
			mod = 6
			lsc.menu["grille"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["grille"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,  tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["grille"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			
			mod = 5
			lsc.menu["chassis"].buttons = {}
			SetVehicleModKit(veh,0)	
			Citizen.Trace(tostring(veh).." mod:"..mod.." num:"..tostring(GetNumVehicleMods(veh,mod)))
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["chassis"].buttons, {name = "Ingen",modtype = mod,costs = 0,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,  tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					Citizen.Trace(tostring(lbl))
					Citizen.Trace(GetLabelText(lbl))
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["chassis"].buttons, {name = name,modtype = mod,costs = 0,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
							
							Citizen.Trace(name.." "..mod.." "..mod)
						end
					end
				end	
			end
			lsc.inside = true
			vehiclecol = table.pack(GetVehicleColours(veh))
			extracol = table.pack(GetVehicleExtraColours(veh))
			neoncolor = table.pack(GetVehicleNeonLightsColour(veh))
			plateindex = GetVehicleNumberPlateTextIndex(veh)
			for i,t in pairs(mods) do 
				t.mod = GetVehicleMod(veh,i)
			end
			windowtint = GetVehicleWindowTint(veh)
			wheeltype = GetVehicleWheelType(veh)
			SetEntityCoordsNoOffset(veh,pos.x,pos.y,pos.z)
			SetEntityHeading(veh,pos.heading)
			SetVehicleOnGroundProperly(veh)
			FreezeEntityPosition(veh, true)
			SetVehicleDoorsLocked(veh,4)
			SetPlayerInvincible(GetPlayerIndex(),true)
			SetEntityInvincible(veh,true)
			SetEntityCollision(veh,false,false)
			TriggerServerEvent('lockGarage',true,lsc.currentgarage)
		end
	
end

function DriveOutOfGarage(pos)
	SetStreamedTextureDictAsNoLongerNeeded("mpmissmarkers256")
	lsc.inside = false
	local ped = LocalPed()
	local veh = GetVehiclePedIsUsing(ped)
	SetEntityCoords(veh,pos.x,pos.y,pos.z)
	SetEntityHeading(veh,pos.heading)
	lsc.menu["frontbumper"].buttons = {}
	lsc.menu["rearbumper"].buttons = {}
	lsc.menu["exhaust"].buttons = {}
	lsc.menu["fenders"].buttons = {}
	lsc.menu["hood"].buttons = {}
	lsc.menu["rollcage"].buttons = {}
	lsc.menu["roof"].buttons = {}
	lsc.menu["skirts"].buttons = {}
	lsc.menu["spoiler"].buttons = {}
	lsc.menu["grille"].buttons = {}
	lsc.menu["main"].buttons = {}
	lsc.menu["bumpers"].buttons = {}
	lsc.menu["chassis"].buttons = {}
	table.sort(lsc)
	table.sort(lsc.menu)
	lsc.menu.from = 1
	lsc.menu.to = 10
	lsc.selectedbutton = 0
	SetVehicleOnGroundProperly(veh)
	SetEntityCollision(veh,true,true)
	FreezeEntityPosition(veh, false)
	SetVehicleDoorsLocked(veh,0)
	SetPlayerInvincible(GetPlayerIndex(),false)
	SetEntityInvincible(veh,false)
	TriggerServerEvent('lockGarage',false,lsc.currentgarage)
	lsc.currentgarage = 0
end

function lsc_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
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

function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
        local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end

function lsc_drawMenuButton(button,x,y,selected)
	SetTextFont(button.font)
	SetTextProportional(0)
	SetTextScale(button.scale, button.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(button.centre)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,lsc.menu.width,lsc.menu.height,255,255,255,255)
	else
		DrawRect(x,y,lsc.menu.width,lsc.menu.height,0,0,0,150)
	end
	DrawText(x - lsc.menu.width/2 + 0.005, y - lsc.menu.height/2 + 0.0028)	
end

function drawMenuCost(button,x,y,selected)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextEntry("STRING")
	if button.costs == 0 then
		AddTextComponentString("")
	DrawText(x + lsc.menu.width/2 - 0.054, y - lsc.menu.height/2 + 0.0028)	
	else
		AddTextComponentString(button.costs.. " DKK")
		DrawText(x + lsc.menu.width/2 - 0.054, y - lsc.menu.height/2 + 0.0028)	
	end
end

function drawMenuOwned(x,y,selected)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextEntry("STRING")
	AddTextComponentString("EJET")
	DrawText(x + lsc.menu.width/2 - 0.054, y - lsc.menu.height/2 + 0.0028)	
end

function drawMenuTitle(txt,x,y)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,lsc.menu.width,lsc.menu.height,0,0,0,150)
	DrawText(x - lsc.menu.width/2 + 0.005, y - lsc.menu.height/2 + 0.0028)	
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
local backlock = false
local horn = ''
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if lsc ~= nil and lsc.inside == false then
			local ped = LocalPed()
			if IsPedSittingInAnyVehicle(ped) then
				local veh = GetVehiclePedIsUsing(ped)
				if DoesEntityExist(veh) and (IsThisModelACar(GetEntityModel(veh)) or IsThisModelABike(GetEntityModel(veh)))  then
					for i,pos in ipairs(lsc.locations) do
						outside = pos.outside						
						if GetDistanceBetweenCoords(outside.x,outside.y,outside.z,GetEntityCoords(ped)) <= f(5) then
							if pos.locked == false then
								lsc_drawTxt("Tryk ~g~E~w~ for at gå til mekanikeren",0,1,0.5,0.8,0.6,255,255,255,255)
								if IsControlJustPressed(1,51) then
									lsc.currentpos = pos
									lsc.currentgarage = i
									DriveInGarage()
								end
							else
								lsc_drawTxt("~r~Optaget, vent..",4,1,0.5,0.8,1.0,255,255,255,255)
							end
						end
					end
				end
			end
		elseif lsc ~= nil then
			local ped = LocalPed()
			local veh = GetVehiclePedIsUsing(ped)
			local menu = lsc.menu[lsc.currentmenu]
					lsc_drawTxt(lsc.title,1,1,lsc.menu.x,lsc.menu.y,1.0, 255,255,255,255)
					drawMenuTitle(menu.title, lsc.menu.x,lsc.menu.y + 0.08)
					lsc_drawTxt(lsc.selectedbutton.."/"..tablelength(menu.buttons),0,0,lsc.menu.x + lsc.menu.width/2 - 0.0328,lsc.menu.y + 0.066,0.4, 255,255,255,255)
					local y = lsc.menu.y + 0.12
					buttoncount = tablelength(menu.buttons)
					local selected = false
					
					for i,button in pairs(menu.buttons) do
						if i >= lsc.menu.from and i <= lsc.menu.to then
							
							if i == lsc.selectedbutton then
								selected = true
							else
								selected = false
							end
							lsc_drawMenuButton(button,lsc.menu.x,y,selected)
							if button.costs ~= nil then
								if lsc.currentmenu == "headlights" then
									if button.name == "Almindelige Lygter"  then
										if not IsToggleModOn(veh, button.modtype)  then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.name == "Xenon Lygter"  then
										if IsToggleModOn(veh, button.modtype) then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end

								elseif lsc.currentmenu == "turbo" then
									if button.name == "Ingen"  then
										if not IsToggleModOn(veh, button.modtype)  then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.name == "Turbo"  then
										if IsToggleModOn(veh, button.modtype) then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end

								elseif lsc.currentmenu == "plate" then
									if plateindex == button.plateindex then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "chassis" or lsc.currentmenu == "armor" or lsc.currentmenu == "brakes" or lsc.currentmenu == "exhaust" or lsc.currentmenu == "frontbumper" or lsc.currentmenu == "rearbumper" or lsc.currentmenu == "engine" or lsc.currentmenu == "fenders" or lsc.currentmenu == "hood" or lsc.currentmenu == "transmission" or lsc.currentmenu == "suspension" or lsc.currentmenu == "spoiler" or lsc.currentmenu == "skirts" or lsc.currentmenu == "roof" or lsc.currentmenu == "rollcage" or lsc.currentmenu == "horn" or lsc.currentmenu == "grille" then
									if button.mod == -1  then
										if mods[button.modtype].mod == -1 then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.mod == 0 or button.mod == false then
										if mods[button.modtype].mod == false or mods[button.modtype].mod == 0 then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									else
										if mods[button.modtype].mod == button.mod then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
								elseif  lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "backwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
									if button.mod == -1  then
										if mods[button.modtype].mod == -1 and wheeltype == button.wtype then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.mod == 0 or button.mod == false then
										if (mods[button.modtype].mod == false or mods[button.modtype].mod == 0) and wheeltype == button.wtype then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									else
										if mods[button.modtype].mod == button.mod and wheeltype == button.wtype then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
								elseif lsc.currentmenu == "neonlayout" then
									if button.name == "Ingen" then
										if IsVehicleNeonLightEnabled(veh, 0) == false and IsVehicleNeonLightEnabled(veh, 1) == false  and IsVehicleNeonLightEnabled(veh, 2) == false and IsVehicleNeonLightEnabled(veh, 3) == false then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.name == "Front, Bag og Sider" then
										if IsVehicleNeonLightEnabled(veh, 0)  and IsVehicleNeonLightEnabled(veh, 1)  and IsVehicleNeonLightEnabled(veh, 2)  and IsVehicleNeonLightEnabled(veh, 3)  then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
								elseif lsc.currentmenu == "neoncolor" then
									if button.color[1] == neoncolor[1] and button.color[2] == neoncolor[2] and button.color[3] == neoncolor[3] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif (lsc.currentmenu == "primaryclassic" or lsc.currentmenu == "primarychrome" or lsc.currentmenu == "primarymatte" or lsc.currentmenu == "primarymetal") then
									if button.colorindex == vehiclecol[1] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif (lsc.currentmenu == "secondaryclassic" or lsc.currentmenu == "secondarychrome" or lsc.currentmenu == "secondarymatte" or lsc.currentmenu == "secondarymetal") then
									if button.colorindex == vehiclecol[2] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif (lsc.currentmenu == "primarymetallic") then
									if button.colorindex == vehiclecol[1] and extracol[1] == vehiclecol[2] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "secondarymetallic" then
									if button.colorindex == vehiclecol[2] and extracol[1] == button.colorindex then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "wheelcolor" then
									if button.colorindex == extracol[2] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "wheelaccessories" then
									if button.name == "Almindelige Dæk" then
										if GetVehicleModVariation(veh,23) == false then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									elseif button.name == "Specialdæk" then
										if GetVehicleModVariation(veh,23) then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									elseif string.find(button.name:lower(),'smoke') then
										local col = table.pack(GetVehicleTyreSmokeColor(veh))
										if col[1] == button.color[1] and col[2] == button.color[2] and col[3] == button.color[3] then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
								elseif lsc.currentmenu == "windows" then
									if windowtint == button.tint then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)	
									end
								else
									drawMenuCost(button,lsc.menu.x,y,selected)
								end
							end
							y = y + 0.04
								if selected then
									if (lsc.currentmenu == "primaryclassic" or lsc.currentmenu == "primarychrome" or lsc.currentmenu == "primarymatte" or lsc.currentmenu == "primarymetal" or lsc.currentmenu == "primarymetallic") then
										if button.colorindex ~= nil then
											if lsc.currentmenu == "primarymetallic" then
												SetVehicleColours(veh,button.colorindex,vehiclecol[2])
												SetVehicleExtraColours(veh, vehiclecol[2], extracol[2])
											else
												SetVehicleColours(veh,button.colorindex,vehiclecol[2])
											end
										end
									end
									if (lsc.currentmenu == "secondaryclassic" or lsc.currentmenu == "secondarychrome" or lsc.currentmenu == "secondarymatte" or lsc.currentmenu == "secondarymetal" or lsc.currentmenu == "secondarymetallic") then
										if button.colorindex ~= nil then
											if lsc.currentmenu == "secondarymetallic" then
												SetVehicleColours(veh,vehiclecol[1],button.colorindex)
												SetVehicleExtraColours(veh, button.colorindex, extracol[2])
											else
												SetVehicleColours(veh,vehiclecol[1],button.colorindex)
											end
										end
									end
									if (lsc.currentmenu == "wheelcolor") then
										if button.colorindex ~= nil then
											SetVehicleExtraColours(veh, extracol[1], button.colorindex)
										end
									end
									if lsc.currentmenu == "horn" or lsc.currentmenu == "roof" or lsc.currentmenu == "suspension" or lsc.currentmenu == "horns" or lsc.currentmenu == "hood" or lsc.currentmenu == "grille" or lsc.currentmenu == "rollcage" or lsc.currentmenu == "exhaust" or lsc.currentmenu == "skirts" or lsc.currentmenu == "rearbumper" or lsc.currentmenu == "frontbumper" or lsc.currentmenu == "spoiler"  then
										SetVehicleMod(veh, button.modtype, button.mod)
										
									end
									if  lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "backwheel" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
										SetVehicleMod(veh, button.modtype, button.mod)
									end
									
									if lsc.currentmenu == "fenders" then
										if button.mod == -1 then
											SetVehicleMod(veh, 8, button.mod)
											SetVehicleMod(veh, 9, button.mod)
										else
										SetVehicleMod(veh, button.modtype, button.mod)
										end
									end
									
									if lsc.currentmenu == "horn" then
										if horn ~= button.name then
											horn = button.name
										end
									end
									if lsc.currentmenu == "windows" then
										SetVehicleWindowTint(veh, button.tint)
									end
									if lsc.currentmenu == "neoncolor" then
										SetVehicleNeonLightsColour(veh,button.color[1],button.color[2],button.color[3])
									end
									if lsc.currentmenu == "plate" then
										SetVehicleNumberPlateTextIndex(veh,button.plateindex)
									end
								end
								if selected and IsControlJustPressed(1,201) then
									TriggerServerEvent('lscustoms:payGarage', button)
									--ButtonSelected(button)
								end
						end
					end
			
		end
		if lsc ~= nil and lsc.inside then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if lsc.selectedbutton > 1 then
					lsc.selectedbutton = lsc.selectedbutton -1
					if buttoncount > 10 and lsc.selectedbutton < lsc.menu.from then
						lsc.menu.from = lsc.menu.from -1
						lsc.menu.to = lsc.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if lsc.selectedbutton < buttoncount then
					lsc.selectedbutton = lsc.selectedbutton +1
					if buttoncount > 10 and lsc.selectedbutton > lsc.menu.to then
						lsc.menu.to = lsc.menu.to + 1
						lsc.menu.from = lsc.menu.from + 1
					end
				end	
			end
		end
		
	end
end)


function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local car = GetVehiclePedIsUsing(ped)
	local damage = GetEntityHealth(car)
	local pricecalc = 1000 - damage
	local repairprice = pricecalc * priceperdamage
	if repairprice > 50000 then repairprice = 50000 end
	if repairprice == 0 then repairprice = 5000 end
	if lsc.currentmenu == "repair" then
		if button.name == "Reparer køretøj" then
			PayForVehicleRepair(repairprice)
			OpenMenu('main')
		end
	elseif lsc.currentmenu == "repairbike" then
		if button.name == "Reparer cykel" then
			SetVehicleFixed(car)
			OpenMenu('main')
		end
	elseif lsc.currentmenu == "main" then
		if button.name == "Maling" then
			OpenMenu("respray")
		elseif button.name == "Bremser" then
			SetVehicleModKit(car,0)
			OpenMenu("brakes")
		elseif button.name == "Kofangere" then
			SetVehicleModKit(car,0)
			OpenMenu("bumpers")
		elseif button.name == "Motor" then
			SetVehicleModKit(car,0)
			OpenMenu("engine")
		elseif button.name == "Udstødning" then
			SetVehicleModKit(car,0)
			OpenMenu("exhaust")
		elseif button.name == "Skærme" then
			SetVehicleModKit(car,0)
			OpenMenu("fenders")
		elseif button.name == "Frontklap" then
			SetVehicleModKit(car,0)
			OpenMenu("hood")
		elseif button.name == "Horn" then
			SetVehicleModKit(car,0)
			OpenMenu("horn")
		elseif button.name == "Lys" then
			SetVehicleModKit(car,0)
			OpenMenu("lights")
		elseif button.name == "Bur" then
			SetVehicleModKit(car,0)
			OpenMenu("rollcage")
		elseif button.name == "Tag" then
			SetVehicleModKit(car,0)
			OpenMenu("roof")
		elseif button.name == "Skørter" then
			SetVehicleModKit(car,0)
			OpenMenu("skirts")
		elseif button.name == "Spoiler" then
			SetVehicleModKit(car,0)
			OpenMenu("spoiler")
		elseif button.name == "Affjedring" then
			SetVehicleModKit(car,0)
			OpenMenu("suspension")
		elseif button.name == "Gearkasse" then
			SetVehicleModKit(car,0)
			OpenMenu("transmission")
		elseif button.name == "Plader" then
			SetVehicleModKit(car,0)
			OpenMenu("plate")
		elseif button.name == "Horn" then
			SetVehicleModKit(car,0)
			OpenMenu("horn")
		elseif button.name == "Grill" then
			SetVehicleModKit(car,0)
			OpenMenu("grille")
		elseif button.name == "Turbo" then
			SetVehicleModKit(car,0)
			OpenMenu("turbo")
		elseif button.name == "Karosseri" then
			SetVehicleModKit(car,0)
			OpenMenu("chassis")
		elseif button.name == "Dæk" then
			SetVehicleModKit(car,0)
			OpenMenu("wheels")
		elseif button.name == "Vinduer" then
			SetVehicleModKit(car,0)
			OpenMenu("windows")
		end
	elseif lsc.currentmenu == "respray" then
		if button.name == "Primær Farve" then
			OpenMenu("primarycolor")
		elseif button.name == "Sekundær Farve" then
			OpenMenu("secondarycolor")
		end
	elseif lsc.currentmenu == "primarycolor" then
		if button.name == "Krom" then
			OpenMenu("primarychrome")
		elseif button.name == "Klassisk" then
			OpenMenu("primaryclassic")
		elseif button.name == "Mat" then
			OpenMenu("primarymatte")
		elseif button.name == "Metal" then
			OpenMenu("primarymetal") 
		elseif button.name == "Metallisk" then
			OpenMenu("primarymetallic") 
		end
	elseif lsc.currentmenu == "secondarycolor" then
		if button.name == "Krom" then
			OpenMenu("secondarychrome")
		elseif button.name == "Klassisk" then
			OpenMenu("secondaryclassic")
		elseif button.name == "Mat" then
			OpenMenu("secondarymatte")
		elseif button.name == "Metal" then
			OpenMenu("secondarymetal") 
		elseif button.name == "Metallisk" then
			OpenMenu("secondarymetallic") 
		end
	elseif lsc.currentmenu == "primarychrome" then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primaryclassic" then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primarymatte" then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primarymetal" then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primarymetallic" then
		vehiclecol[1] = button.colorindex
		extracol[1] = vehiclecol[2]
	elseif lsc.currentmenu == "secondarychrome" then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondaryclassic" then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondarymatte" then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondarymetal" then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondarymetallic" then
		extracol[1] = button.colorindex
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "bumpers" then
		if button.name == "Forkofanger" then
			OpenMenu("frontbumper")
		elseif button.name == "Bagkofanger" then
			OpenMenu("rearbumper")
		end
	elseif lsc.currentmenu == "lights" then
		if button.name == "Forlygter" then
			SetVehicleModKit(car,0)
			OpenMenu('headlights')
		elseif button.name == "Neon Sæt" then
			OpenMenu('neonkits')
		end 
	elseif lsc.currentmenu == "neonkits" then
		if button.name == "Neon Opsætning" then
			OpenMenu('neonlayout')
		elseif button.name == "Neon Farve" then
			OpenMenu('neoncolor')
		end 
	elseif lsc.currentmenu == "headlights" then
		if button.name == "Almindelige Lygter" then
			ToggleVehicleMod(car, 22, false)
		
		elseif button.name == "Xenon Lygter" then
			ToggleVehicleMod(car, 22, true)
		end 
	elseif lsc.currentmenu == "plate" then
		plateindex = button.plateindex
	elseif lsc.currentmenu == "chassis" or lsc.currentmenu == "armor" or lsc.currentmenu == "brakes" or lsc.currentmenu == "frontbumper" or lsc.currentmenu == "rearbumper" or lsc.currentmenu == "engine" or lsc.currentmenu == "exhaust" or lsc.currentmenu == "hood" or lsc.currentmenu == "horn" or lsc.currentmenu == "rollcage" or lsc.currentmenu == "roof" or lsc.currentmenu == "skirts" or lsc.currentmenu == "spoiler" or lsc.currentmenu == "suspension" or lsc.currentmenu == "transmission" or lsc.currentmenu == "grille" or lsc.currentmenu == "horn" then
		mods[button.modtype].mod = button.mod
		SetVehicleMod(car,button.modtype,button.mod)
	elseif lsc.currentmenu == "fenders" then
		if button.name == "Ingen" then
			mods[8].mod = button.mod
			mods[9].mod = button.mod
			SetVehicleMod(car,9,button.mod)
			SetVehicleMod(car,8,button.mod)
		else
		mods[button.modtype].mod = button.mod
		SetVehicleMod(car,button.modtype,button.mod)
		end
	elseif lsc.currentmenu == "turbo" then
		if button.name == "Ingen" then
			ToggleVehicleMod(car, button.modtype, false)
		
		elseif button.name == "Turbo" then
			ToggleVehicleMod(car, button.modtype, true)
		end 
	elseif lsc.currentmenu == "wheels" then
		if button.name == "Fælgtyper" then
			OpenMenu('wheeltype')
		elseif button.name == "Fælgfarve" then
			OpenMenu('wheelcolor')
		elseif button.name == "Dæktilbehør" then
			SetVehicleModKit(car,0)
			OpenMenu("wheelaccessories")
		end
	elseif lsc.currentmenu == "wheeltype" then
		if button.name == "Stock" then
			SetVehicleWheelType(car,-1)
		elseif button.name == "Forhjul" then
			SetVehicleWheelType(car,button.wtype)
			OpenMenu("frontwheel")
		elseif button.name == "Baghjul" then
			SetVehicleWheelType(car,button.wtype)
			OpenMenu("backwheel")
		else
			SetVehicleWheelType(car,button.wtype)
			OpenMenu(button.name:lower())
		end
	elseif lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "backwheel" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
		wheeltype = button.wtype
		mods[button.modtype].mod = button.mod
		SetVehicleMod(car,button.modtype,button.mod)
	elseif lsc.currentmenu == "wheelcolor" then
		extracol[2] = button.colorindex
	elseif lsc.currentmenu == "windows" then
		windowtint = button.tint
	elseif lsc.currentmenu == "wheelaccessories" then
		if button.name == "Almindelige Dæk" then
			SetVehicleModKit(car,0)
			SetVehicleMod(car,23,mods[23].mod,false)
			if IsThisModelABike(GetEntityModel(car)) then
				SetVehicleModKit(car,0)
				SetVehicleMod(car,24,mods[24].mod,false)
			end
		elseif button.name == "Specialdæk" then
			SetVehicleModKit(car,0)
			SetVehicleMod(car,23,mods[23].mod,true)
			if IsThisModelABike(GetEntityModel(car)) then
				SetVehicleModKit(car,0)
				SetVehicleMod(car,24,mods[24].mod,true)
			end
		elseif string.find(button.name:lower(),'smoke')  then
			SetVehicleModKit(car,0)
			ToggleVehicleMod(car,20,true)
			SetVehicleTyreSmokeColor(car,button.color[1],button.color[2],button.color[3])
		end
	elseif lsc.currentmenu == "neonlayout" then
		if button.name == "Ingen" then
		SetVehicleNeonLightEnabled(car,0,false)
		SetVehicleNeonLightEnabled(car,1,false)
		SetVehicleNeonLightEnabled(car,2,false)
		SetVehicleNeonLightEnabled(car,3,false)
		SetVehicleNeonLightsColour(car,255,255,255)
		neoncolor[1] = 255
		neoncolor[2] = 255
		neoncolor[3] = 255
		else
		neoncolor[1] = 255
		neoncolor[2] = 255
		neoncolor[3] = 255
		SetVehicleNeonLightsColour(car,255,255,255)
		SetVehicleNeonLightEnabled(car,0,true)
		SetVehicleNeonLightEnabled(car,1,true)
		SetVehicleNeonLightEnabled(car,2,true)
		SetVehicleNeonLightEnabled(car,3,true)
		end
	elseif lsc.currentmenu == "neoncolor" then
		neoncolor[1] = button.color[1]
		neoncolor[2] = button.color[2]
		neoncolor[3] = button.color[3]
	end
	UpdateVehicle(car)
end

function OpenMenu(menu)
	lsc.lastmenu = lsc.currentmenu
	if menu == "bumpers" then
		lsc.lastmenu = "main"
	elseif menu ~= "secondarycolor" and stringstarts(menu, "secondary") then
		lsc.lastmenu = "secondarycolor"
	elseif menu ~= "primarycolor" and stringstarts(menu, "primary") then
		lsc.lastmenu = "primarycolor"
	elseif menu == "primarycolor" or menu == "secondarycolor" then
		lsc.lastmenu = "respray"
	elseif menu == "respray"  then
		lsc.lastmenu = "main"
	elseif menu == "wheels" then
		lsc.lastmenu = "main"
	elseif menu == "wheeltype" then
		lsc.lastmenu = "wheels"
	elseif menu == "wheelcolor" then
		lsc.lastmenu = "wheels"
	elseif menu == "wheelaccessories" then
		lsc.lastmenu = "wheels"
	elseif menu == "lights" then
		lsc.lastmenu = "main"
	elseif menu == "neonkits" then
		lsc.lastmenu = "lights"
	end
	lsc.menu.from = 1
	lsc.menu.to = 10
	lsc.selectedbutton = 0
	lsc.currentmenu = menu	
end


function Back()
	if backlock then
		return
	end
	backlock = true
	local ped = GetPlayerPed(-1)
	local car = GetVehiclePedIsUsing(ped)
	if lsc.currentmenu == "main" or lsc.currentmenu == "repair" or lsc.currentmenu == "repairbike" then
		DriveOutOfGarage(lsc.currentpos.outside)
	elseif lsc.currentmenu == "primarychrome" or lsc.currentmenu == "primaryclassic" or lsc.currentmenu == "primarymatte" or lsc.currentmenu == "primarymetal" then
		SetVehicleColours(car, vehiclecol[1], vehiclecol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "primarymetallic" then
		SetVehicleColours(car, vehiclecol[1], vehiclecol[2])
		SetVehicleExtraColours(car, extracol[1], extracol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "secondarychrome" or lsc.currentmenu == "secondaryclassic" or lsc.currentmenu == "secondarymatte" or lsc.currentmenu == "secondarymetal" then
		SetVehicleColours(car, vehiclecol[1], vehiclecol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "secondarymetallic" then
		SetVehicleColours(car, vehiclecol[1], vehiclecol[2])
		SetVehicleExtraColours(car, extracol[1], extracol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "wheelcolor" then
		SetVehicleExtraColours(car, extracol[1], extracol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
		SetVehicleWheelType(car,wheeltype)
		SetVehicleMod(car,23,mods[23].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "backwheel" then
		SetVehicleWheelType(car,wheeltype)
		SetVehicleMod(car,24,mods[24].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "spoiler" then
		SetVehicleMod(car,0,mods[0].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "frontbumper" then
		SetVehicleMod(car,1,mods[1].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "rearbumper" then
		SetVehicleMod(car,2,mods[2].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "skirts" then
		SetVehicleMod(car,3,mods[3].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "exhaust" then
		SetVehicleMod(car,4,mods[4].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "rollcage" then
		SetVehicleMod(car,5,mods[5].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "grille" then
		SetVehicleMod(car,6,mods[6].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "hood" then
		SetVehicleMod(car,7,mods[7].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "fenders" then
		SetVehicleMod(car,8,mods[8].mod)
		SetVehicleMod(car,9,mods[9].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "" then
		SetVehicleMod(car,9,mods[9].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "roof" then
		SetVehicleMod(car,10,mods[10].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "horn" then
		SetVehicleMod(car,14,mods[14].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "suspension" then
		SetVehicleMod(car,15,mods[15].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "windows" then
		SetVehicleWindowTint(car, windowtint)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "neoncolor" then
		SetVehicleNeonLightsColour(car,neoncolor[1],neoncolor[2],neoncolor[3])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "plate" then
		SetVehicleNumberPlateTextIndex(car,plateindex)
		OpenMenu(lsc.lastmenu)
	else
		OpenMenu(lsc.lastmenu)
	end
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
function AddBlips()
	for i,pos in ipairs(lsc.locations) do
		local blip = AddBlipForCoord(pos.inside.x,pos.inside.y,pos.inside.z)
		SetBlipSprite(blip, 72)
		SetBlipAsShortRange(blip,true)
		SetBlipScale(blip, 0.8)
	end
end
--TODO: Event needed to add blips when player is spawned
local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	AddBlips()
	TriggerServerEvent('getGarageInfo')
	firstspawn = 1
end
end)

RegisterNetEvent('lockGarage')
AddEventHandler('lockGarage', function(tbl)
	for i,garage in ipairs(tbl) do
		lsc.locations[i].locked = garage.locked
	end
end)

RegisterNetEvent("lscustoms:buttonSelected")
AddEventHandler("lscustoms:buttonSelected", function(button)
	ButtonSelected(button)
end)

function PayForVehicleRepair(repairprice,car)
	TriggerServerEvent('PayForRepairNow',repairprice)
end

--SAVING VEHICLE COSTUMIZATION
vehicles = {}
AddEventHandler('vrp_garages:setVehicle', function(vtype, vehicle)
	vehicles[vtype] = vehicle
end)

function UpdateVehicle(car)
	Citizen.CreateThread(function()
		local veh = car
		local vtype = "car"
		local vehicle = ""
		if IsThisModelABike(GetEntityModel(veh)) then
			vtype = "bike"
		end
		if IsThisModelABicycle(GetEntityModel(veh)) then
			vtype = "citybike"
		end
		
		vehicle = vehicles[vtype][2]
		-- Citizen.InvokeNative(0xAD738C3085FE7E11, veh, true, true)
		if DoesEntityExist(veh) then

			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))
			local neoncolor = table.pack(GetVehicleNeonLightsColour(veh))
			local mods = table.pack(GetVehicleMod(veh))
			local smokecolor = table.pack(GetVehicleTyreSmokeColor(veh))

			local plate = GetVehicleNumberPlateText(veh) -- Licence ID
			local plateindex = GetVehicleNumberPlateTextIndex(veh) --
			local primarycolor = colors[1] -- 1rst colour
			local secondarycolor = colors[2] -- 2nd colour
			local pearlescentcolor = extra_colors[1] -- colour type
			local wheelcolor = extra_colors[2] -- wheel colour
			local neoncolor1 = neoncolor[1] -- neon colour 1
			local neoncolor2 = neoncolor[2] -- neon colour 2
			local neoncolor3 = neoncolor[3] -- neon colour 3
			local windowtint = GetVehicleWindowTint(veh) -- Tinted Windows
			local wheeltype = GetVehicleWheelType(veh) -- Wheel Type
			local smokecolor1 = smokecolor[1]
			local smokecolor2 = smokecolor[2]
			local smokecolor3 = smokecolor[3]
			local mods0 = GetVehicleMod(veh, 0)
			local mods1 = GetVehicleMod(veh, 1)
			local mods2 = GetVehicleMod(veh, 2)
			local mods3 = GetVehicleMod(veh, 3)
			local mods4 = GetVehicleMod(veh, 4)
			local mods5 = GetVehicleMod(veh, 5)
			local mods6 = GetVehicleMod(veh, 6)
			local mods7 = GetVehicleMod(veh, 7)
			local mods8 = GetVehicleMod(veh, 8)
			local mods9 = GetVehicleMod(veh, 9)
			local mods10 = GetVehicleMod(veh, 10)
			local mods11 = GetVehicleMod(veh, 11)
			local mods12 = GetVehicleMod(veh, 12)
			local mods13 = GetVehicleMod(veh, 13)
			local mods14 = GetVehicleMod(veh, 14)
			local mods15 = GetVehicleMod(veh, 15)
			local mods16 = GetVehicleMod(veh, 16)
			local mods23 = GetVehicleMod(veh, 23)
			local mods24 = GetVehicleMod(veh, 24)

			if IsToggleModOn(veh,18) then
				turbo = "on"
			else
				turbo = "off"
			end
			if IsToggleModOn(veh,20) then
				tiresmoke = "on"
			else
				tiresmoke = "off"
			end
			if IsToggleModOn(veh,22) then
				xenon = "on"
			else
				xenon = "off"
			end
			if IsVehicleNeonLightEnabled(veh,0) then
				neon0 = "on"
			else
				neon0 = "off"
			end
			if IsVehicleNeonLightEnabled(veh,1) then
				neon1 = "on"
			else
				neon1 = "off"
			end
			if IsVehicleNeonLightEnabled(veh,2) then
				neon2 = "on"
			else
				neon2 = "off"
			end
			if IsVehicleNeonLightEnabled(veh,3) then
				neon3 = "on"
			else
				neon3 = "off"
			end
			if GetVehicleTyresCanBurst(veh) then
				bulletproof = "off"
			else
				bulletproof = "on"
			end
			if GetVehicleModVariation(veh,23) then
				variation = "on"
			else
				variation = "off"
			end

			TriggerServerEvent('lscustoms:UpdateVeh',vehicle,plate,plateindex,primarycolor,secondarycolor,pearlescentcolor,wheelcolor,neoncolor1,neoncolor2,neoncolor3,windowtint,wheeltype,mods0,mods1,mods2,mods3,mods4,mods5,mods6,mods7,mods8,mods9,mods10,mods11,mods12,mods13,mods14,mods15,mods16,turbo,tiresmoke,xenon,mods23,mods24,neon0,neon1,neon2,neon3,bulletproof,smokecolor1,smokecolor2,smokecolor3,variation)
		else
			TriggerEvent("pNotify:SendNotification",{
			text = "Intet køretøj <b style='color:#ff0000'>fundet</b>",
			type = "warning",
			timeout = (3000),
			layout = "centerLeft",
			queue = "global",
			animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
			})
		end
	end)
end

RegisterNetEvent('lscustoms:couldntpay')
AddEventHandler('lscustoms:couldntpay', function()
	lsc.currentmenu = 'repair'
end)

RegisterNetEvent('lscustoms:payGarageFalse')
AddEventHandler('lscustoms:payGarageFalse', function()
	TriggerEvent("pNotify:SendNotification",{
	text = "Du har <b style='color:#ff0000'>ikke</b> råd",
	type = "error",
	timeout = (3000),
	layout = "centerLeft",
	queue = "global",
	animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
	})
end)

RegisterNetEvent('lscustoms:StoreVehicleFalse')
AddEventHandler('lscustoms:StoreVehicleFalse', function()
		TriggerEvent("pNotify:SendNotification",{
	text = "Du ejer <b style='color:#ff0000'>ikke</b> dette køretøj",
	type = "error",
	timeout = (3000),
	layout = "centerLeft",
	queue = "global",
	animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
	killer = true
	})
end)
