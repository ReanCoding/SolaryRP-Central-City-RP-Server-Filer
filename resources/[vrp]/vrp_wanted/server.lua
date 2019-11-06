------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--     Script made for Origin Network 26/01/2019     --
--   Copyright 2019 ©oMarkez. All rights reserved    --
-------------------------------------------------------


MySQL = module("vrp_mysql", "MySQL")
local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_wanted")

MySQL.createCommand("vRP/wanted_column", [[
CREATE TABLE IF NOT EXISTS vrp_wanted(
  user_id INTEGER,
  wantedreason VARCHAR(100),
  wantedby INTEGER,
  timestamp INTEGER,
  count INTEGER
);
]])

MySQL.createCommand("vRP/set_wanted", "INSERT INTO vrp_wanted(user_id,wantedreason,wantedby,timestamp,count) VALUES(@user_id,@reason,@by,@timestamp,@count)")
MySQL.createCommand("vRP/get_wanted", "SELECT user_id,wantedreason,count,wantedby,timestamp FROM vrp_wanted WHERE user_id = @user_id")
MySQL.createCommand("vRP/update_wanted", "UPDATE vrp_wanted SET wantedreason = @reason, wantedby = @by, count = @count WHERE user_id = @user_id")
MySQL.createCommand("vRP/remove_wanted", "DELETE FROM vrp_wanted WHERE user_id = @user_id")
MySQL.createCommand("vRP/get_player_id","SELECT user_id,registration,phone,firstname,name,age FROM vrp_user_identities WHERE firstname = @firstname AND name = @name")

MySQL.execute("vRP/wanted_column")

cfg = getConfig()

function vRP.efterlysPers(user_id,nuser_id,grund)
	local player = vRP.getUserSource({user_id})
	vRP.getUserIdentity({user_id, function(identity)
		local firstname = identity.firstname
		local lastname = identity.name
		local name = firstname .." ".. lastname
		local time = os.time()
		MySQL.query("vRP/get_wanted", {user_id = nuser_id}, function(rows, affected)
			if #rows > 0 then
				vRP.request({player,cfg.wantedmsg.alreadywanted,25,function(player,ok)
					if ok then
						for k,v in pairs(rows) do
							local ncount = v.count + 1
							local nygrund = v.wantedreason.."<br />"..ncount..": "..grund
							local pers = name
							if name ~= v.wantedby then
								local pers = v.wantedby.." & "..name
							end

							MySQL.execute("vRP/update_wanted", {user_id = nuser_id, reason = nygrund, by = pers, count = ncount})
						end
					end
				end})
			else
				local time = os.time()
				local grund = "<br />1: "..grund
				local count = 1
				MySQL.execute("vRP/set_wanted", {user_id = nuser_id, reason = grund, by = name, timestamp = time, count = count})
			end
		end)
	end})
end

