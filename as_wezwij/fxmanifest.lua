fx_version 'cerulean'
game 'gta5'

author 'asnasioo'
description 'komenda /wezwij i /offlinewezwij'
version '1.0.0'



client_script 'c.lua'
server_script {
    '@oxmysql/lib/MySQL.lua',  
    's.lua',
}
shared_script 'config.lua'
