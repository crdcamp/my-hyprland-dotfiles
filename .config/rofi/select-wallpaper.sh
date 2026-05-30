#!/usr/bin/env bash
# This whole thing could be cleaned up...

# ADD KEYSTROKES FOR EXIT PARAMETERS, SUCH AS
# CHANGING WINDOWS CREATING AN EXIT CALL

# Wallpapers path
# ADD LOGIC TO IGNORE CURRENT WALLPAPER REQUEST
terminal=kitty
wallpaper_dir="$HOME/.dotfiles/Pictures/Wallpapers"
wallpapers=($(ls "$wallpaper_dir"))
wallpaper_list=$(printf "%s\n" "${wallpapers[@]}")
selected_wallpaper=$(echo -e "$wallpaper_list" | rofi -dmenu -p "Wallpaper")
wallpaper_path="$wallpaper_dir/$selected_wallpaper"

# Append changes to hyprpaper.conf (probably a better way to do this through the hyprctl command at the bottom of the if statement)
if [[ -n "$selected_wallpaper" ]]; then
    cat > ~/.config/hypr/hyprpaper.conf <<EOF
    wallpaper {
        monitor =
        path = $wallpaper_path
        fit_mode = full
    }

    splash = false
EOF
    # Apply matugen themes and new wallpaper
    # ADD LOGIC FOR IGNORING REAPPLICATION OF THE SAME WALLPAPER
    matugen image $wallpaper_path -m dark --source-color-index 0
    hyprctl hyprpaper wallpaper ,$wallpaper_path
fi
