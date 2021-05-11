fx_version 'adamant'

game 'gta5'

description 'Simple doctor AI'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'config.lua',
	'client/main.lua'
}
