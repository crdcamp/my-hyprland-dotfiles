# Ensure we're in the home folder
cd ~/

# Clone Hyprland configuration files and install them
git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
mkdir .dotfiles
cp -r ~/my-hyprland-dotfiles ~/.dotfiles

# Setup gnu stow
stow --dir=~/.dotfiles --target=~/
