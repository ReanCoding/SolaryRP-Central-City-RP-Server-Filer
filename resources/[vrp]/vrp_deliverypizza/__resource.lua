
description "vrp_tattoos"
--ui_page "ui/index.html"

dependency "vrp"

files {
  'metas/carcols.meta',
  'metas/carvariations.meta',
  'metas/vehicles.meta',
  'metas/handling.meta',
  'metas/vehiclelayouts.meta',
}
data_file 'HANDLING_FILE' 'metas/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'metas/vehicles.meta'
data_file 'CARCOLS_FILE' 'metas/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'metas/carvariations.meta'

client_scripts{ 
  "lib/Proxy.lua",
  "lib/Tunnel.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}