local actions = {
  -- clear all macos notifications
  clearNotifications = function()
    hs.applescript([[
      tell application "System Events"
        try
          set _groups to groups of UI element 1 of scroll area 1 of group 1 of window "Notification Center" of application process "NotificationCenter"
          repeat with _group in _groups
            set _actions to actions of _group
            repeat with _action in _actions
              if description of _action is in {"Close", "Clear All"} then
                perform _action
              end if
            end repeat
          end repeat
        end try
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
