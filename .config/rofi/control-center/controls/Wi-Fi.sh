#!/usr/bin/env bash

# ADD A CHECK TO SEE IF WIFI IS RUNNING... or however you say that
# Make sure you're checking the device list correctly

iwctl device list

# Get some clean results for the networks
iwctl station wlan0 get-networks | tail -n +5 | head -n -1

# We'll have to pipe the above results into rofi now

# DON'T FORGET TO STOP STATION SCAN
$station=

# Exit iwctl when done
######################
