#!/usr/bin/env bash
show_control_center() {
    echo -en "\0prompt\x1fControl Center\nNetwork\nBluetooth\nAudio\nSystem"
}

case "$1" in
    "Network")
        impala
        ;;
    "Bluetooth")
        coproc ( blueman-manager > /dev/null 2>&1 )
        ;;
    "Audio")
        coproc ( pavucontrol > /dev/null 2>&1 )
        ;;
    "System")
        coproc ( gnome-system-monitor > /dev/null 2>&1 )
        ;;
    *)
        show_control_center
        ;;
esac
