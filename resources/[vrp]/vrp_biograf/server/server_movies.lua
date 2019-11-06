Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP", "vrp_cinema_server")

local movies = {
	["PL_CINEMA_CARTOON"] = {
		name = "Cartoon",
		price = 11
	},
	["PL_LES1_FAME_OR_SHAME"] = {
		name = "Fame or Shame",
		price = 10
	},
	["PL_CINEMA_ACTION"] = {
		name = "Action",
		price = 10
	},
	["PL_CINEMA_ARTHOUSE"] = {
		name = "ArtHouse",
		price = 12
	},
	["PL_CINEMA_MULTIPLAYER"] = {
		name = "Meltown",
		price = 10
	},
	["PL_WEB_HOWITZER"] = {
		name = "Howitzer",
		price = 9
	},
	["PL_STD_CNT"] = {
		name = "CNT",
		price = 10
	},
	["PL_WEB_RANGERS"] = {
		name = "Rangers",
		price = 14
	}
}


RegisterServerEvent('vrp_cinema:takemovie')
AddEventHandler('vrp_cinema:takemovie', function (source, derp, price)
	local source = source
	local user_id = vRP.getUserId({source})
	
	if vRP.tryFullPayment({user_id, price}) then
		TriggerClientEvent("vrp_cinema:movie", source, derp)
	else
        TriggerClientEvent("pNotify:SendNotification", user_id,{text = {"Du har ikke penge nok | En billet koster desværre ".. price..",- DKK"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
end)

RegisterServerEvent("vrp_cinema:showmenu")
AddEventHandler("vrp_cinema:showmenu", function ()
	local source = source
	local user_id = vRP.getUserId({source})
	local menudata = {}
	
	menudata.name = "Biograf"
	menudata.css = "align = 'top-left'"

	for k, v in pairs(movies) do
		menudata[v.name] = {function (choice)
			TriggerEvent("vrp_cinema:takemovie", source, k, v.price)
			vRP.closeMenu({source})
		end,v.price..",- DKK"}
	end	
	vRP.openMenu({source, menudata})
end)
