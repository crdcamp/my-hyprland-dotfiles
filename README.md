# Aptus

This is an [Arch Linux](https://archlinux.org/)/[Hyprland](https://hypr.land/) configuration that balances minimalism, a *tiny* bit of accessibility, and aesthetics. It's an operating system mostly meant for coding, but will likely be my main driver when complete.

"Aptus" is Latin for "Suitable, adapted, fit, proper, or ready for a particular purpose or situation". So... that's what this system is named after.

This operating system still has a ways to go but the automated theme changing, general functionality, and baseline visuals are relatively complete. The dreadful amount of tasks ahead of me can be found in [ToDo.md](https://github.com/crdcamp/my-hyprland-dotfiles/blob/main/ToDo.md).

# A couple warnings before installing
* This install script assumes you have **absolutely nothing** on your computer. It **will** delete your .config folder and has absolutely no error handling.
* The install script also assumes that you are using a **[BTRFS file system format](https://wiki.archlinux.org/title/Btrfs)**. Without BTRFS, the snapshot functionality will not work. Your system will not be recoverable.

# Installation

Simply copy these commands into a minimal Arch install's TUI:

```terminal
cd ~/
git clone https://github.com/crdcamp/my-hyprland-dotfiles.git
cd ~/my-hyprland-dotfiles/
chmod +x install.sh
./install.sh
```

# Post-Install

* Configure [Git](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
* Set up [SSH for GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

In the unlikely instance someone actually tries these configurations out, the keybindings can be found in:

`~/.dotfiles/.config/hypr/keyBindings.conf`

# Updating

I've also included a custom alias for updates. It creates a snapshot before updating, does a system-wide upgrade, and updates the `packages.txt` list. You can run it with the following command:

```terminal
update-system
```

That's it! Welcome to Aptus.
