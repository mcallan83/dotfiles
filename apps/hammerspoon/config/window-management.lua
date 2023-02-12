hs.window.animationDuration = .1

local frameCache = {}

local positions = {
  left25 = hs.layout.left25,
  left30 = hs.layout.left30,
  left40 = {x=0, y=0, w=0.4, h=1},
  left50 = hs.layout.left50,
  left60 = {x=0, y=0, w=0.6, h=1},
  left70 = hs.layout.left70,
  maximized = hs.layout.maximized,
  right25 = hs.layout.right25,
  right30 = hs.layout.right30,
  right40 = {x=0.6, y=0, w=0.4, h=1},
  right50 = hs.layout.right50,
  right60 = {x=0.4, y=0, w=0.6, h=1},
  right70 = hs.layout.right70,
}

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
  -- given the current focused window, ask for another window via chooser and
  -- apply to 70/30 or 50/50 split layout
  -- https://github.com/evantravers/Split.spoon
  applyLayout = function()
    local windows = hs.fnutils.map(hs.window.orderedWindows(), function(win)
      if win ~= hs.window.focusedWindow() then
        return {
          text = win:title(),
          subText = win:application():title(),
          image = hs.image.imageFromAppBundle(win:application():bundleID()),
          id = win:id()
        }
      end
    end)
    local chooser = hs.chooser.new(function(choice)
      if choice ~= nil then
        local focused = hs.window.focusedWindow()
        local toRead  = hs.window.find(choice.id)
        if hs.eventtap.checkKeyboardModifiers()['alt'] then
          hs.layout.apply({
            {nil, focused, focused:screen(), hs.layout.left50, 0, 0},
            {nil, toRead, focused:screen(), hs.layout.right50, 0, 0}
          })
        else
          hs.layout.apply({
            {nil, focused, focused:screen(), hs.layout.left70, 0, 0},
            {nil, toRead, focused:screen(), hs.layout.right30, 0, 0}
          })
        end
        toRead:raise()
        focused:focus()
      end
    end)
    chooser
      :placeholderText("Choose window for 70/30 split. Hold ⎇ for a 50/50 split.")
      :searchSubText(true)
      :choices(windows)
      :show()
  end,
  -- focus the next window down
  focusDown = function(win)
    win:focusWindowSouth()
  end,
  -- focus the next window left
  focusLeft = function(win)
    win:focusWindowWest()
  end,
  -- focus the previously focused window
  focusPrevious = function()
    local wf = hs.window.filter
    local previous = wf.defaultCurrentSpace:getWindows(wf.sortByFocusedLast)
    previous[2]:focus()
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
  -- move window to left monitor
  moveMonitorLeft = function(win)
    win:moveOneScreenWest()
    win:centerOnScreen()
  end,
  -- move window to right monitor
  moveMonitorRight = function(win)
    win:moveOneScreenEast()
    win:centerOnScreen()
  end,
  -- move window to the left and toggle with of 70/60/50/40/30%
  moveVariableLeft = function(win)
    togglePlacement(win, {
      positions.left70,
      positions.left60,
      positions.left50,
      positions.left40,
      positions.left30,
    })
  end,
  -- move window to the right and toggle with of 30/40/50/60/70%
  moveVariableRight = function(win)
    togglePlacement(win, {
      positions.right30,
      positions.right40,
      positions.right50,
      positions.right60,
      positions.right70,
    })
  end,
  -- show window hints
  showHints = function()
    hs.hints.windowHints()
  end,
  -- tile window to left or screen
  tileLeft = function (win)
    win:application():selectMenuItem('Tile Window to Left of Screen')
  end,
  -- tile window to right of screen
  tileRight = function (win)
    win:application():selectMenuItem('Tile Window to Right of Screen')
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
