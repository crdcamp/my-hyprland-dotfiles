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
        }
    },
    animations {
        enabled = true,

    }
})

-- Curves and Animations
