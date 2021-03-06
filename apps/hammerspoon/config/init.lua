local hyper = {'shift', 'ctrl', 'alt', 'cmd'}
local hyperLite = {'ctrl', 'alt', 'cmd'}

local airpods = require('airpods')
local app = require('app')
local window = require('window')

hs.hotkey.bind(hyper, '`', function()
  hs.console.clearConsole()
  hs.openConsole(true)
  hs.reload()
end)

airpods({hyper, '\\', 'Mike’s Airpods Pro'})

app({
  {hyper, '3', 'Spark'},
  {hyper, 'd', 'Reeder'},
  {hyper, 'a', 'Safari'},
  {hyper, 'c', 'Google Chrome'},
  {hyper, 'e', 'Microsoft Outlook'},
  {hyper, 'f', 'Finder'},
  {hyper, 'i', 'iTerm'},
  {hyper, 'k', 'Slack'},
  {hyper, 'm', 'Sequel Ace'},
  {hyper, 'n', 'Notes'},
  {hyper, 'p', 'Spotify'},
  {hyper, 'r', 'Reminders'},
  {hyper, 's', 'Sublime Text'},
  {hyper, 'z', 'Messages'},
})

window({
  {hyper,     '[',      'moveScreenLeft'},
  {hyper,     ']',      'moveScreenRight'},
  {hyper,     'down',   'moveCenter'},
  {hyper,     'h',      'showHints'},
  {hyper,     'left',   'moveHalfLeft'},
  {hyper,     'return', 'toggleMaximize'},
  {hyper,     'right',  'moveHalfRight'},
  {hyper,     'up',     'toggleFullScreen'},
  {hyperLite, 'left',   'moveVariableLeft'},
  {hyperLite, 'right',  'moveVariableRight'},
})

hs.loadSpoon("SpoonInstall")

hs.notify.new({
  title='Hammerspoon',
  informativeText='Configuration Initialized'
}):send()
