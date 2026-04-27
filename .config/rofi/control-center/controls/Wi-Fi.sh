#!/usr/bin/env bash
# A lot of this code was borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))
WLAN_INT=0

check_nm_status() {
    status="$(systemctl is-active NetworkManager.service)"
    echo "NETWORKMANAGER STATUS: $status"
    # Add additional logic for what to do if NetworkManager.service is inactive
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
    if [[ "$ETHERNET_CON_STATE" != "" ]];
        then
        ETHERNET_CON_STATE="active"
        echo "ETHERNET CONNECTION STATE: $ETHERNET_CON_STATE"
        return
    fi
    ETHERNET_CON_STATE="inactive"
    echo "ETHERNET CONNECTION STATE: $ETHERNET_CON_STATE"
}





start_nm() {
    if [[ "$(systemctl is-active NetworkManager.service)" = "active" ]];
        then
        echo 'NetworkManager.service is already running'
        return
    fi
    sudo systemctl start NetworkManager.service
    sudo systemctl enable NetworkManager.service
    echo 'Started/Enabled NetworkManager.service'
}

# Stop NetworkManager.service if it's not already inactive
stop_nm() {
    if [[ "$(systemctl is-active NetworkManager.service)" = "inactive" ]];
        then
        echo 'NetworkManager is already inactive'
        return
    fi
    sudo systemctl stop NetworkManager.service
    echo 'Stopped NetworkManager.service'
}

check_nm_status
check_nm_wireless_state
check_nm_ethernet_state

# Function for wired interface
