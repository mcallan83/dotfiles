hyper = {'shift', 'ctrl', 'alt', 'cmd'}
hyperLite = {'ctrl', 'alt', 'cmd'}

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
  {hyper, 'a', 'Safari'},
  {hyper, 'c', 'Google Chrome'},
  {hyper, 'e', 'Microsoft Outlook'},
  {hyper, 'f', 'Finder'},
  {hyper, 'i', 'iTerm'},
  {hyper, 'k', 'Slack'},
  {hyper, 'm', 'Sequel Pro'},
  {hyper, 'n', 'Notes'},
  {hyper, 'p', 'Spotify'},
  {hyper, 'r', 'Reminders'},
  {hyper, 's', 'Sublime Text'},
  {hyper, 'z', 'Messages'},
})

window({
  {hyper, '[',      'focusLeft'},
  {hyper, ']',      'focusRight'},
  {hyper, 'down',   'center'},
  {hyper, 'h',      'showHints'},
  {hyper, 'left',   'leftHalf'},
  {hyper, 'return', 'toggleMaximize'},
  {hyper, 'right',  'rightHalf'},
  {hyper, 'up',     'toggleFullScreen'},
})

hs.notify.new({
  title='Hammerspoon',
  informativeText='Configuration Initialized'
}):send()
