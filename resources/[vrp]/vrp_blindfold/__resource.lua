resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency "vrp"

ui_page 'html/index.html'

server_script {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"@vrp/lib/utils.lua",
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

client_script {
	'client.lua'
}

files {
	'html/index.html',
	'html/assets/images/blindfold.png',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/init.js',
}
