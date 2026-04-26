#!/usr/bin/env bash

# Code borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema

# Check if network manager is running
nm_status() {
    if [ "$(systemctl is-active NetworkManager.service)" != "inactive" ];
        echo 'NetworkManager.service is already running'
        return
    fi
    sudo systemctl start NetworkManager.service
    sudo systemctl enable NetworkManager.service
}

# Function for wireless interface

# Function for wired interface
