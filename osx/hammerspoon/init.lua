-- https://github.com/cmsj/hammerspoon-config/blob/master/init.lua
-- https://github.com/BrianGilbert/.hammerspoon/blob/master/init.lua

-- keyboard modifiers
local mash = {"cmd", "shift"}
local mash_app = {"cmd", "ctrl", "alt"}
local hyper = {"cmd", "ctrl", "alt", "shift"}

-- disable window animations
hs.window.animationDuration = 0

-- move window to left half
hs.hotkey.bind(mash, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- move window to right half
hs.hotkey.bind(mash, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- maximize window
hs.hotkey.bind(mash, 'RETURN', hs.grid.maximizeWindow)

-- toggle window hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)

-- toggle apps
hs.hotkey.bind(hyper, 'C', function() hs.application.launchOrFocus('Google Chrome') end)
hs.hotkey.bind(hyper, 'F', function() hs.application.launchOrFocus('Finder') end)
hs.hotkey.bind(hyper, 'I', function() hs.application.launchOrFocus('iTerm') end)
hs.hotkey.bind(hyper, 'M', function() hs.application.launchOrFocus('Sequel Pro') end)
hs.hotkey.bind(hyper, 'S', function() hs.application.launchOrFocus('Sublime Text') end)
hs.hotkey.bind(hyper, 'T', function() hs.application.launchOrFocus('iTunes') end)

-- auto reload config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/osx/hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
