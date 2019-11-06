local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")

-- this module define some admin menu functions

local player_lists = {}

local function ch_list(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.list") then
    if player_lists[player] then -- hide
      player_lists[player] = nil
      vRPclient.removeDiv(player,{"user_list"})
    else -- show
      local content = ""
      local count = 0
      for k,v in pairs(vRP.rusers) do
        count = count+1
        local source = vRP.getUserSource(k)
        vRP.getUserIdentity(k, function(identity)
          if source ~= nil then
            content = content.."<br />"..k.." => <span class=\"pseudo\">"..vRP.getPlayerName(source).."</span> <span class=\"endpoint\">"..vRP.getPlayerEndpoint(source).."</span>"
            if identity then
              content = content.." <span class=\"name\">"..htmlEntities.encode(identity.firstname).." "..htmlEntities.encode(identity.name).."</span> <span class=\"reg\">"..identity.registration.."</span> <span class=\"phone\">"..identity.phone.."</span>"
            end
          end

          -- check end
          count = count-1
          if count == 0 then
            player_lists[player] = true
            local css = [[
.div_user_list{ 
  margin: auto; 
  padding: 8px; 
  width: 650px; 
  margin-top: 80px; 
  background: black; 
  color: white; 
  font-weight: bold; 
  font-size: 1.1em;
} 

.div_user_list .pseudo{ 
  color: rgb(0,255,125);
}

.div_user_list .endpoint{ 
  color: rgb(255,0,0);
}

.div_user_list .name{ 
  color: #309eff;
}

.div_user_list .reg{ 
  color: rgb(0,125,255);
}
              
.div_user_list .phone{ 
  color: rgb(211, 0, 255);
}
            ]]
            vRPclient.setDiv(player,{"user_list", css, content})
          end
        end)
      end
    end
  end
end

local function ch_whitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"User id to whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,true)
      vRPclient.notify(player,{"whitelisted user "..id})
    end)
  end
end

local function ch_unwhitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"User id to un-whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,false)
      vRPclient.notify(player,{"un-whitelisted user "..id})
    end)
  end
end

local function ch_addgroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to add: ","",function(player,group)
        vRP.addUserGroup(id,group)
        vRPclient.notify(player,{group.." added to user "..id})
      end)
    end)
  end
end

local function ch_removegroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to remove: ","",function(player,group)
        vRP.removeUserGroup(id,group)
        vRPclient.notify(player,{group.." removed from user "..id})
      end)
    end)
  end
end

