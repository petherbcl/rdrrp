fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	"@_core/lib/utils.lua",
	"@_core/config/Components.lua",
	"@_core/config/Overlays.js",

    'config.lua',
	--'config/components.lua',
	--'config/overlay.js',
	'config/data_ui.js',

	'client/customization.lua',
	'client/scene.lua',
	'client/spawn.lua',
	--'client/overlay.lua',
}

server_scripts {
	"@_core/lib/utils.lua",
	'server/server.lua'
}

files{
	'./ui/*',
	'./ui/css/*',
	'./ui/js/*'
}

ui_page 'ui/index.html'

exports {	
	'setOverlayData',
	'colorPalettes',
	'textureTypes',
	'overlaysInfo',
	'clothOverlayItems',
	'overlayAllLayers',
	'setOverlaySelected',
	'getDataCreator'
}