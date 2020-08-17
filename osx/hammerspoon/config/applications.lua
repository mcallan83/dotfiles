local bindings = {
  { 'c', 'Google Chrome' },
  { 'f', 'Finder' },
  { 'm', 'Sequel Pro' },
  { 's', 'Slack' },
  { 's', 'Sublime Text' },
  { 'i', 'iTerm2' },
}

for i, binding in ipairs(bindings) do
  hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, binding[1], function()
    local appName = binding[2]
    local app = hs.application.get(appName)
    if app then
      if app:isFrontmost() then
        app:hide()
      else
        app:activate()
      end
    else
      hs.application.launchOrFocus(appName)
    end
  end)
end
