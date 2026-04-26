#!/usr/bin/env bash
control_center_dir="${HOME}/.dotfiles/.config/rofi/control-center/controls"

# Present scripts to user, capture selection
selected=$(ls "$control_center_dir" | rofi -dmenu -p "Control Center")

# Execute the selected script if one was chosen
if [[ -n "$selected" ]]; then
    bash "${control_center_dir}/${selected}"
fi
