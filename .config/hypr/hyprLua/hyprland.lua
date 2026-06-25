require("monitors")
local vars = require("variables")
require("lookAndFeel")
require("keyBindings")
require("windowRules")

---------------
--- AUTOSTART--
---------------
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar & hyprpaper & swaync")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------
--https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- General
hl.env("XCURSOR_SIZE", "20")
h1.env("HYPRCURSOR_SIZE", "20")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

[[Clutter package already has Wayland enabled,
this variable will force Clutter applications to
try and use the Wayland backend ]]
--hl.env("CLUTTER_BACKEND", "wayland")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

---------
--INPUT--
---------
hl.config({
    input
})
