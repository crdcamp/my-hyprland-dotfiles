#!/usr/bin/env bash
# A lot of this code was borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))
WLAN_INT=0

# Check if NetworkManager.service is running
check_nm_status() {
    status="$(systemctl is-active NetworkManager.service)"
    echo "NETWORKMANAGER STATUS: $status"
    # Add additional logic for what to do if NetworkManager.service is inactive
}

# Toggle Wi-Fi on/off
toggle_network() {
    check_nm_status > /dev/null # Mute `check_nm_status` output
    if [[ "$status" = "active" ]]; then
        sudo systemctl stop NetworkManager.service
        echo "Wi-Fi: OFF"
    else
        sudo systemctl enable NetworkManager.service
        sudo systemctl start NetworkManager.service
        echo "Wi-Fi: ON"
    fi
}

# Check wireless connection
check_nm_wireless_state() {
    WIFI_CON_STATE=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $3}')
    echo "WI-FI CONNECTION STATE: $WIFI_CON_STATE"

    ACTIVE_SSID=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $4}')
    echo "ACTIVE SSID: $ACTIVE_SSID"
}

# Check ethernet connection
check_nm_ethernet_state() {
    ETHERNET_CON_STATE=$(nmcli device status | grep "ethernet" | head -1 | awk '{print $3}')
    if [[ "$ETHERNET_CON_STATE" != "" ]]; then
        ETHERNET_CON_STATE="active"
        echo "ETHERNET CONNECTION STATE: $ETHERNET_CON_STATE"
        return
    fi
    ETHERNET_CON_STATE="inactive"
    echo "ETHERNET CONNECTION STATE: $ETHERNET_CON_STATE"
}

# Check if the above functions are working properly
# check_nm_status
# toggle_network
# check_nm_status
# toggle_network
