#!/usr/bin/env bash
source "$HOME/.dotfiles/.config/rofi/control-center-menus/network.sh"
# rofi -show controls -modi "controls:$HOME/.dotfiles/.config/rofi/control-center.sh"

show_root_page() {
    echo -en "\0data\x1froot\n"
    echo -en "\0prompt\x1fControl Center\n"
    echo "Network"
    echo "Bluetooth"
    echo "Audio"
    echo "System"
}

PAGE="${ROFI_DATA:-root}"

if [[ "$ROFI_RETV" -eq 0 ]]; then
    show_root_page

elif [[ "$ROFI_RETV" -eq 1 ]]; then
    case "$PAGE" in
        "root")
            case "$1" in
                "Network")
                    show_network_page
                    ;;
            esac
            ;;
        "network")
            handle_network_selection "$1"
            ;;
    esac
fi
