#!/usr/bin/env bash

# Run command:
# rofi -show controls -modi "controls:$HOME/.dotfiles/.config/rofi/control-center.sh"
if [[ "$ROFI_RETV" -eq 0 ]]; then
    # Need to make an if statement for if there's no network
    echo -en "\0prompt\x1fConnected to ${ACTIVE_SSID}\n"
    # Need an if statement here to display wifi on/off depending on the current case
    echo "Network"
    echo "Bluetooth"
    echo "Audio"
    echo "System"

elif [[ "$ROFI_RETV" -eq 1 ]]; then
    case "$1" in
        "Network")
            rofi -show wifi -modi "wifi:~/.dotfiles/.config/rofi/control-center/controls/Network.sh"
            ;;
        "Bluetooth")
            rofi -show bt -modi "bt:~/.dotfiles/.config/rofi/control-center/controls/Bluetooth.sh"
            ;;
        "Audio")
            rofi -show audio -modi "audio:~/.dotfiles/.config/rofi/control-center/controls/Audio.sh"
            ;;
        "System")
            rofi -show system -modi "system:~/.dotfiles/.config/rofi/control-center/controls/System.sh"
            ;;
        *)
    esac
fi
