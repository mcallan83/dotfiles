hyper = {'shift', 'ctrl', 'alt', 'cmd'}
hyperLite = {'ctrl', 'alt', 'cmd'}

appBindings = {
  {hyper, 'a', 'Safari'},
  {hyper, 'c', 'Google Chrome'},
  {hyper, 'e', 'Microsoft Outlook'},
  {hyper, 'f', 'Finder'},
  {hyper, 'i', 'iTerm'},
  {hyper, 'k', 'Slack'},
  {hyper, 'm', 'Sequel Pro'},
  {hyper, 'p', 'Spotify'},
  {hyper, 'r', 'Reminders'},
  {hyper, 's', 'Sublime Text'},
  {hyper, 'z', 'Messages'},
}

windowBindings = {
  {hyper, 'down',   'center'},
  {hyper, 'h',      'focusLeft'},
  {hyper, 'l',      'focusRight'},
  {hyper, 'left',   'leftHalf'},
  {hyper, 'return', 'toggleMaximize'},
  {hyper, 'right',  'rightHalf'},
  {hyper, 'up',     'toggleFullScreen'},
}

airPodsName = 'Mike’s Airpods Pro'

-- window hints
hs.hotkey.bind(hyper, "space", hs.hints.windowHints)

-- focus\hide active app
for i, binding in ipairs(appBindings) do
  local modifier, trigger, appName = table.unpack(binding)
  hs.hotkey.bind(modifier, trigger, function()
    local app

    if appName == 'iTerm' then
      app = hs.application.get('iTerm2')
    else
      app = hs.application.get(appName)
    end

    if not app then
      hs.application.launchOrFocus(appName)
      return
    end

    if appName == 'iTerm' and not app:mainWindow() then
      app:selectMenuItem('New Window')
      return
    end

    if (app:isFrontmost()) then
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

windowActions.center = function (win)
  win:setFullScreen(false)
  win:centerOnScreen()
end

windowActions.focusDown = function (win)
  win:focusWindowSouth()
end

windowActions.focusLeft = function (win)
  win:focusWindowWest()
end

windowActions.focusRight = function (win)
  win:focusWindowEast()
end

windowActions.focusUp = function (win)
  win:focusWindowNorth()
end

windowActions.leftHalf = function (win)
  win:setFullScreen(false)
  win:move(hs.layout.left50)
end

windowActions.rightHalf = function (win)
  win:setFullScreen(false)
  win:move(hs.layout.right50)
end

windowActions.toggleFullScreen = function (win)
  win:setFullScreen(not win:isFullScreen())
end

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

for i, binding in ipairs(windowBindings) do
  local modifier, trigger, winFunction = table.unpack(binding)
  hs.hotkey.bind(modifier, trigger, nil, function()
    windowActions[winFunction](hs.window.focusedWindow())
  end)
end

hs.notify.new({title='Hammerspoon', informativeText='Config Loaded'}):send()

-- connect\disconnect airpods
function airPods(deviceName)
  local s = [[
    activate application "SystemUIServer"
    tell application "System Events"
      tell process "SystemUIServer"
        set btMenu to (menu bar item 1 of menu bar 1 whose description contains "bluetooth")
        tell btMenu
          click
  ]] .. 'tell (menu item "' .. deviceName .. '" of menu 1)\n'.. [[
            click
            if exists menu item "Connect" of menu 1 then
              click menu item "Connect" of menu 1
              return "Connecting AirPods..."
            else
              click menu item "Disconnect" of menu 1
              return "Disconecting AirPods..."
            end if
          end tell
        end tell
      end tell
    end tell
  ]]
  return hs.osascript.applescript(s)
end

hs.hotkey.bind(hyper, "\\", function()
  local ok, output = airPods(airPodsName)
  if ok then
    hs.alert.show(output)
  else
    hs.alert.show("Could not connect to AirPods.")
  end
end)
