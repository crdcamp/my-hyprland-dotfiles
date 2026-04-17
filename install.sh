#!/usr/bin/env bash

# Ensure we're in the home folder
cd ~/

# Configure system clock to sync with network's

# Install git
sudo pacman -S git

# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Homefolder... again (you never know)
cd ~/

# Create quick access folders for Nautilus
mkdir -p ~/{Code,Documents,Notes}

# Install all packages
yay -S --needed --noconfirm - < packages.txt

# Change shell to zsh
chsh -s /usr/bin/zsh

# CREATE FRESH PACKAGES.TXT FILE BEFORE DOING THIS
# Install all dependencies by reading packages.txt

# Delete auto generated configs
rm -rf ~/.config

# Clone Hyprland configuration files and copy them (we'll stick with manual deletion for now)
git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
mkdir .dotfiles
cp -r ~/my-hyprland-dotfiles ~/.dotfiles

# GNU Stow
stow --dir=~/.dotfiles --target=~/

# Create `xdg-desktop-portal` and `xdg-desktop-portal-shana` directories
mkdir -p ~/.config/{xdg-desktop-portal-shana,xdg-desktop-portal}
touch ~/.config/xdg-desktop-portal-shana/config.toml
touch ~/.config/xdg-desktop-portal/hyprland-portals.conf

# Insert `xdg-desktop-portal-shana` config
cat > ~/.config/xdg-desktop-portal-shana/config.toml << 'EOF'
open_file = "Gnome"
save_file = "Gnome"

[tips]
open_file_when_folder = "Gnome"
EOF

# Insert `xdg-desktop-portal` config
cat > ~/.config/xdg-desktop-portal/hyprland-portals.conf << 'EOF'
[preferred]
default=hyprland;gtk
org.freedesktop.impl.portal.FileChooser=shana
EOF

# Configure Nautilus to use Zed Editor
xdg-mime default dev.zed.Zed.desktop text/plain

# Setup timeshift

# Configure GTK dark theme for root apps

# Enjoy!
echo "Installation complete. Please reboot your device."
