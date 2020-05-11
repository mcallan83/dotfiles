hs.hotkey.bind({'ctrl'}, '`', nil, function()
  hs.reload()
end)

require('windows')
require('hyper')

hs.notify.new({title='Hammerspoon', informativeText='Config Loaded'}):send()
