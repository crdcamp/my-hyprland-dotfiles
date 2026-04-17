# THIS INSTALL SCRIPT ASSUMES A FRESH MINIMAL ARCH INSTALL

# Ensure we're in the home folder
cd ~/

# Install git
pacman -S git

# Install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

cd ~/



# CREATE FRESH PACKAGES.TXT FILE BEFORE DOING THIS
# Install all dependencies by reading packages.txt
#...............

# Delete auto generated hyprland configs

# Change to zsh from bash

# Clone Hyprland configuration files and install them
git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
mkdir .dotfiles
cp -r ~/my-hyprland-dotfiles ~/.dotfiles

# Setup gnu stow
stow --dir=~/.dotfiles --target=~/

# Next steps:

# Setup xdg-desktop-portal-shana before continuing (this doesn't apply to scripting)
# DON'T FORGET TO ADD THIS TO GIT

# Configure Nautilus to use zed

# Setup synced clock (I forget how to do this)

# Create symlinks to xdg for git tracking

# Setup timeshift
