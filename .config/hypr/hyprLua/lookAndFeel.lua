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

-- Window Distancing/Border Colors
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 3,

        border_size = 2,

        col = {
            active_border = { colors = {} }
        }
    }
})
