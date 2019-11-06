resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

ui_page "client/html/ui.html"
files {
	"client/html/ui.html",
	"client/html/styles.css",
	"client/html/scripts.js",
	"configNui.js",
	"client/html/debounce.min.js",
	"client/html/sweetalert2.all.min.js",
	"client/html/assets/banner.png",
	"client/html/assets/logo.png",
	-- Keys
	"client/html/assets/key_k.jpg",
	"client/html/assets/key_e.jpg",
	"client/html/assets/key_y.jpg",
	"client/html/assets/key_b.jpg",
	"client/html/assets/key_ctrl.jpg",
	"client/html/assets/key_f3.jpg",
	"client/html/assets/key_left_arrow.jpg",
	"client/html/assets/key_right_arrow.jpg",
	"client/html/assets/key_up_arrow.jpg",
	"client/html/assets/key_down_arrow.jpg",
	"client/html/assets/key_t.jpg",
	"client/html/assets/key_l.jpg",
	"client/html/assets/key_home.jpg",
	"client/html/assets/key_f9.jpg",
	"client/html/assets/key_g.jpg",
	"client/html/assets/key_shift.jpg",
	"client/html/assets/key_h.jpg",
	"client/html/assets/key_x.jpg",
	"client/html/assets/key_z.jpg",
	"client/html/assets/key_f5.jpg"
}

client_scripts {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"config.lua",
	"client/main.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server/main.lua"
}
