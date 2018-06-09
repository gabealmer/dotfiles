local mash = {
  split   = {"ctrl", "alt", "cmd"},
  corner  = {"ctrl", "alt", "shift"},
  focus   = {"ctrl", "alt"}
}

-- Resize windows
local function adjust(x, y, w, h)
  return function()
    local win = hs.window.focusedWindow()
    if not win then return end

    local f = win:frame()
    local max = win:screen():frame()

    f.w = math.floor(max.w * w)
    f.h = math.floor(max.h * h)
    f.x = math.floor((max.w * x) + max.x)
    f.y = math.floor((max.h * y) + max.y)

    win:setFrame(f)
  end
end

-- top half
hs.hotkey.bind(mash.split, "K", adjust(0, 0, 1, 0.5))

-- -- right half
hs.hotkey.bind(mash.split, "L", adjust(0.5, 0, 0.5, 1))

-- -- bottom half
hs.hotkey.bind(mash.split, "J", adjust(0, 0.5, 1, 0.5))

-- -- left half
hs.hotkey.bind(mash.split, "H", adjust(0, 0, 0.5, 1))

-- -- top left
hs.hotkey.bind(mash.corner, "J", adjust(0, 0, 0.5, 0.5))

-- -- top right
hs.hotkey.bind(mash.corner, "K", adjust(0.5, 0, 0.5, 0.5))

-- -- bottom right
hs.hotkey.bind(mash.corner, "L", adjust(0.5, 0.5, 0.5, 0.5))

-- -- bottom left
hs.hotkey.bind(mash.corner, "H", adjust(0, 0.5, 0.5, 0.5))

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
  local win = hs.window.focusedWindow()
  win:maximize()
end)

-- hs.hotkey.bind({"cmd"}, "J", function()
--   local app = hs.application.frontmostApplication()
--   if app:name() == "Mail" then
--     hs.eventtap.keyStroke({}, "down")
--   end
-- end)

--hs.hotkey.bind({"cmd"}, "K", function()
--  local app = hs.application.frontmostApplication()
--  if app:name() == "Mail" then
--    hs.eventtap.keyStroke({}, "up")
--  end
--end)

local function appl(appName)
  return function()
    hs.application.launchOrFocus(appName)
  end
end

-- hs.hotkey.bind(mash.focus, "H", appl("HipChat"))
-- hs.hotkey.bind(mash.focus, "B", appl("Safari"))
-- hs.hotkey.bind(mash.focus, "M", appl("Mail"))
-- hs.hotkey.bind(mash.focus, "I", appl("iTerm"))

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()
--
--   f.x = max.x
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f)
-- end)
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()
--
--   f.x = max.x
--   f.y = max.y + (max.h / 2)
--   f.w = max.w
--   f.h = max.h / 2
--   win:setFrame(f)
-- end)
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()
--
--   f.x = max.x
--   f.y = max.y
--   f.w = max.w
--   f.h = max.h / 2
--   win:setFrame(f)
-- end)
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()
--
--   f.x = max.x + (max.w / 2)
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f)
-- end)
--
hs.hotkey.bind({"shift", "cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
end)

hs.hotkey.bind({"shift", "cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
end)
