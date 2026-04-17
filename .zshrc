# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Current Directory
PS1='%F{blue}%~%f %F{green}❯ %f'

# Code Corrections
setopt CORRECT

# Aliases
update-system() {
  sudo timeshift --create --comments "Before system update" &&
  yay -Syu &&
  pacman -Qq > ~/.dotfiles/packages.txt && echo "Update complete. Your package list has been updated"
}

# Created by `pipx` on 2026-02-07 02:01:55
export PATH="$PATH:/home/crdcamp/.local/bin"
