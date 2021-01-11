hs.window.animationDuration = 0

local frameCache = {}

local actions = {
  -- focus the next window down
  focusDown = function(win)
    win:focusWindowSouth()
  end,
  -- focus the next window left
  focusLeft = function(win)
    win:focusWindowWest()
  end,
  -- focus the next window right
  focusRight = function(win)
    win:focusWindowEast()
  end,
  -- focus the next window up
  focusUp = function(win)
    win:focusWindowNorth()
  end,
  -- move window to center of screen
  moveCenter = function(win)
    win:setFullScreen(false)
    win:centerOnScreen()
  end,
  -- move window to the left 50%
  moveHalfLeft = function(win)
    win:setFullScreen(false)
    win:move(hs.layout.left50)
  end,
  -- move window to the right 50%
  moveHalfRight = function(win)
    win:setFullScreen(false)
    win:move(hs.layout.right50)
  end,
  -- move window one screen to the left
  moveScreenLeft = function(win)
    win:moveOneScreenWest()
  end,
  -- move window one screen to the right
  moveScreenRight = function(win)
    win:moveOneScreenEast()
  end,
  -- show window hints
  showHints = function()
    hs.hints.windowHints()
  end,
  -- move window to the left and toggle with of 70/60/40/30%
  moveVariableLeft = function(win)
    win:setFullScreen(false)
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    local width = max.w * 0.7

    if (f.x == max.x) then
      if (f.w == max.w * 0.7) then
        width = max.w * 0.6
      elseif (f.w == max.w * 0.6) then
        width = max.w * 0.4
      elseif (f.w == max.w * 0.4) then
        width = max.w * 0.3
      end
    end

    f.x = max.x
    f.y = max.y
    f.w = width
    f.h = max.h

    win:setFrame(f)
  end,
  -- move window to the right and toggle with of 30/40/60/70%
  moveVariableRight = function(win)
    win:setFullScreen(false)
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    local width = max.w * 0.3
    local offset = max.w * 0.7

    if (f.w == max.w * 0.3) then
      width = max.w * 0.4
      offset = max.w * 0.6
    elseif (f.w == max.w * 0.4) then
      width = max.w * 0.6
      offset = max.w * 0.4
    elseif (f.w == max.w * 0.6) then
      width = max.w * 0.7
      offset = max.w * 0.3
    end

    f.x = offset + max.x
    f.y = max.y
    f.w = width
    f.h = max.h
    win:setFrame(f)
  end,
  -- toggle full screen on/off
  toggleFullScreen = function(win)
    win:setFullScreen(not win:isFullScreen())
  end,
  -- toggle maximize on/off
  toggleMaximize = function(win)
    win:setFullScreen(false)
    if frameCache[win:id()] then
       win:setFrame(frameCache[win:id()])
       frameCache[win:id()] = nil
    else
      frameCache[win:id()] = win:frame()
      win:maximize()
    end
  end
}

return function (bindings)
  for i, binding in ipairs(bindings) do
    local modifier, trigger, action = table.unpack(binding)
    hs.hotkey.bind(modifier, trigger, nil, function()
      actions[action](hs.window.focusedWindow())
    end)
  end
end
