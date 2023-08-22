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
  end,
  openChromeUrlInSafari = function()
    hs.applescript([[
      if application "Google Chrome" is running then
        tell application "Google Chrome"
          try
            set currentChromeURL to URL of active tab of front window
            set pageName to title of active tab of front window
          end try
        end tell
        tell application "Safari"
          activate
          if (count of windows) is 0 then make new window
          set currentSafariURL to URL of current tab of front window
          if currentSafariURL is not currentChromeURL then
            if currentSafariURL is not "favorites://" then
              tell window 1
                set current tab to (make new tab with properties {URL:currentChromeURL})
              end tell
            end if
            set URL of current tab of front window to currentChromeURL
          end if
        end tell
      end if
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
