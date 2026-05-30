#!/usr/bin/env bash

if [ "$ROFI_RETV" = "0" ]; then
    echo -en "\0prompt\x1fControl Center\n"
    echo "Network"
    echo "Bluetooth"
    echo "Audio"
    echo "System"
    exit 0
fi

case "$1" in
    "Network")
    coproc ( kitty -e impala )
        ;;
    "Bluetooth")
        coproc ( kitty -e bluetui )
        ;;
    "Audio")
        coproc ( kitty -e wiremix )
        ;;
    "System")
        coproc ( gnome-system-monitor > /dev/null 2>&1 ) # TBD
        ;;
esac
