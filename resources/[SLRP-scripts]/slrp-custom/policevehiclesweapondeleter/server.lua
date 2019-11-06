local Cops = {}

RegisterServerEvent("ft_removecopguns:askDropWeapon")
AddEventHandler("ft_removecopguns:askDropWeapon", function(wea)
	local isCop = false

	for _,k in pairs(Cops) do
		if(k == getPlayerID(source)) then
			isCop = true
			break;
		end
	end

	if(not isCop) then
		TriggerClientEvent("ft_removecopguns:drop", source, wea)
	end
end)

function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end