#!/usr/bin/env bash

if [ "$ROFI_RETV" = "0" ]; then
    echo -en "\0prompt\x1fControl Center\n"
    echo "Network"
    echo "Bluetooth"
    echo "Audio"
    echo "System"
    echo "Update"
    exit 0
fi

case "$1" in
    "Network")
        coproc ( kitty --title impala -e impala )
        ;;
    "Bluetooth")
        coproc ( kitty --title bluetui -e bluetui )
        ;;
    "Audio")
        coproc ( kitty --title wiremix -e wiremix )
        ;;
    "System")
        coproc ( kitty --title btop -e  btop)
        ;;
    "Update")
        coproc ( kitty --title update-system -e "$HOME/.dotfiles/.config/rofi/update.sh" )
        ;;
esac
