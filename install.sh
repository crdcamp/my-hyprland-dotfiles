cd ~

git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
mkdir .dotfiles
mv -r ~/my-hyprland-dotfiles ~/.dotfiles

stow --dir=~/.dotfiles --target=~/