local function ch_getwanted(player,choice)
	vRP.prompt({player,cfg.prompts.registrationnr,"",function(player, cpr)
		if cpr ~= nil then
			vRP.getUserByRegistration({cpr, function(nuser_id)
				if nuser_id ~= nil then
					MySQL.query("vRP/get_wanted", {user_id = nuser_id}, function(rows, affected)
						vRP.getUserIdentity({nuser_id, function(identity)
							local firstname = identity.firstname
							local lastname = identity.name
							local navn = firstname .." ".. lastname
							local cpr = identity.registration
							local alder = identity.age
							if #rows > 0 then
								local efterlyst = "<b style='color:#ff0000'>Efterlyst</b>"
								for k,v in pairs(rows) do
									local wantedtime = os.date('%d-%m-%Y %H:%M:%S', v.timestamp)
									if #rows == 1 then
										local content = "<strong>"..cfg.div.name.."</strong>"..navn.."<br /><strong>"..cfg.div.registrationnr.."</strong>"..cpr.."<br /><strong>"..cfg.div.age.."</strong>"..alder.."<br /><br /><strong>"..cfg.div.status.."</strong>"..efterlyst.."<br /><br /><strong>"..cfg.div.reason.."</strong>"..v.wantedreason.."<br /><br /><strong>"..cfg.div.wantedby.."</strong>"..v.wantedby.."<br /><strong>"..cfg.div.wantedtime.."</strong>"..wantedtime.."<br />"
										vRPclient.setDiv(player,{"wanted_menu",".div_wanted_menu{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content})
										--
										vRP.request({player,cfg.div.removediv, 1000, function(player,ok)
											vRPclient.removeDiv(player,{"wanted_menu"})
										end})
									end
								end
							else
								local efterlyst = "<b style='color:#33cc33'>Ikke Efterlyst</b>"
								local content = "<strong>"..cfg.div.name.."</strong>"..navn.."<br /><strong>"..cfg.div.registrationnr.."</strong>"..cpr.."<br /><strong>"..cfg.div.age.."</strong>"..alder.."<br /><br /><strong>"..cfg.div.status.."</strong>"..efterlyst.."<br />"
								vRPclient.setDiv(player,{"wanted_menu",".div_wanted_menu{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content})
								--
								vRP.request({player,cfg.div.removediv, 1000, function(player,ok)
									vRPclient.removeDiv(player,{"wanted_menu"})
								end})
							end
						end})
					end)
				else
					vRPclient.notify(player,{cfg.prompts.registrationnotfound})
				end
			end})
		else
			vRPclient.notify(player,{cfg.prompts.registrationnotfound})
		end	
	end})
end 

local function ch_efterlyscpr(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,cfg.prompts.registrationnr,"",function(player, cpr)
			if cpr ~= nil and cpr ~= "" then
				vRP.getUserByRegistration({cpr, function(nuser_id)
					if nuser_id ~= nil then
						vRP.prompt({player,cfg.div.reason,"",function(player, grund)
							if grund ~= nil and grund ~= "" then
								vRP.efterlysPers(user_id,nuser_id,grund)
							else
								vRPclient.notify(player,{cfg.prompts.needtowritereason})
							end
						end})
					else
						vRPclient.notify(player,{cfg.prompts.registrationnotfound})
					end
				end})
			else
				vRPclient.notify(player,{cfg.prompts.registrationnotfound})
			end
		end})
	end
end

local function ch_efterlys(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,cfg.wantedmsg.fullname,"",function(player, snavn)
			if snavn ~= nil and snavn ~= "" then
				navn = stringSplit(snavn, " ")
				local firstname = navn[1]
				local name = navn[2]

				MySQL.query("vRP/get_player_id", {firstname = firstname, name = name}, function(rows, affected)
					if #rows > 0 then
						local identity = rows[1]
						local nuser_id = identity.user_id
						vRP.prompt({player,"Grund: ","",function(player, grund)
							vRP.efterlysPers(user_id,nuser_id,grund)
						end})
					else
						vRPclient.notify(player,{cfg.prompts.namenotfound})
					end
				end)
			else
				vRPclient.notify(player,{cfg.prompts.invalidname})
			end
		end})
	end
end

local function ch_efterlysnp(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,cfg.wantedmsg.platenumber,"",function(player, nummerplade)
			if nummerplade ~= nil and nummerplade ~= "" then
				local reg = nummerplade:gsub("P ", "")
				vRP.getUserByRegistration({reg, function(nuser_id)
					if nuser_id ~= nil then
						vRP.prompt({player,cfg.div.reason,"",function(player, grund)
							vRP.efterlysPers(user_id,nuser_id,grund)
						end})
					else
						vRPclient.notify(player,{cfg.prompts.platenotfound})
					end
				end})
			else
				vRPclient.notify(player,{cfg.prompts.invalidplate})
			end
		end})
	end
end

local function ch_fjernwanted(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,"ID: ","",function(player, nuser_id)
			if nuser_id ~= nil and nuser_id ~= "" then
				MySQL.execute("vRP/remove_wanted", {user_id = nuser_id})
			else
				vRPclient.notify(player,{cfg.prompts.idnotfound})
			end
		end})
	end
end
					
vRP.registerMenuBuilder({"police", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		if(vRP.hasPermission({user_id, cfg.wantperm}))then
			choices[cfg.menu.wantedmenu] = {function(player,choice)
				vRP.buildMenu({cfg.menu.wantedmenu, {player = player}, function(menu)
					menu.name = cfg.menu.wantedmenu
					menu.css={top="75px",header_color="rgba(235,0,0,0.75)"}
					menu.onclose = function(player) vRP.openMainMenu({player}) end

					menu[cfg.menu.getwanted.title] = {ch_getwanted,cfg.menu.getwanted.desc}
					menu[cfg.menu.wantname.title] = {ch_efterlys,cfg.menu.wantname.desc}
					menu[cfg.menu.wantplate.title] = {ch_efterlysnp,cfg.menu.wantplate.desc}
					menu[cfg.menu.wantregistration.title] = {ch_efterlyscpr,cfg.menu.wantregistration.desc}

					if(vRP.hasPermission({user_id, cfg.removewantperm}))then
						menu[cfg.menu.removewanted.title] = {ch_fjernwanted,cfg.menu.removewanted.desc}
					end

					vRP.openMenu({player, menu})
				end})
			end, "Efterlysnings Menu"}
		end
		add(choices)
	end
end})

function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end