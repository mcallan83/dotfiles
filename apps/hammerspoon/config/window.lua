hs.window.animationDuration = .03

local frameCache = {}
local positions = require('positions')

-- cycle window placement through provided positions
local togglePlacement = function (win, positions)
  win:setFullScreen(false)
  local index = 0
  hs.fnutils.find(positions, function(position)
    index = index + 1
    local geo = hs.geometry.new(position)
      :fromUnitRect(hs.screen.mainScreen():frame())
      :floor()
    return win:frame():equals(geo)
  end)
  if index == #positions then index = 0 end
  win:moveToUnit(positions[index + 1])
end

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
    win:move(positions.left50)
  end,
  -- move window to the right 50%
  moveHalfRight = function(win)
    win:setFullScreen(false)
    win:move(positions.right50)
  end,
  -- move window one screen to the left
  moveScreenLeft = function(win)
    win:moveOneScreenWest()
    win:centerOnScreen()
  end,
  -- move window one screen to the right
  moveScreenRight = function(win)
    win:moveOneScreenEast()
    win:centerOnScreen()
  end,
  -- show window hints
  showHints = function()
    hs.hints.windowHints()
  end,
  -- move window to the left and toggle with of 70/60/40/30%
  moveVariableLeft = function(win)
    togglePlacement(win, {
      positions.left70,
      positions.left60,
      positions.left40,
      positions.left30,
    })
  end,
  -- move window to the right and toggle with of 30/40/60/70%
  moveVariableRight = function(win)
    togglePlacement(win, {
      positions.right30,
      positions.right40,
      positions.right60,
      positions.right70,
    })
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
      win:move(positions.maximized)
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
