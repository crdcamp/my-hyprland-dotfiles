#!/usr/bin/env bash
WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
# Some code was borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema

# Function to check if network manager is running and start it if it's not
start_nm() {
    if [ "$(systemctl is-active NetworkManager.service)" = "active" ];
        then
        echo 'NetworkManager.service is already running'
        return
    fi
    sudo systemctl start NetworkManager.service
    sudo systemctl enable NetworkManager.service
    echo 'Started/Enabled NetworkManager.service'
}

# Function to stop NetworkManager
stop_nm() {
    if [ "$(systemctl is-active NetworkManager.service)" = "inactive" ];
        then
        echo 'NetworkManager is already inactive'
        return
    fi
    sudo systemctl stop NetworkManager.service
    echo 'Stopped NetworkManager.service'
}

# Function for wireless interface

# Function for wired interface
