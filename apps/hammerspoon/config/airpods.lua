local function airPods(deviceName)
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

return function (binding)
  local modifier, trigger, airPodsName = table.unpack(binding)
  hs.hotkey.bind(modifier, trigger, function()
    local ok, output = airPods(airPodsName)
    if ok then
      hs.notify.new({
        title='Hammerspoon',
        informativeText=output
      }):send()
    else
      hs.notify.new({
        title='Hammerspoon',
        informativeText='Could not connect to AirPods.'
      }):send()
    end
  end)
end
