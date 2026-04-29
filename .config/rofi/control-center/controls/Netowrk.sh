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

# Check wireless connection
check_nm_wireless_state() {
    WIFI_CON_STATE=$(nmcli device status | grep "^${WIRELESS_INTERFACES[WLAN_INT]}." | awk '{print $3}')

    # Adjust this to get rid of the CONNECTION and (externally) fields
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

#active_network()

# Toggle Wi-Fi on/off
# MIGHT RUN INTO AN ISSUE WITH SUDO PERMISSIONS WHEN RUNNING THIS FUNCTION IN ROFI
# In fact, this will probably have to be rewritten to account for this
toggle_network() {
    check_nm_status > /dev/null # Mute `check_nm_status` output
    if [[ "$status" = "active" ]]; then
        sudo systemctl stop NetworkManager.service
    else
        sudo systemctl enable NetworkManager.service
        sudo systemctl start NetworkManager.service
    fi
}

list_wifi_networks() {
    # Extract the SSID and SIGNAL fields and remove headers
    WIFI_NETWORKS=$(nmcli -f SSID,SIGNAL device wifi | tail -n +2 | sort -nr -k2) # Pretty sure it already sorts by signal, but I'll sort just in case
}
# Don't forget a "refresh" option for displaying wi-fi (We'll do this much later)

: '
WHAT WE HAVE SO FAR:
* Check network status (for NM in general)
* Check wifi state
* Check ethernet state
* Toggle network
* A list of wifi networks

SO, WHAT ELSE DO WE NEED?
* Currently connected network (already done, just needs to be fed into rofi using `check_nm_wireless_state` with ` ACTIVE_SSID`)
* Connect to network option (an option that then leads to the list of Wi-Fi networks)

BUT, IN THE MEANTIME, LETS JUST OUTPUT WHAT WE CURRENTLY HAVE INTO A ROFI MENU

We want it to be a series of options, not a bunch of info overwhelming the user:
* Currently active network (could be displayed in the search tab)
* Wi-Fi toggle on/off
* Option to open a list of available networks (need to adjust network list function to not include the current network)
* Option to switch to ethernet (this will be annoying to test witht the current laptop. Not a huge priority)
* I think thats about it. We can add additional stuff for advanced configuration when the baseline is complete
'

# rofi -show wifi -modi "wifi:~/.dotfiles/.config/rofi/control-center/controls/Netowrk.sh"
check_nm_wireless_state
echo -en "\0prompt\x1fConnected to ${ACTIVE_SSID}\nTurn Off\nList Available Networks"
