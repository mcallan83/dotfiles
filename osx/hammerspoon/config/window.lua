hs.window.animationDuration = 0

local frameCache = {}
local actions = {}

function actions.center (win)
  win:setFullScreen(false)
  win:centerOnScreen()
end

function actions.focusDown (win)
  win:focusWindowSouth()
end

function actions.focusLeft (win)
  win:focusWindowWest()
end

function actions.focusRight (win)
  win:focusWindowEast()
end

function actions.focusUp (win)
  win:focusWindowNorth()
end

function actions.showHints ()
  hs.hints.windowHints()
end

function actions.leftHalf (win)
  win:setFullScreen(false)
  win:move(hs.layout.left50)
end

function actions.rightHalf (win)
  win:setFullScreen(false)
  win:move(hs.layout.right50)
end

function actions.toggleFullScreen (win)
  win:setFullScreen(not win:isFullScreen())
end

function actions.toggleMaximize (win)
  win:setFullScreen(false)
  if frameCache[win:id()] then
     win:setFrame(frameCache[win:id()])
     frameCache[win:id()] = nil
  else
    frameCache[win:id()] = win:frame()
    win:maximize()
  end
end

return function (bindings)
  for i, binding in ipairs(bindings) do
    local modifier, trigger, action = table.unpack(binding)
    hs.hotkey.bind(modifier, trigger, nil, function()
      actions[action](hs.window.focusedWindow())
    end)
  end
end
