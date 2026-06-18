#!/usr/bin/env bash

# Need to Add notification for successful update
echo "Enter your password to update:"
sudo timeshift --create --comments "Before system update"
yay -Syu
pacman -Qq > ~/.dotfiles/packages.txt && echo -e "\nYour package list has been updated. You may want to restart your device.\nThis window will close in 5 seconds..."
sleep 5
exit
