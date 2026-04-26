#!/usr/bin/env bash

# ADD A CHECK TO SEE IF WIFI IS RUNNING... or however you say that
# Make sure you're checking the device list correctly

device_list=$(iwctl device list)
#echo "$device_list"

# Need to ensure we're using the right station when the rest is done

# Get some clean results for the networks
# DON'T FORGET TO FIND OUT HOW TO REFRESH THIS
get_networks_list() {
    iwctl station wlan0 scan
    iwctl station wlan0 get-networks | \
        tail -n +5 | \
        head -n -1 | \
        sed -e "s:\[1;30m::g" | \
        sed -e "s:\[0m::g" | \
        sed -e "s:\*\x1b.*:\*:g" | \
        sed -e "s:\x1b::g" | \
        awk '{print $1}'
}

get_networks_list
echo

echo "$networks_list" | grep "Network name"
# Won't work till we get a list output
#"$networks_list" | rofi -dmenu
# We'll have to pipe the above results into rofi now

# DON'T FORGET TO STOP STATION SCAN



# Exit iwctl when done
######################
