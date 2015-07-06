-- https://github.com/cmsj/hammerspoon-config/blob/master/init.lua
-- https://github.com/BrianGilbert/.hammerspoon/blob/master/init.lua

-- init grid
hs.grid.MARGINX     = 0
hs.grid.MARGINY     = 0
hs.grid.GRIDWIDTH   = 2
hs.grid.GRIDHEIGHT  = 2

-- disable animation
hs.window.animationDuration = 0

-- keyboard modifiers
local mash = {"ctrl", "alt"}
local mash_app = {"cmd", "ctrl", "alt"}
local super = {"cmd", "ctrl", "alt", "shift"}

-- reload config
hs.hotkey.bind(super, "R", function() hs.reload() end)
hs.notify.new({ title='Hammerspoon', informativeText='Config loaded' }):send():release()

-- resize windows
hs.hotkey.bind(mash , 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'L', hs.grid.pushWindowRight)

-- toggle window hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)

-- adjust grid size @todo
-- hs.hotkey.bind(mash, '=', function() hs.grid.adjustWidth( 1) end)
-- hs.hotkey.bind(mash, '-', function() hs.grid.adjustWidth(-1) end)
