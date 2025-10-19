fx_version 'cerulean'
game 'gta5'

author 'Comrad | Scripts'
description 'Give item / Ammo to all players on the server'
version '1.0.0'

server_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'server/commands.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client/client.lua'
}
