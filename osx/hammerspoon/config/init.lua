hyper = {'shift', 'ctrl', 'alt', 'cmd'}
hyperLite = {'ctrl', 'alt', 'cmd'}

require('airpods')(
  {hyper, '\\', 'Mike’s Airpods Pro'}
)

require('app')({
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

require('window')({
  {hyper, '[',      'focusLeft'},
  {hyper, ']',      'focusRight'},
  {hyper, 'down',   'center'},
  {hyper, 'h',      'showHints'},
  {hyper, 'left',   'leftHalf'},
  {hyper, 'return', 'toggleMaximize'},
  {hyper, 'right',  'rightHalf'},
  {hyper, 'up',     'toggleFullScreen'},
})

-- reload config
hs.hotkey.bind(hyper, '`', nil, function()
  hs.reload()
end)

hs.notify.new({title='Hammerspoon', informativeText='Initialized'}):send()
