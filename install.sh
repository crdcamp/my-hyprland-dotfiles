#!/usr/bin/env bash
# NEED TO FIGURE OUT HOW TO ACCEPT ALL PROMPTS DURING INSTALL

# Ensure we're in the home folder
cd ~/

# Install git and yay
pacman -S git
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Homefolder... again
cd ~/

# CREATE FRESH PACKAGES.TXT FILE BEFORE DOING THIS
# Install all dependencies by reading packages.txt

# Delete auto generated hyprland configs
rm -rf ~/.config

# Change to zsh from bash

# Clone Hyprland configuration files and copy them
git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
mkdir .dotfiles
cp -r ~/my-hyprland-dotfiles ~/.dotfiles

# GNU Stow
stow --dir=~/.dotfiles --target=~/

# XDG-DESKTOP-PORTAL SETUP
# Create `xdg-desktop-portal` and `xdg-desktop-portal-shana` directories
mkdir -p ~/.config/{xdg-desktop-portal-shana,xdg-desktop-portal}
touch ~/.config/xdg-desktop-portal-shana/config.toml
touch ~/.config/xdg-desktop-portal/hyprland-portals.conf

# `xdg-desktop-portal-shana` config
cat > ~/.config/xdg-desktop-portal-shana/config.toml << 'EOF'
open_file = "Gnome"
save_file = "Gnome"

[tips]
open_file_when_folder = "Gnome"
EOF

# `xdg-desktop-portal` config
cat > ~/.config/xdg-desktop-portal/hyprland-portals.conf << 'EOF'
[preferred]
default=hyprland;gtk
org.freedesktop.impl.portal.FileChooser=shana
EOF

# Configure Nautilus to use Zed Editor

# Setup synced clock (I forget how to do this)

# Create symlinks to xdg for git tracking

# Setup timeshift
