return function (bindings)
  for i, binding in ipairs(bindings) do
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
end
