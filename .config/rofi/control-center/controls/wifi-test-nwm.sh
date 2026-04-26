#!/usr/bin/env bash

# Code borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema

# Check if network manager is running and start it if it's not
start_nm() {
    if [ "$(systemctl is-active NetworkManager.service)" != "inactive" ];
        then
        echo 'NetworkManager.service is already running'
        return
    fi
    sudo systemctl start NetworkManager.service
    sudo systemctl enable NetworkManager.service
    echo 'Started/Enables NetworkManager.service'
}

# Function to shut down NetworkManager


# Function for wireless interface

# Function for wired interface
