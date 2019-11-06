RegisterCommand("discord", function()
     msg("Discord - https://discord.gg/JfDcGaJ") 
end, false)

function msg(text)
   TriggerEvent("chatMessage", "[Server]", {255,0,0}, text)
end	