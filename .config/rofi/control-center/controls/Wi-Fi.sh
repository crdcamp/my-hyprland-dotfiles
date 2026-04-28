#!/usr/bin/env bash
# A lot of this code was borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))
WLAN_INT=0

# Check if NetworkManager.service is running
check_nm_status() {
    status="$(systemctl is-active NetworkManager.service)"
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
    ACTIVE_SSID=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $4}')

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

list_wifi_networks() {
    # Extract the SSID and SIGNAL fields and remove headers
    WIFI_NETWORKS=$(nmcli -f SSID,SIGNAL device wifi | tail -n +2 | sort -nr -k2) # Pretty sure it already sorts by signal, but I'll sort just in case
    echo "$WIFI_NETWORKS"
}
# Don't forget a "refresh" option for displaying wi-fi (We'll do this much later)

list_wifi_networks
