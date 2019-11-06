dependency "vrp"

client_scripts {
	"lib/Proxy.lua",
	"lib/Tunnel.lua",
    "revive/client.lua",
	"fixveh/client.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "revive/server.lua",
	"fixveh/server.lua"
}