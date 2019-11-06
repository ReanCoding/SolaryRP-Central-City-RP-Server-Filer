resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

dependency "vrp"

this_is_a_map 'yes'

client_scripts {
  'heal_cl.lua',
  'client.lua'
}

server_scripts {
  '@vrp/lib/utils.lua'
}