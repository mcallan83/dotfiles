--------------------------------------------------------------------------------
-- Filename: osx/hammerspoon/config/init.lua
-- Author: Mike Callan
-- URL: http://github.com/mcallan83/dotfiles
--------------------------------------------------------------------------------

-- keyboard modifiers
local hyper = {"cmd", "ctrl", "alt", "shift"}

-- disable window animations
hs.window.animationDuration = 0

-- resize windows left, right, and full
hs.hotkey.bind(hyper, '[', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
hs.hotkey.bind(hyper, ']', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)
hs.hotkey.bind(hyper, '=', hs.grid.maximizeWindow)

-- move window to next monitor
hs.hotkey.bind(hyper, "0", function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
end)

-- move window to previous monitor
hs.hotkey.bind(hyper, "9", function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
end)

-- toggle apps
hs.hotkey.bind(hyper, 'A', function() toggle_application('Adium') end)
hs.hotkey.bind(hyper, 'C', function() toggle_application('Google Chrome') end)
hs.hotkey.bind(hyper, 'F', function() toggle_application('Finder') end)
hs.hotkey.bind(hyper, 'H', function() toggle_application('Helium') end)
hs.hotkey.bind(hyper, 'I', function() toggle_application('iTerm') end)
hs.hotkey.bind(hyper, 'M', function() toggle_application('Sequel Pro') end)
hs.hotkey.bind(hyper, 'S', function() toggle_application('Sublime Text') end)
hs.hotkey.bind(hyper, 'T', function() toggle_application('iTunes') end)

-- toggle an application between being the frontmost app and being hidden
function toggle_application(_app)
    local app = hs.appfinder.appFromName(_app)
    if not app then
        hs.application.launchOrFocus(_app)
        return
    end
    local mainwin
    if _app == "Helium" then
        mainwin = app:focusedWindow()
    else
        mainwin = app:mainWindow()
    end
    if mainwin then
        if mainwin == hs.window.focusedWindow() then
            mainwin:application():hide()
        else
            mainwin:application():activate(true)
            mainwin:application():unhide()
            mainwin:focus()
        end
    end
end

-- load Cannon CaptureOnTouch software when scanner is pluggin in or opened
local usbWatcher = nil
function usbDeviceCallback(data)
    if (string.find(data["productName"],"P-215")) then
        if (data["eventType"] == "added") then
            hs.application.launchOrFocus("CaptureOnTouch P-215")
        elseif (data["eventType"] == "removed") then
            app = hs.appfinder.appFromName("CaptureOnTouch P-215")
            if(app) then
                app:kill()
            end
        end
    end
end
usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()

-- auto reload config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/osx/hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
