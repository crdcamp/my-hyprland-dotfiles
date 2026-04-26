#!/usr/bin/env bash

state=$(iwctl station wlan0 show | grep "^\s*State" | awk '{print $2}')
ssid=$(iwctl station wlan0 show | grep "^\s*Connected network" | awk '{print $3}')

disconnect() {
    iwctl station wlan0 disconnect
}

connect() {
    if [[ -n "$1" ]]
    then
              # terminal needed to input password
        xterm -e "iwctl station wlan0 connect "$1""

    else
        iwctl station wlan0 connect "$ssid"
    fi
}

select_network() {
    iwctl station wlan0 scan
    selection=$(iwctl station wlan0 get-networks \
        | tail -n +5 \
        | head -n -1 \
        | sed -e "s:\[1;30m::g" \
        | sed -e "s:\[0m::g" \
        | sed -e "s:\*\x1b.*:\*:g" \
        | sed -e "s:\x1b::g" \
        | rofi -dmenu -l 10)
    read selection _ <<< "$selection" #Keep only first column
    if [[ -n "$selection" ]]
    then
        if [[ "$selection" == ">" ]] # selected current connected network
        then
            response=$(printf "Back\nReconnect\nDisconnect\n" | dmenu -l 3 -p "$ssid" -n 1)
            case "$response" in
                "Back")
                    select_network
                    ;;
                "Reconnect")
                    disconnect
                    connect
                    ;;
                "Disconnect")
                    disconnect
                    ;;
            esac
        else
            response=$(printf "Back\nConnect\n" | dmenu -l 2 -p "$selection")
            case "$response" in
                "Back")
                    select_network
                    ;;
                "Connect")
                    connect "$selection"
                    ;;
            esac
        fi
    fi
}

select_network
