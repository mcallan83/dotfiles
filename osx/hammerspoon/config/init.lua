--------------------------------------------------------------------------------
-- Filename: osx/hammerspoon/config/init.lua
-- Author: Mike Callan
-- URL: http://github.com/mcallan83/dotfiles

-- Ideas borrowed from:
-- https://github.com/jasonrudolph/keyboard
-- http://brettterpstra.com/2011/01/22/quick-tip-applescript-application-toggle------------------------------------------------------------------------------

keyUpDown = function(modifiers, key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end

require('super-duper-mode')
require('windows')

hs.notify.new({title='Hammerspoon', informativeText='Config Loaded'}):send()
