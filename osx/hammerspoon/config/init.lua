hs.hotkey.bind({'ctrl'}, '`', nil, function()
  hs.reload()
end)

require('windows')
require('applications')

hs.notify.new({title='Hammerspoon', informativeText='Config Loaded'}):send()
