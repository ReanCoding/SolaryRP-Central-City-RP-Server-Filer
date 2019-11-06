--vrpMySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local htmlEntities = module("lib/htmlEntities")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_gcphone")
local lang = vRP.lang
--[[
--vrpMySQL.createCommand("vRP/get_phones", "SELECT * FROM users WHERE identifier != NULL AND phone_number != NULL")
--vrpMySQL.createCommand("vRP/get_phone", "SELECT * FROM users WHERE identifier = @identifier")
--vrpMySQL.createCommand("vRP/phone_from_id", "SELECT * FROM users WHERE identifier = @id")
--vrpMySQL.createCommand("vRP/id_from_phone", "SELECT * FROM users WHERE phone_number = @number")
--vrpMySQL.createCommand("vRP/police_phone", "UPDATE users SET phone_number = @phone, oldphone = @old WHERE identifier = @identifier")
--vrpMySQL.createCommand("vRP/check_police", "SELECT * FROM users WHERE phone_number = @phone")
--vrpMySQL.createCommand("vRP/update_oldphone", "UPDATE users SET oldphone = @old WHERE identifier = @identifier, phone_number = @phone")
]]
PhoneNumbers        = {}

politicoords = {
  {["x"] = 440.22341918945, ["y"] = -975.72308349609, ["x"] = 30.689586639404}
}

text = {
  servicecall = "Modtaget {1} call, tager du den? <em>{2}</em>",
  opkaldtaget = "Opkaldet er taget!"
}

services = {
  ["Politi"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 30, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "~r~Central alarmen:~n~~s~",
    notify = "~b~Du har ringet til politiet.",
    answer_notify = "~b~Politiet er på vej."
  },
  ["Ambulance"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 30, -- 5 minutes
    alert_permission = "emergency.service",
    alert_notify = "~r~Central alarmen:~n~~s~",
    notify = "~b~Du har ringet efter ambulancen.",
    answer_notify = "~b~Ambulancen er på vej."
  },
  ["Taxi"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "taxi.service",
    alert_notify = "~y~Taxi alarm:~n~~s~",
    notify = "~y~Du har ringet til en taxa.",
    answer_notify = "~y~Din taxa er på vej."
  },
  ["Uber"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "uber.service",
    alert_notify = "~y~Uber alarm:~n~~s~",
    notify = "~y~Du har ringet til en uber.",
    answer_notify = "~y~Din uber er på vej."
  },  
  ["Advokat"] = {
    blipid = 198,
    blipcolor = 1,
    alert_time = 300,
    alert_permission = "advokat.service",
    alert_notify = "~y~Advokat alarm:~n~~s~",
    notify = "~y~Du har ringet til en advokat.",
    answer_notify = "~y~Din advokat er på vej."
  }, 
  ["Mekaniker"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "repair.service",
    alert_notify = "~y~Mekaniker alarm:~n~~s~",
    notify = "~y~Du har ringet efter en mekaniker.",
    answer_notify = "~y~En mekaniker er sendt ud."
  }
}


function notifyAlertSMS (number, alert, listSrc)
  if PhoneNumbers[number] ~= nil then
    for k,v in pairs(PhoneNumbers) do
      if k == number then
        local n = getPhoneNumberFromId(v.id)
        if n ~= nil then
          TriggerEvent('gcPhone:_internalAddMessage', number, n, 'De #' .. alert.numero  .. ' : ' .. alert.message, 0, function (smsMess)
            TriggerClientEvent("gcPhone:receiveMessage", tonumber(k), smsMess)
          end)
          if alert.coords ~= nil then
            TriggerEvent('gcPhone:_internalAddMessage', number, n, 'GPS: ' .. alert.coords.x .. ', ' .. alert.coords.y, 0, function (smsMess)
              TriggerClientEvent("gcPhone:receiveMessage", tonumber(k), smsMess)
            end)
          end
        end
      end
    end
  end
end

RegisterServerEvent('vrp_addons_gcphone:startCallpol')
AddEventHandler('vrp_addons_gcphone:startCallpo', function (callnumber, message, coords)
  local source = source
  getPhoneNumber(source, function(plynumber)
    if not callnumber == 112 or not callnumber == "112" then
      local callid = getIdFromPhone(callnumber)
      local callsource = vRP.getUserSource({callid})
      notifyAlertSMS(callnumber, {message = message,coords = coords,numero = plynumber,}, callsource)
    else
      local service_name = "Politi"
      local service = services[service_name]
      local answered = false
      if service then
        local players = {}
        users = vRP.getUsers({})
        for k,v in pairs(users) do
          local player = vRP.getUserSource({k})
          -- check user
          if vRP.hasPermission({k,service.alert_permission}) and player ~= nil then
            table.insert(players,player)
          end
        end
      
        local msg = message
        local memess = _internalAddMessage(plynumber, "112", msg, 1)
        local memess = _internalAddMessage("112", plynumber, "Tak for din henvendelse. Vi sender en vogn ud hurtigst muligt.", 1)
        -- send notify and alert to all listening players
        for k,v in pairs(players) do 
          vRPclient.notify(v,{service.alert_notify..msg})

          -- add position for service.time seconds
          local x,y,z = coords.x,coords.y,coords.z
          vRPclient.addBlip(v,{x,y,z,service.blipid,service.blipcolor,"("..service_name..") "..msg}, function(bid)
            SetTimeout(service.alert_time*1000,function()
              vRPclient.removeBlip(v,{bid})
            end)
          end)
      
          if service then
            vRP.request({v,"Politi opkald: ".. msg.. " ønsker du at tage det?", 30, function(v,ok)
              if ok then -- take the call
                if not answered then
                  -- answer the call
                  vRPclient.notify(source,{service.answer_notify})
                  vRPclient.setGPS(v,{x,y})
                  answered = true
                else
                  vRPclient.notify(v,{text.opkaldtaget})
                end
              end
            end})
          end
        end
      end
    end
  end)
end)

