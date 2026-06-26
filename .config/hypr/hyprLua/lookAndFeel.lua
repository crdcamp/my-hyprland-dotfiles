---------------------
--- LOOK AND FEEL ---
---------------------
require("colors")

-- Blur Layer Rules
hl.layer_rule({
    name = "waybar-blur",
    match = { namespace = waybar },
    blur = true,
    ignore_alpha = 0,
})
hl.layer_rule({
    name = "rofi-blur",
    match = { namespace = rofi },
    blur = true,
    ignore_alpha = 0,
})

-- Windows and Borders
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 3,
        border_size = 2,
        col = {
            active_border = { colors.inverse_primary },
            inactive_border = { colors.inverse_on_surface },
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    -- Window Settings
    decoration {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 0.92,
        inactive_opacity = 0.87,
        shadow = { enabled = false },
        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            xray = false,
            vibrancy = 0.1696,
        },
    },
    animations {
        enabled = true,
    }
})

-- Curves and Animations
-- Bezier curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("smoothWorkspace", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1 } } })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2.4, bezier = "smoothWorkspace", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.4, bezier = "smoothWorkspace", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
