local dname = "Tropical"
local dmessage = "**Server 1 er hermed oppe!**                                                                                                                                                                                                                                                                                                                            `Direct Connect: 138.201.188.17:30120`                                                                                                                                                                                                                                                                                                                            @here"
PerformHttpRequest('https://discordapp.com/api/webhooks/602650887525236737/vZ69zgtZ2FVieDTNHi1RkMvgaB6vpdnipYkm6Dqtr-nDV5eY794TYNdre5p8ooPQZgOK', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })