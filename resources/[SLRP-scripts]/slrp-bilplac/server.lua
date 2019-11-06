AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	if first_spawn then
		TriggerClientEvent("hp_carplacer:place", source)
	end
end)
