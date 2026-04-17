# Ensure we're in the home folder
cd ~/

# Install all dependencies
#...............

# Clone Hyprland configuration files and install them
git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
mkdir .dotfiles
cp -r ~/my-hyprland-dotfiles ~/.dotfiles

# Setup gnu stow
stow --dir=~/.dotfiles --target=~/

# Next steps:

# Setup synced clock (I forget how to do this)

# Setup xdg-desktop-portal-shana before continuing (this doesn't apply to scripting)

# Create symlinks to xdg for git tracking
