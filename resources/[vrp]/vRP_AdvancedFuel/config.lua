petrolCanPrice = 1

lang = "en"
-- lang = "fr"

settings = {}
settings["en"] = {
	openMenu = "Tryk ~g~E~w~ for at åbne menuen.",
	electricError = "~r~Du har et elektrisk køretøj.",
	fuelError = "~r~Du er ikke i et elektrisk køretøj.",
	buyFuel = "Køb benzin",
	liters = "Liter",
	percent = "Procent",
	confirm = "Bekræft",
	fuelStation = "Circle K - Tankstation",
	boatFuelStation = "Tankstation | Båd",
	avionFuelStation = "Tankstation | Flyvemaskine ",
	heliFuelStation = "Tankstation | Helikopter",
	getJerryCan = "Tryk ~g~E~w~ for at købe en benzin dunk (DKK"..petrolCanPrice..")",
	refeel = "Tryk ~g~E~w~ for at tanke køretøjet.",
	YouHaveBought = "Du har købt ",
	fuel = " Liter af benzin",
	price = "Pris"
}

settings["fr"] = {
	openMenu = "Appuyez sur ~g~E~w~ pour ouvrir le menu.",
	electricError = "~r~Vous avez une voiture électrique.",
	fuelError = "~r~Vous n'êtes pas au bon endroit.",
	buyFuel = "acheter de l'essence",
	liters = "litres",
	percent = "pourcent",
	confirm = "Valider",
	fuelStation = "Station essence",
	boatFuelStation = "Station d'essence | Bateau",
	avionFuelStation = "Station d'essence | Avions",
	heliFuelStation = "Station d'essence | Hélicoptères",
	getJerryCan = "Appuyez sur ~g~E~w~ pour acheter un bidon d'essence ("..petrolCanPrice.."$)",
	refeel = "Appuyez sur ~g~E~w~ pour remplir votre voiture d'essence.",
	YouHaveBought = "Vous avez acheté ",
	fuel = " litres d'essence",
	price = "prix"
}


showBar = true
showText = true


hud_form = 1 -- 1 : Vertical | 2 = Horizontal
hud_x = 0.175 
hud_y = 0.885

text_x = 0.2575
text_y = 0.975


electricityPrice = 3 -- NOT RANOMED !!
petrolCanPrice = 20
randomPrice = false --Random the price of each stations
price = 14 --If random price is on False, set the price here for 1 liter