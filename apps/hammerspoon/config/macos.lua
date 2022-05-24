local actions = {
  -- clear all macos notifications
  clearAllNotifications = function()
    hs.applescript([[
      tell application "System Events"
          tell process "Notification Center"
              set theWindows to every window
              repeat with i from 1 to number of items in theWindows
                  set this_item to item i of theWindows
                  try
                      click button 1 of this_item
                  end try
              end repeat
          end tell
      end tell
    ]])
  end
}

return function (bindings)
  for i, binding in ipairs(bindings) do
    local modifier, trigger, action = table.unpack(binding)
    hs.hotkey.bind(modifier, trigger, nil, function()
      actions[action]()
    end)
  end
end
