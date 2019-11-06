dependency "vrp"

server_script '@vrp/lib/utils.lua'
server_script 'server.lua'

client_scripts{ 
  "client.lua"
}

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'