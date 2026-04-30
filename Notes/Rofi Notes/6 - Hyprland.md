# Hyprland

Hyprland's animations make the launching of rofi feel slower than needed (I disagree, but we can use this as a way to apply animations to rofi)

```hyprland
layerrule {
    name = fix-rofi
    match:namespace = rofi
    no_anim = true
 }
```

As you might be able to tell, this disables the animations on the rofi window.

However, as stated above, you can use this as a template for applying Hyprland animations to the rofi scripts you create. Simply use `hyprctl clients` to find the rofi window name and input that into `match:namespace` and replace with the relevant animation.
