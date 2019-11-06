resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependencies {
	'vrp',
	'vrp_mysql'
}

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/Roboto.ttf',
	'html/Captain.ttf',
	'html/trash.svg'
}
client_script "client.lua"
server_scripts{
	"@vrp/lib/utils.lua",
	"server.lua",
}
