#!/usr/bin/env bash

# rofi -show wifi -modi "wifi:$HOME/.dotfiles/.config/rofi/control-center/controls/Wi-Fi.sh"
# A lot of this code was borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))
WLAN_INT=0

# Check if NetworkManager.service is running
check_nm_status() {
    status="$(systemctl is-active NetworkManager.service)"
}
# ADD A MASSIVE IF STATEMENT HERE
# If Network manager is running, continue as usual, otherwise,
# Send a message stating that networkmanager isn't running

# Check wireless connection
check_nm_wireless_state() {
    WIFI_CON_STATE=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $3}')
    ACTIVE_SSID=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $4}')
    echo $ACTIVE_SSID
}

# Check ethernet connection
check_nm_ethernet_state() {
    ETHERNET_CON_STATE=$(nmcli device status | grep "ethernet" | head -1 | awk '{print $3}')
    if [[ "$ETHERNET_CON_STATE" != "" ]]; then
        ETHERNET_CON_STATE="active"
        return
    fi
    ETHERNET_CON_STATE="inactive"
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
# Don't forget a "refresh" option for displaying wi-fi (We'll do this much later)

# rofi -show wifi -modi "wifi:~/.dotfiles/.config/rofi/control-center/controls/Network.sh"
# Don't forget to input a different prompt if no networks are connected
#echo -en "\0prompt\x1fConnected to ${ACTIVE_SSID}\nTurn Off\nAvailable Networks\nSwitch to Ethernet"
# All we really need is the ability to switch to ethernet if an ethernet cord is connected

show_network_page() {
    echo -en "\0data\x1fnetwork\n"
    echo -en "\0prompt\x1fNetwork\n"
    echo "Turn off Wi-Fi"
    echo "Show available networks"
    # etc
}

handle_network_selection() {
    case "$1" in
        "Turn off Wi-Fi")
            nmcli radio wifi off
            ;;
    esac
}