RegisterServerEvent('vrp_addons_gcphone:startCallambu')
AddEventHandler('vrp_addons_gcphone:startCallambu', function (callnumber, message, coords)
  local source = source
  getPhoneNumber(source, function(plynumber)
    if not callnumber == 112 or not callnumber == "112" and not callnumber == "police" and not callnumber == "ambulance" then
      local callid = getIdFromPhone(callnumber)
      local callsource = vRP.getUserSource({callid})
      notifyAlertSMS(callnumber, {message = message,coords = coords,numero = plynumber,}, callsource)
    else
      local service_name = "Ambulance"
      local service = services[service_name]
      local answered = false
      if service then
        local players = {}
        users = vRP.getUsers({})
        for k,v in pairs(users) do
          local player = vRP.getUserSource({k})
          -- check user
          if vRP.hasPermission({k,service.alert_permission}) and player ~= nil then
            table.insert(players,player)
          end
        end
      
        local msg = message
        local memess = _internalAddMessage(plynumber, "112", msg, 1)
        local memess = _internalAddMessage("112", plynumber, "Tak for din henvendelse. Vi sender en vogn ud hurtigst muligt.", 1)
        -- send notify and alert to all listening players
        for k,v in pairs(players) do 
          vRPclient.notify(v,{service.alert_notify..msg})

          -- add position for service.time seconds
          local x,y,z = coords.x,coords.y,coords.z
          vRPclient.addBlip(v,{x,y,z,service.blipid,service.blipcolor,"("..service_name..") "..msg}, function(bid)
            SetTimeout(service.alert_time*1000,function()
              vRPclient.removeBlip(v,{bid})
            end)
          end)
      
          if service then
            vRP.request({v,"Politi opkald: ".. msg.. " ønsker du at tage det?", 30, function(v,ok)
              if ok then -- take the call
                if not answered then
                  -- answer the call
                  vRPclient.notify(source,{service.answer_notify})
                  vRPclient.setGPS(v,{x,y})
                  answered = true
                else
                  vRPclient.notify(v,{text.opkaldtaget})
                end
              end
            end})
          end
        end
      end
    end
  end)
end)

function getPhoneNumber(source, callback) 
  local user_id = vRP.getUserId({source})
  MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
    ['@identifier'] = user_id
  }, function(result)
    callback(result[1].phone_number)
  end)
end

function getPhoneNumberFromId(user_id)
  --vrpMySQL.query("vRP/phone_from_id", {id = user_id}, function(rows, affected)
    if #rows > 0 then
      return rows[1].phone_number
    else
      return nil
    end
--end)
end

function getIdFromPhone(number)
  if number ~= nil then
    --vrpMySQL.query("vRP/id_from_phone", {number = number}, function(rows,affected)
      if #rows > 0 then
        return rows[1].identifier
      else
        return nil
      end
    --end)
  end
end
--[[
function _internalAddMessage(transmitter, receiver, message, owner)
  local Query = "INSERT INTO phone_messages (`transmitter`, `receiver`,`message`, `isRead`,`owner`) VALUES(@transmitter, @receiver, @message, @isRead, @owner);"
  local Query2 = 'SELECT * from phone_messages WHERE `id` = (SELECT LAST_INSERT_ID());'
  local Parameters = {
      ['@transmitter'] = transmitter,
      ['@receiver'] = receiver,
      ['@message'] = message,
      ['@isRead'] = owner,
      ['@owner'] = owner
  }
  return MySQL.Sync.fetchAll(Query .. Query2, Parameters)[1]
end

RegisterNetEvent("policeDispatch")
AddEventHandler("policeDispatch", function(source)
  local _source = source
  if _source ~= nil then
    local user_id = vRP.getUserId({_source})
    local oldphone = getPhoneNumberFromId(user_id)
    if vRP.hasPermission({user_id,"police.dispatch"}) then
      local phone = "112"
      --vrpMySQL.query("check_police", {phone = phone}, function(rows,affected)
        if #rows > 0 then
          vRPclient.notify(source,{"Der er alle en alarmcentral operatør!"})
        else
          --vrpMySQL.execute("vRP/police_phone", {phone = phone, old = oldphone})
          TriggerClientEvent("policeOperator", _source)
        end
      end)
    end
  end
end)

RegisterNetEvent("noDispatch")
AddEventHandler("policeDispatch", function(source)
  local _source = source
  if _source ~= nil then
    local user_id = vRP.getUserId({_source})
    --vrpMySQL.query("vRP/get_phone", {id = user_id}, function(rows,affected)
      if #rows > 0 then
        local oldphone = rows[1].oldphone

        --vrpMySQL.execute("vRP/update_oldphone", {id = user_id, old = oldphone})
      end
    end)
  end
end)]]