local function ch_kick(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
    vRP.prompt(player,"User id to kick: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.kick(source,reason)
          vRPclient.notify(player,{"kicked user "..id})

					local dname = "[ID - ".. tostring(user_id).. "] SPAnti-Abuse"
					local dmessage = "ID ".. tostring(user_id).. " Just kicked ID ".. tostring(id).. " for ".. reason
					PerformHttpRequest('https://discordapp.com/api/webhooks/622719384489689095/-70ZApfUYFXMkoULp0zU0EDHp6SGgRUjBbHlCuNoOqVu3c2GMKPux2fzGmIax-bSz3eY', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
        end
      end)
    end)
  end
end

local function ch_ban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
    vRP.prompt(player,"User id to ban: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.ban(source,reason)
          vRPclient.notify(player,{"banned user "..id})

					local dname = "[ID - ".. tostring(user_id).. "] SPAnti-Abuse"
					local dmessage = "ID ".. tostring(user_id).. " Just bannned ID ".. tostring(id).. " for ".. reason
					PerformHttpRequest('https://discordapp.com/api/webhooks/622720155243249674/tDl0yjeiKuAcBnHyJmGV3No2r3S9-jXCgkYa_bu6vuj37r1mAz_bJOYCajmhmJ0KPbE7', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
        end
      end)
    end)
  end
end

local function ch_unban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"User id to unban: ","",function(player,id)
      id = parseInt(id)
      vRP.setBanned(id,false)
      vRPclient.notify(player,{"un-banned user "..id})

			local dname = "[ID - ".. tostring(user_id).. "] SPAnti-Abuse"
			local dmessage = "ID ".. tostring(user_id).. " Just unbanned ID ".. tostring(id)
			PerformHttpRequest('https://discordapp.com/api/webhooks/622720258469527583/gqlGBPm8q4P0hoj3kFyhgc3hsqOfq9O4FqhShs2AOjMsQqa9oQ6zs1p_GD6AiJFrzzrt', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
    end)
  end
end

local function ch_emote(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_emote") then
    vRP.prompt(player,"Animation sequence ('dict anim optional_loops' per line): ","",function(player,content)
      local seq = {}
      for line in string.gmatch(content,"[^\n]+") do
        local args = {}
        for arg in string.gmatch(line,"[^%s]+") do
          table.insert(args,arg)
        end

        table.insert(seq,{args[1] or "", args[2] or "", args[3] or 1})
      end

      vRPclient.playAnim(player,{true,seq,false})
    end)
  end
end

local function ch_sound(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_sound") then
    vRP.prompt(player,"Sound 'dict name': ","",function(player,content)
      local args = {}
      for arg in string.gmatch(content,"[^%s]+") do
        table.insert(args,arg)
      end
      vRPclient.playSound(player,{args[1] or "", args[2] or ""})
    end)
  end
end

local function ch_coords(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"Copy the coordinates using Ctrl-A Ctrl-C",x..","..y..","..z,function(player,choice) end)
  end)
end

local function ch_tptome(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"User id:","",function(player,user_id) 
      local tplayer = vRP.getUserSource(tonumber(user_id))
      if tplayer ~= nil then
        vRPclient.teleport(tplayer,{x,y,z})
      end
    end)
  end)
end

local function ch_tpto(player,choice)
  vRP.prompt(player,"User id:","",function(player,user_id) 
    local tplayer = vRP.getUserSource(tonumber(user_id))
    if tplayer ~= nil then
      vRPclient.getPosition(tplayer,{},function(x,y,z)
        vRPclient.teleport(player,{x,y,z})
      end)
    end
  end)
end

local function ch_tptocoords(player,choice)
  	vRP.prompt(player,"Coords x,y,z:","",function(player,fcoords) 
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
		table.insert(coords,tonumber(coord))
		end

		local x,y,z = 0,0,0
		if coords[1] ~= nil then x = coords[1] end
		if coords[2] ~= nil then y = coords[2] end
		if coords[3] ~= nil then z = coords[3] end

		vRPclient.teleport(player,{x,y,z})
	end)
end

local function ch_givemoney(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Amount:","",function(player,amount) 
    amount = parseInt(amount)
    vRP.giveMoney(user_id, amount)
     local steamname = GetPlayerName(user_id)
  PerformHttpRequest('https://discordapp.com/api/webhooks/622720418830352416/mU-Hf5fGZCCDcM_S9qYDxGPq_UmapZV0W_q9Rmf9eF3mTWnj8zUZV3boJzNFDWghlAWt', function(err, text, headers) end, 'POST', json.encode({username = "DarkNetwork", content = "```Steam: ".. steamname.."\nID: ".. user_id.."\nHar spawnet "..amount.." DKK ind.```"}), { ['Content-Type'] = 'application/json' })  -- answer the call
    end)
  end
end

local function ch_giveitem(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Id name:","",function(player,idname) 
      idname = idname or ""
      vRP.prompt(player,"Amount:","",function(player,amount) 
        amount = parseInt(amount)
        vRP.giveInventoryItem(user_id, idname, amount,true)
         local steamname = GetPlayerName(user_id)
PerformHttpRequest('https://discordapp.com/api/webhooks/622720553559654423/squOXpDvUZvQ6vJCf7I5zGgZTzJ6usR2qpZpuY67N0iAGutsPkfyCZuSAXmK3e2w6vm9', function(err, text, headers) end, 'POST', json.encode({username = "DarkNetwork", content = "```Steam: ".. steamname.."\nID: ".. user_id.."\nHar spawnet "..amount.." stk "..idname.." ind.```"}), { ['Content-Type'] = 'application/json' })  -- answer the call
  
      end)
    end)
  end
end

local function ch_calladmin(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Beskriv dit problem. Minimun 10 tegn:","",function(player,desc)
    desc = desc or ""

    local answered = false
    local players = {}
    for k,v in pairs(vRP.rusers) do
      local player = vRP.getUserSource(tonumber(k))
      -- check user
      if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
        table.insert(players,player)
      end
    end

    -- send notify and alert to all listening players
    if string.len(desc) > 10 and string.len(desc) < 1000 then
      for k,v in pairs(players) do
        vRP.request(v,"Admin ticket (user_id = "..user_id..") take/TP to ?: "..htmlEntities.encode(desc), 60, function(v,ok)
        if ok then -- take the call
          if not answered then
             local steamname = GetPlayerName(v)
            PerformHttpRequest('https://discordapp.com/api/webhooks/622720720706863104/i9-G-brw7yxO6DI2ILT2URBaCXyLXJWZ5igo1gjYEt9cVxYLUWJ2Xj88YsM7PII8nMRJ', function(err, text, headers) end, 'POST', json.encode({username = "DarkNetwork", content = "```\n".. steamname.."\nTog et admin call fra ID "..user_id..".\nIndhold: "..desc..".```"}), { ['Content-Type'] = 'application/json' })  -- answer the call
            vRPclient.notify(player,{"En staff har tager dit opkald!"})
            vRPclient.getPosition(player, {}, function(x,y,z)
            vRPclient.teleport(v,{x,y,z})
            end)
            answered = true
          else
            vRPclient.notify(v,{"Du er for langsom!"})
          end
        end
        end)
      end
    end
    end)
  end
end

local player_customs = {}

local function ch_display_custom(player, choice)
  vRPclient.getCustomization(player,{},function(custom)
    if player_customs[player] then -- hide
      player_customs[player] = nil
      vRPclient.removeDiv(player,{"customization"})
    else -- show
      local content = ""
      for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end

      player_customs[player] = true
      vRPclient.setDiv(player,{"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content})
    end
  end)
end

local function ch_noclip(player, choice)
  vRPclient.toggleNoclip(player, {})
end


vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}

    -- build admin menu
    choices["Admin"] = {function(player,choice)
      vRP.buildMenu("admin", {player = player}, function(menu)
        menu.name = "Admin"
        menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
        menu.onclose = function(player) vRP.openMainMenu(player) end -- nest menu

        if vRP.hasPermission(user_id,"player.list") then
          menu["User list"] = {ch_list,"Show/hide user list."}
        end
        if vRP.hasPermission(user_id,"player.whitelist") then
          menu["Whitelist user"] = {ch_whitelist}
        end
        if vRP.hasPermission(user_id,"player.group.add") then
          menu["Add group"] = {ch_addgroup}
        end
        if vRP.hasPermission(user_id,"player.group.remove") then
          menu["Remove group"] = {ch_removegroup}
        end
        if vRP.hasPermission(user_id,"player.unwhitelist") then
          menu["Un-whitelist user"] = {ch_unwhitelist}
        end
        if vRP.hasPermission(user_id,"player.kick") then
          menu["Kick"] = {ch_kick}
        end
        if vRP.hasPermission(user_id,"player.ban") then
          menu["Ban"] = {ch_ban}
        end
        if vRP.hasPermission(user_id,"player.unban") then
          menu["Unban"] = {ch_unban}
        end
        if vRP.hasPermission(user_id,"player.noclip") then
          menu["Noclip"] = {ch_noclip}
        end
        if vRP.hasPermission(user_id,"player.coords") then
          menu["Coords"] = {ch_coords}
        end
        if vRP.hasPermission(user_id,"player.tptome") then
          menu["TpToMe"] = {ch_tptome}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["TpTo"] = {ch_tpto}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["TpToCoords"] = {ch_tptocoords}
        end
        if vRP.hasPermission(user_id,"player.givemoney") then
          menu["Give money"] = {ch_givemoney}
        end
        if vRP.hasPermission(user_id,"player.giveitem") then
          menu["Give item"] = {ch_giveitem}
        end
        if vRP.hasPermission(user_id,"player.display_custom") then
          menu["Display customization"] = {ch_display_custom}
        end
        if vRP.hasPermission(user_id,"player.calladmin") then
          menu["Kald på en staff!"] = {ch_calladmin}
        end

        vRP.openMenu(player,menu)
      end)
    end}

    add(choices)
  end
end)
