#!/usr/bin/env bash

# Need to Add notification for successful update
sudo timeshift --create --comments "Before system update"
yay -Syu
pacman -Qq > ~/.dotfiles/packages.txt && echo "Your package list has been updated. Goodbye."
sleep 4
exit
