-- {{{ Libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type


-- widgets
local wibox = require("wibox")
-- awful
local awful = require("awful")
-- notifications
local naughty = require("naughty")
-- theme
local beautiful = require("beautiful")

-- globals
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
--- }}}

awful.spawn.with_shell("kitty")



-- {{{ Error handling
-- Startup errors
if awesome.startup_errors then
    naughty.notify(
    {
        preset = naughty.config.presets.critical,
        title = "Error occured while parsing config file",
        text = awesome.startup_errors
    })
end

-- Runtime errors
do
    local _error = false
    awesome.connect_signal("debug::error", function (e)
        if _error then return end
        _error = true

        naughty.notify(
        {
            present = naughty.config.presets.critical,
            title = "Segmentation fault\n Aborted (core dumped)",
            text = tostring(e)
        })
        _error = false
    end)
end
-- }}}



-- {{{ Helper functions
-- string split
-- function split(s, delimiter)
--     result = {};
--     for match in (s..delimiter):gmatch("(.-)"..delimiter) do
--         table.insert(result, match);
--     end
--     return result;
-- end
--
--
--
-- -- run program if it isnt already running 
-- -- IMPORTANT: need to still test this
-- local function run_once(cmd)
--
--     program = split("cmd")[0]
--
--     naughty.notify(
--     {
--         present = naughty.config.presets.critical,
--         title = "Segmentation fault\n Aborted (core dumped)",
--         text = tostring(e)
--     })
--
--     awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", program, cmd))
--
-- end
-- run_once("unclutter -root")
-- }}}




-- {{{ Themes
local themes = {
    "dark",
    "light" -- need to actually make this one
}
local chosen_theme = themes[1]
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
beautiful.init(theme_path)
-- }}}



-- {{{ Variables

-- keys
local super  = "Mod4"
local altkey = "Mod1"
local ctrl   = "Control"


-- apps
local browser1          = "firefox"
local browser2          = "chromium -no-default-browser-check"
local exditor           = "neovim"
local editorgui         = "subl3"
local filemanager       = "nemo"
local mailclient        = "thunderbird"
local mediaplayer       = "spotify"
local terminal          = "kitty"
local virtualmachine    = "virtualbox"


-- Awesome variables
awful.util.terminal = terminal

-- Temporary:
awful.util.tagnames = {  "BROWSER", "0x2", "0x3", "0x4", "0x5", "0x6", "0x7", "0x8", "0x9", "0xA" }

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.floating,
    awful.layout.suit.fair
}


-- }}}










-- {{{ Running different things on different monitors
-- IMPORTANT use thise
local function add_tags(s, tags) -- tags is an array
end

local function add_wibar(s, position)
    -- Create a wibox for each screen and add it
    -- IMPORTANT figure out how this code works
    awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s)
        s.systray = wibox.widget.systray()
        s.systray.visible = true
     end)
end

local function screen_right(s)
end


awful.screen.connect_for_each_screen(function(s) -- for non git version
--screen.connect_signal("request::desktop_decoration", function(s) -- git version

-- IMPORTANT need to get back to this
    if s.index == 1 then
        -- add_tags(s, {"1", "2", "3"})
        -- add_wibar(s, "bottom")
        awful.tag.add("screen 1 tag 1", {
            layout = awful.layout.suit.tile.top,
            screen = s,
            selected = true
        })
        awful.tag.add("screen 1 tag 2", {
            layout = awful.layout.suit.tile.top,
            screen = s
        })
    end

    if s.index == 2 then
            awful.tag.add("screen 2 tag 1", {
                layout = awful.layout.suit.tile.top,
                screen = s,
                selected = true
            })
            awful.tag.add("screen 2 tag 2", {
                layout = awful.layout.suit.tile.top,
                screen = s
            })
    end
end)

-- IMPORTANT: check this out
-- I think I need to rerun this after
-- changing stuff like tagnames
beautiful.init(theme_path)
-- }}}






-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    awful.spawn.with_shell("nitrogen --restore")
end)
-- }}}
awful.spawn.with_shell("~/.config/awesome/autostart.sh")
awful.spawn.with_shell("kitty")
