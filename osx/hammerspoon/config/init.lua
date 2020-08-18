hyper = {'shift', 'ctrl', 'alt', 'cmd'}
hyperLite = {'ctrl', 'alt', 'cmd'}

appBindings = {
  {hyper, 'a', 'Safari'},
  {hyper, 'c', 'Google Chrome'},
  {hyper, 'f', 'Finder'},
  {hyper, 'i', 'iTerm'},
  {hyper, 'l', 'Slack'},
  {hyper, 'm', 'Sequel Pro'},
  {hyper, 'p', 'Spotify'},
  {hyper, 's', 'Sublime Text'},
}

windowBindings = {
  {hyper, 'left',   'leftHalf'},
  {hyper, 'return', 'toggleMaximize'},
  {hyper, 'right',  'rightHalf'},
  {hyper, 'up',     'toggleFullScreen'},
}

-- window hints
hs.hotkey.bind(hyper, "h", hs.hints.windowHints)

-- focus\hide active app
for i, binding in ipairs(appBindings) do
  local modifier, trigger, appName = table.unpack(binding)
  hs.hotkey.bind(modifier, trigger, function()
    local app = hs.application.get(appName)
    if (app and app:isFrontmost()) then
      app:hide()
    else
      hs.application.launchOrFocus(appName)
    end
  end)
end

-- reload config
hs.hotkey.bind(hyper, '`', nil, function()
  hs.reload()
end)

-- window actions
hs.window.animationDuration = 0

local windowFrameCache = {}
local windowActions = {}

windowActions.toggleMaximize = function (win)
  win:setFullScreen(false)
  if windowFrameCache[win:id()] then
     win:setFrame(windowFrameCache[win:id()])
     windowFrameCache[win:id()] = nil
  else
    windowFrameCache[win:id()] = win:frame()
    win:maximize()
  end
end

windowActions.toggleFullScreen = function (win)
  win:setFullScreen(not win:isFullScreen())
end

windowActions.leftHalf = function (win)
  win:setFullScreen(false)
  win:move(hs.layout.left50)
end

windowActions.rightHalf = function (win)
  win:setFullScreen(false)
  win:move(hs.layout.right50)
end

for i, mapping in ipairs(windowBindings) do
  local modifier, trigger, winFunction = table.unpack(mapping)
  hs.hotkey.bind(modifier, trigger, nil, function()
    windowActions[winFunction](hs.window.focusedWindow())
  end)
end

hs.notify.new({title='Hammerspoon', informativeText='Config Loaded'}):send()
