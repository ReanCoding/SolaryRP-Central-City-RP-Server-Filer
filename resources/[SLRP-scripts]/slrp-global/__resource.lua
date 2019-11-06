dependency "vrp"

client_scripts {
    "lib/Proxy.lua",
    "lib/Tunnel.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "commands-server.lua"
}