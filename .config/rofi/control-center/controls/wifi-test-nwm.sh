#!/usr/bin/env bash
# Some code was borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
WLAN_INT=0

WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))

# Should probably change the stop/start to a toggle instead
# Or you could just put both functions into a toggle function
# Do this when you have a better understanding of rofi
#nm_toggle()
# Check if NetworkManager.service is running. Start it if not
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

# Function for wireless interface
wireless_interface_state() {
    ACTIVE_SSID=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $4}')
    echo "Active SSID: $ACTIVE_SSID"
    WIFI_CON_STATE=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $3}')
    echo "Wi-fi connection state: $WIFI_CON_STATE"
}

start_nm
wireless_interface_state
stop_nm

# Function for wired interface
