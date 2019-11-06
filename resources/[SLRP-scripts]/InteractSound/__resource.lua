
------
-- InteractSound by Scott
-- Verstion: v0.0.1
------

-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files({
    'client/html/index.html',
    'client/html/sounds/detector.ogg',
    'client/html/sounds/blahblahblah.mp3',
    'client/html/sounds/fartfaelde.ogg',
    'client/html/sounds/tchatNotification.ogg',
    'client/html/sounds/alkometer.ogg',
    'client/html/sounds/lock.ogg',
    'client/html/sounds/copradiooff.ogg',
    'client/html/sounds/presslock.ogg',
    'client/html/sounds/copradio.ogg',
    'client/html/sounds/pressunlock.ogg',
    'client/html/sounds/handcuff.ogg',
    'client/html/sounds/tchatNotification.ogg'
})