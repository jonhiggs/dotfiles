function bluetooth(power)
  print("Setting bluetooth to " .. power)
  hs.execute("/usr/local/bin/blueutil --power " .. power)
end

hs.window.animationDuration = 0

local application = require "hs.application"
require "hs.screen"

-- Apptivate Replacement ---------------------------
hs.hotkey.bind({"cmd"}, "1", function()
  local mode = hs.screen.mainScreen():currentMode()
  if string.find(mode['scale'], "^2.0") then
    local bad_term = hs.application.get("com.googlecode.iterm2")
    local good_term = "Alacritty"

    if bad_term ~= nil then
      bad_term:kill()
    end

    application.launchOrFocus(good_term)
  else
    local bad_term = hs.application.get("io.alacritty")
    local good_term = "iTerm"

    if bad_term ~= nil then
      bad_term:kill()
    end

    application.launchOrFocus(good_term)
  end
end)

hs.hotkey.bind({"cmd"}, "2", function()
  application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({"cmd"}, "3", function()
  application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"cmd"}, "4", function()
  application.launchOrFocus("Mail")
end)

hs.hotkey.bind({"cmd"}, "5", function()
  application.launchOrFocus("Calendar")
end)

hs.hotkey.bind({"cmd"}, "6", function()
  application.launchOrFocus("Scapple")
end)

hs.hotkey.bind({"cmd"}, "7", function()
  application.launchOrFocus("Messages")
end)
----------------------------------------------------


-- Moom Replacement --------------------------------
-- fullscreen
hs.hotkey.bind({"cmd", "shift"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- slim 2/3
hs.hotkey.bind({"cmd", "shift"}, "D", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 8           -- 1/8
  f.y = 0
  f.w = ( max.w / 4 ) * 3   -- 3/4
  f.h = max.h

  local app = win:application()
  if string.find(app:title(), "^iTerm") then
    f.x = (f.x - 8)
    f.w = (f.w + (8 * 2))
  end

  win:setFrame(f)
end)

-- extra-slim 1/3
hs.hotkey.bind({"cmd", "shift"}, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 3           -- 1/3
  f.y = 0
  f.w = max.w / 3           -- 1/3
  f.h = max.h
  win:setFrame(f)
end)

--left
hs.hotkey.bind({"cmd", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = 1750
  f.h = max.h

  win:setFrame(f)
end)

-- right
hs.hotkey.bind({"cmd", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 1750
  f.y = max.y
  f.w = max.w - 1750
  f.h = max.h
  win:setFrame(f)
end)

-- top
hs.hotkey.bind({"cmd", "shift"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

-- bottom
hs.hotkey.bind({"cmd", "shift"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.h / 2
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)


-- Select keyboard in karabiner when it's connected/disconnected.
hs.usb.watcher.new(function(dataTable)
  print(dataTable['eventType'] .. " " .. dataTable['productName'])
  if dataTable['productName'] == 'ML67' then
     if dataTable['eventType'] == 'added' then
       bluetooth("on")
       hs.execute [["/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli" "--select-profile" "ML67"]]
     elseif dataTable['eventType'] == 'removed' then
       hs.execute [["/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli" "--select-profile" "Default profile"]]
       bluetooth("off")
     end
  end

end):start()
