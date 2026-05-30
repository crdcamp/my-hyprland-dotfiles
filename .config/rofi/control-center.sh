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
        coproc ( sleep 0.1 && kitty --title impala -e impala )
        ;;
    "Bluetooth")
        coproc ( sleep 0.1 && kitty --title bluetui -e bluetui )
        ;;
    "Audio")
        coproc ( sleep 0.1 && kitty --title wiremix -e wiremix )
        ;;
    "System")
        coproc ( gnome-system-monitor > /dev/null 2>&1 ) # TBD
        ;;
    "Update")
        coproc ( kitty -e "$HOME/.dotfiles/.config/rofi/update.sh" )
        ;;
esac
