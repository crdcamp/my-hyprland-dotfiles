---------------------
--- LOOK AND FEEL ---
---------------------
require("colors")

-- Waybar Blur
hl.layer_rule({
    name = "waybar-blur",
    match = { namespace = waybar },
    blur = true,
    ignore_alpha = 0,
})
