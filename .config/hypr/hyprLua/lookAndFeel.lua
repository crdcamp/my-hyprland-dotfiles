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

})
