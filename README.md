# Aptus

This is an [Arch Linux](https://archlinux.org/)/[Hyprland](https://hypr.land/) configuration that balances minimalism, a *tiny* bit of accessibility, and aesthetics. It's an operating system mostly meant for coding, but will likely be my main driver when complete.

"Aptus" is Latin for "Suitable, adapted, fit, proper, or ready for a particular purpose or situation". So... that's what this system is named after.

I'm about 65% of the way done with these configuration files. The remaining requirements are as follows:
* Finish theming and configuring [rofi](https://github.com/davatorium/rofi)
* Create [rofi](https://github.com/davatorium/rofi) menus for Network, Bluetooth, and Audio Output
* Finish up [Waybar](https://github.com/alexays/waybar) (mostly complete - just needs a little love)
* Configure [swaync](https://github.com/ErikReider/SwayNotificationCenter) notification daemon

I honestly wouldn't recommend anyone to use Hyprland configuration files from others (or Hyprland in general), but you're welcome to try these out.

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

That's it! Welcome to Aptus.
