fx_version "adamant"

games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


ui_page "nui/index.html"

client_scripts {
	"@_core/lib/utils.lua",
	"client.lua",
}

server_scripts {
	"@_core/lib/utils.lua",
	'server.lua',
}

files {
	"nui/index.html",
	"nui/script.js",
	"nui/style.css",
	"nui/font/crock.ttf",
	"nui/images/*.png",
}