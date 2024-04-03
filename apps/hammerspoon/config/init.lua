local hyper = {'shift', 'ctrl', 'alt', 'cmd'}
local hyperLite = {'ctrl', 'alt', 'cmd'}

hs.loadSpoon("SpoonInstall")

local appToggle = require('app-toggle')
local keyRemap = require('key-remap')
local macos = require('macos')
local windowManagement = require('window-management')

hs.hotkey.bind(hyper, '`', function()
  hs.console.clearConsole()
  hs.openConsole(true)
  hs.reload()
end)

appToggle({
  {hyper, 'a', 'Safari'},
  {hyper, 'c', 'Google Chrome'},
  {hyper, 'e', 'Microsoft Outlook'},
  {hyper, 'f', 'Finder'},
  {hyper, 'g', 'Gitify'},
  {hyper, 'i', 'iTerm'},
  {hyper, 'm', 'Messages'},
  {hyper, 'n', 'Notes'},
  {hyper, 'p', 'Spotify'},
  {hyper, 'r', 'Reminders'},
  {hyper, 'q', 'Sequel Ace'},
  {hyper, 's', 'Sublime Text'},
  {hyper, 'v', 'Visual Studio Code'},
  {hyper, 'z', 'zoom.us'},
})

keyRemap({
  -- {'Google Chrome', {{'cmd', 'shift'}, 'p'}, {{'cmd', 'shift'}, 'a'}}, -- search open tabs
})

macos({
  {hyper, '\\', 'clearNotifications'},
  {hyperLite, 'up', 'openChromeUrlInSafari'},
})

windowManagement({
  {hyper,     '[',      'moveMonitorLeft'},
  {hyper,     ']',      'moveMonitorRight'},
  {hyper,     'left',   'moveVariableLeft'},
  {hyper,     'return', 'toggleMaximize'},
  {hyper,     'right',  'moveVariableRight'},
  {hyper,     'space',  'focusPrevious'},
  {hyper,     'up',     'toggleFullScreen'},
  {hyper,     'x',      'applyLayout'},
  {hyperLite, 'left',   'moveHalfLeft'},
  {hyperLite, 'right',  'moveHalfRight'},
})
