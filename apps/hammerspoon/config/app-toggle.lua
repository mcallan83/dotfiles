local appNameMap = {
  ['iTerm'] = 'iTerm2',
  ['Visual Studio Code'] = 'Code',
}

local function toggleApp(appName)
  local realAppName = appNameMap[appName] or appName
  local app = hs.application.get(realAppName)

  if not app then
    hs.application.launchOrFocus(appName)
    return
  end

  if appName == 'iTerm' and not app:mainWindow() then
    app:selectMenuItem('New Window')
    return
  end

  if app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus(appName)
  end
end

return function (bindings)
  for _, binding in ipairs(bindings) do
    local modifier, trigger, appName = table.unpack(binding)
    hs.hotkey.bind(modifier, trigger, function()
      toggleApp(appName)
    end)
  end
end
