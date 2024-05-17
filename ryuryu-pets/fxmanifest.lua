fx_version 'cerulean'

game 'gta5'

author 'ryuryu Scripts'
description 'ryuryu pets'

version '1.0.1'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/config.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

