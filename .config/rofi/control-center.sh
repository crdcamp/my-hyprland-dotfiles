#!/usr/bin/env bash

# NETWORK FUNCTIONS
# Note: Need to add error handling for if nm isn't running
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))
WLAN_INT=0

check_nm_wifi_state() {
    WIFI_CON_STATE=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $3}')
    ACTIVE_SSID=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $4}')

    if [[ "$WIFI_CON_STATE" == "disconnected" ]]; then
        WIFI_TOGGLE_DISPLAY="Turn on Wi-Fi"
    else
        WIFI_TOGGLE_DISPLAY="Turn off Wi-Fi"
    fi
}

toggle_wifi() {
    if [[ "$WIFI_CON_STATE"="disconnected" ]]; then
        nmcli radio wifi on
    else
        nmcli radio wifi off
    fi
}

list_wifi_networks() {
    # Extract the SSID and SIGNAL fields and remove headers
    WIFI_NETWORKS=$(nmcli -f SSID device wifi | tail -n +2 | sort -nr -k2) # Pretty sure it already sorts by signal, but I'll sort just in case
}

show_network_page() {
    check_nm_wifi_state
    echo -en "\0data\x1network\n"
    echo -en "\0prompt\x1fNetwork\n"
    echo "$WIFI_TOGGLE_DISPLAY"
    echo "Show available networks"
}

handle_network_selection() {
    case "$1" in

}

# ROOT MENU
if [ "$ROFI_RETV" = "0" ]; then
    echo -en "\0prompt\x1fControl Center\n"
    echo "Network"
    echo "Bluetooth"
    echo "Audio"
    echo "System"
elif [ "$ROFI_RETV" = "1" ]; then

fi
