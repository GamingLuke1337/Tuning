fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'GamingLuke1337 & fabryyzzz'
description ' A Mechanic Menu working with ox_lib'
version '1.0.0'

client_script 'client/main.lua'

server_scripts {
    'server/main.lua',
    'server/update.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
