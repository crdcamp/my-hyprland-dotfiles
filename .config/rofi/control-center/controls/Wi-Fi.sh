#!/usr/bin/env bash

# ADD A CHECK TO SEE IF WIFI IS RUNNING... or however you say that
# Make sure you're checking the device list correctly

device_list=$(iwctl device list)
#echo "$device_list"

# Get some clean results for the networks
# DON'T FORGET TO FIND OUT HOW TO REFRESH THIS
networks=$(iwctl station wlan0 get-networks | tail -n +5 | head -n -1)
echo $networks


"$networks" | rofi -dmenu
# We'll have to pipe the above results into rofi now

# DON'T FORGET TO STOP STATION SCAN



# Exit iwctl when done
######################
