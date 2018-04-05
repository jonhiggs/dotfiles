hs.window.animationDuration = 0

local application = require "hs.application"

-- Apptivate Replacement ---------------------------
hs.hotkey.bind({"cmd"}, "1", function()
  application.launchOrFocus("Alacritty")
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

hs.hotkey.bind({"cmd"}, "9", function()
  application.launchOrFocus("Calendar")
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

-- slim
hs.hotkey.bind({"cmd", "shift"}, "D", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 200
  f.y = 0
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- extra-slim
hs.hotkey.bind({"cmd", "shift"}, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 200
  f.y = 0
  f.w = max.w / 3
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
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- right
hs.hotkey.bind({"cmd", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
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


-- hs.hotkey.bind({"alt"}, "B", function()
--   local win = hs.window.focusedWindow()
--   local app = win:application()
-- 
--   if not string.find(app:title(), "^iTerm2$") then
--     print("sending alt")
--     hs.eventtap.keyStroke({'alt'}, 'left')
--   else
--     print("sending real")
--     hs.eventtap.keyStroke({'alt'}, 'B')
--   end
-- end)
-- 
-- hs.hotkey.bind({"alt"}, "F", function()
--   local win = hs.window.focusedWindow()
--   local app = win:application()
-- 
--   if not string.find(app:title(), "^iTerm2$") then
--     print("sending alt")
--     hs.eventtap.keyStroke({'alt'}, 'right')
--   else
--     print("sending real")
--     hs.eventtap.keyStroke({'alt'}, 'F')
--   end
-- end)

