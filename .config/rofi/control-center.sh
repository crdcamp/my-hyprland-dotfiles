#!/usr/bin/env bash

# Root menu
if [ "$ROFI_RETV" = "0" ]; then
    echo -en "\0prompt\x1fControl Center\nNetwork\nBluetooth\nAudio\nSystem"
fi
