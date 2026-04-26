#!/usr/bin/env bash

# Code borrowed from: https://github.com/P3rf/rofi-network-manager/blob/master/src/ronema

# If not, start/enable NM
start_enable_nm() {
    sudo systemctl start NetworkManager.service
    sudo systemctl enable NetworkManager.service
}

# Function to stop NM from running
# Use this for when the rofi menu is closed
stop_nm() {
    sudo systemctl stop NetworkManager.service
}

# Check if network manager is running
nm_status() {
    if [ "$(systemctl is-active NetworkManager.service)" = "active" ]; then
}

# Function for wireless interface

# Function for wired interface
