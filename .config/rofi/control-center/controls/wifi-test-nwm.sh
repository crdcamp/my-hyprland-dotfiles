#!/usr/bin/env bash

# Check if network manager is running

# If not, start/enable NM
start_enable_nm() {
    sudo systemctl start NetworkManager.service
    sudo systemctl enable NetworkManager.service
}

# Function to stop NM from running
stop_nm() {

}
