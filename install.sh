#!/usr/bin/env bash

# Ensure we're in the home folder
cd ~/

# Sync system clock with network

# Install git
sudo pacman -S git

# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Return to home folder
cd ~/

# Create quick access folders for Nautilus
mkdir -p ~/{Desktop,Code,Documents,Notes}

# Install all packages
yay -S --needed --noconfirm - < packages.txt

# Change shell to zsh
chsh -s /usr/bin/zsh

# Delete auto generated configs
rm -rf ~/.config

# Clone Hyprland configuration files and copy them
git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
mkdir .dotfiles
# We'll change this to the `mv` command later
cp -r ~/my-hyprland-dotfiles ~/.dotfiles

# Setup GNU Stow
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

# xdg-mime configuration
xdg-mime default dev.zed.Zed.desktop text/plain
xdg-mime default brave-browser.desktop x-scheme-handler/http
xdg-mime default brave-browser.desktop x-scheme-handler/https

# Setup timeshift
sudo systemctl daemon-reload
sudo systemctl enable timeshift-hourly.timer
root_uuid=$(findmnt -n -o UUID /)
sudo mkdir -p /etc/timeshift
sudo tee /etc/timeshift/timeshift.json << EOF
{
    "backup_device_uuid" : "$root_uuid",
    "parent_device_uuid" : "",
    "do_first_run" : "false",
    "btrfs_mode" : "true",
    "include_btrfs_home_for_backup" : "true",
    "include_btrfs_home_for_restore" : "true",
    "stop_cron_emails" : "true",
    "schedule_monthly" : "true",
    "schedule_weekly" : "false",
    "schedule_daily" : "false",
    "schedule_hourly" : "false",
    "schedule_boot" : "false",
    "count_monthly" : "10",
    "count_weekly" : "0",
    "count_daily" : "0",
    "count_hourly" : "0",
    "count_boot" : "0",
    "snapshot_size" : "0",
    "snapshot_count" : "0",
    "date_format" : "%Y-%m-%d %H:%M:%S",
    "exclude" : [],
    "exclude-apps" : []
}
EOF

# Use `chmod +x` on all relevant .sh files

# Configure GTK dark theme for root apps

echo "Installation complete. Welcome to Aptus. Please reboot your device before continuing."


# FOR LATER: Check if NetworkManager is using iwd backend:
#nmcli -f GENERAL.STATE,WIFI-PROPERTIES.WEP device show wlan0
