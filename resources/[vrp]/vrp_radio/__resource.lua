-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
dependency "vrp"
client_scripts {
    "lib/Proxy.lua",
    "lib/Tunnel.lua",
    "client/main.lua"
}
server_scripts {
    "@vrp/lib/utils.lua",
    "server/main.lua"

}

-- NUI Default Page
ui_page('html/index.html')

files({
    'html/index.html',
    -- Begin Sound Files Here...
    'html/sounds/copradio.ogg',
    'html/sounds/copradiooff.ogg'
})