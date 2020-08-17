local hyper = {'shift', 'ctrl', 'alt', 'cmd'}

local bindings = {
  { 'c', 'Google Chrome' },
  { 'f', 'Finder' },
  { 'i', 'iTerm2' },
  { 'l', 'Slack' },
  { 'm', 'Sequel Pro' },
  { 'p', 'Spotify' },
  { 's', 'Sublime Text' },
}

for i, binding in ipairs(bindings) do
  hs.hotkey.bind(hyper, binding[1], function()
    local app = hs.application.get(binding[2])
    if app then
      if app:isFrontmost() then
        app:hide()
      else
        app:activate()
      end
    else
      hs.application.launchOrFocus(binding[2])
    end
  end)
end
