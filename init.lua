local mash = {"alt", "ctrl", "cmd"}
local halfMash = {"ctrl", "cmd"}

-- CONFIG
--
-- config reload
hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- animation duration
hs.window.animationDuration = 0

-- grid config
hs.grid.GRIDHEIGHT = 4
hs.grid.GRIDWIDTH = 4
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

-- WINDOW MANIPULATION
--
-- manual window move screen / resize
hs.hotkey.bind({"ctrl"}, "D", function()
  hs.grid.show()
end)

-- fullscreen focused window
hs.hotkey.bind(halfMash, "F", function()
  local focusedWindow = hs.window.focusedWindow()
  focusedWindow:maximize()
end)

-- left half screen focused window
hs.hotkey.bind(halfMash, "L", function()
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

-- right half screen focused window
hs.hotkey.bind(halfMash, "R", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- top half screen focused window
hs.hotkey.bind(halfMash, "T", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = 0
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-- bottom half screen focused window
hs.hotkey.bind(halfMash, "B", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-- APP LAUNCHING
--
-- app hotkeys
local appNames = {
  ['B'] = 'Google Chrome', -- [B]rowswer
  ['L'] = 'Slack', -- s[L]ack
  ['D'] = 'Dash',
  ['I'] = 'iTerm',
  ['C'] = 'Sunrise Calendar', -- [C]alendar
  ['M'] = 'Messages',
  ['S'] = 'Spotify',
  ['E'] = 'Emacs',
  ['O'] = 'OmniFocus',
  ['V'] = 'Vitamin-R 2'
}

local appMash = {"cmd", "shift"}

for hotKey, appName in pairs(appNames) do
  hs.hotkey.bind(appMash, hotKey, function()
    hs.application.launchOrFocus(appName)
  end)
end

--[[ Training Function
--prints the name and shortcut for the app just opened
--
local appKeys = {
  ['Google Chrome'] = 'B',
  ['Slack'] = 'L',
  ['Dash'] = 'D',
  ['iTerm'] = 'I',
  ['Sunrise Calendar'] = 'C',
  ['Messages'] = 'M',
  ['Spotify'] = 'S',
  ['Emacs'] = 'E'
}

function appLaunched(event)
  return event == hs.application.watcher.launched
end

function appActivated(event)
  return event == hs.application.watcher.activated
end

function appEvent(appName, event)
  if appLaunched(event) or appActivated(event) then
    local text = appKeys[appName]
    if text then
      hs.alert.show(appName .. ": SHFT + CMD + " .. text)
    end
  end
end

hs.application.watcher.new(appEvent):start()
]]--

