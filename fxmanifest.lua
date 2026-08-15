-- =================================================================
-- D3XL FiveM Standalone Notification System Manifest
-- Resource Name: d3xl-notify
-- Author: d3xl
-- =================================================================

fx_version 'cerulean'
game 'gta5'

author 'd3xl'
description 'Modern  Announcement System V1'
version '1.1.0'

ui_page 'index.html'

shared_scripts {
    'config.lua'
}

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

files {
    'index.html',
    'style.css',
    'config.js',
    'app.js'
}

export 'SendNotify'
export 'Notify'
