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
  {hyper, 'i', 'iTerm'},
  {hyper, 'l', 'Slack'},
  {hyper, 'm', 'Sequel Ace'},
  {hyper, 'p', 'Spotify'},
  {hyper, 's', 'Sublime Text'},
  {hyper, 'v', 'Visual Studio Code'},
})

keyRemap({
  {'Slack', {'cmd', 'p'}, {'cmd', 'k'}},
})

macos({
  {hyper, '\\', 'clearNotifications'},
})

windowManagement({
  {hyper,     ';',      'focusPrevious'},
  {hyper,     '[',      'moveMonitorLeft'},
  {hyper,     ']',      'moveMonitorRight'},
  {hyper,     'left',   'moveVariableLeft'},
  {hyper,     'return', 'toggleMaximize'},
  {hyper,     'right',  'moveVariableRight'},
  {hyper,     'up',     'toggleFullScreen'},
  {hyperLite, 'left',   'moveHalfLeft'},
  {hyperLite, 'right',  'moveHalfRight'},
})
