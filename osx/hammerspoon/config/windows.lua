local windowMappings = {
  modifiers = {'shift', 'ctrl', 'alt', 'cmd'},
  trigger   = 'w',
  mappings  = {
    { {},         'return', 'maximize' },
    { {},         'h',      'left' },
    { {},         'l',      'right' },
    { {},         'f',      'toggleFullScreen' },
    { {},         'n',      'nextScreen' },
    { {},         'right',  'moveOneScreenEast' },
    { {},         'left',   'moveOneScreenWest' },
  }
}

hs.window.animationDuration = 0

function hs.window.left(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function hs.window.right(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function hs.window.toggleFullScreen(win)
    win:setFullScreen(not win:isFullScreen())
end

function hs.window.nextScreen(win)
  local currentScreen = win:screen()
  local allScreens = hs.screen.allScreens()
  currentScreenIndex = hs.fnutils.indexOf(allScreens, currentScreen)
  nextScreenIndex = currentScreenIndex + 1

  if allScreens[nextScreenIndex] then
    win:moveToScreen(allScreens[nextScreenIndex])
  else
    win:moveToScreen(allScreens[1])
  end
end

windowLayoutMode = hs.hotkey.modal.new({}, 'F16')

windowLayoutMode.entered = function()
  windowLayoutMode.statusMessage:show()
end
windowLayoutMode.exited = function()
  windowLayoutMode.statusMessage:hide()
end

-- Bind the given key to call the given function and exit WindowLayout mode
function windowLayoutMode.bindWithAutomaticExit(mode, modifiers, key, fn)
  mode:bind(modifiers, key, function()
    mode:exit()
    fn()
  end)
end

for i, mapping in ipairs(windowMappings.mappings) do
  local modifiers, trigger, winFunction = table.unpack(mapping)

  windowLayoutMode:bindWithAutomaticExit(modifiers, trigger, function()
    local fw = hs.window.focusedWindow()
    fw[winFunction](fw)
  end)
end

local message = require('status-message')
windowLayoutMode.statusMessage = message.new('Window Layout Mode')

hs.hotkey.bind(windowMappings.modifiers, windowMappings.trigger, function()
  windowLayoutMode:enter()
end)
windowLayoutMode:bind(windowMappings.modifiers, windowMappings.trigger, function()
  windowLayoutMode:exit()
end)
