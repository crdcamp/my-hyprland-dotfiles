#!/usr/bin/env bash

# Check if network manager is running

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
