# Roadmap

## Quick Ideas
- [ ] Use [overskride](https://github.com/kaii-lb/overskride) for a beautiful bluetooth interface

## Foundation & Essential Setup
- [x] Install Hyprland and get familiar to this new world
- [x] Install essential apps (micro text editor, git, browser, file manager, IDE, python, etc.)
- [x] Change file system format to [BTRFS](https://wiki.archlinux.org/title/Btrfs) for quicker timeshift backups
- [x] Setup [`timeshift`](https://wiki.archlinux.org/title/Timeshift) to revert any potential mess ups (it's been quite a learning curve)
- [x] Install [`tlp`](https://wiki.archlinux.org/title/TLP) for laptop battery management
- [x] Automatically [update time zone with current network](https://wiki.archlinux.org/title/NetworkManager#Automatically_set_the_timezone)
- [x] Setup [GNU Stow](https://www.gnu.org/software/stow/) for easy config file management

## Keybindings & Window Management
- [x] Configure keybindings for launching essential apps
- [x] Install other necessary apps and bind to keys
- [x] Create basic window rules for apps you don't want to tile automatically
- [x] Keybindings for fullscreen options (`fullscreen1` and `fullscreen2`)
- [x] Keybinding to float all windows
- [x] Keybinding for eco mode
- [ ] Change window rules for resizing to be percent-based rather than pixel-based
- [ ] Keybindings for moving windows
- [ ] Switch to window corresponding to opened application (for example,  when you open a document, have the window automatically focus Zed editor)
- [ ] Apply the same concept above to opening links that aren't in browser
- [ ] Functionality to drag windows by their top bar (might not be possible)
- [ ] Functionality to double tap top bar for full screen
- [ ] Alt-Tab functionality
- [ ] Window task bar when float all is active (deactivate when inactive) to bridge the gap between tiling window managers and the typical desktop experience
- [ ] Window rule for float all that keeps the size of all windows that are floated

## Theming & Visual Customization
- [x] Set font and apply to all programs ([ttf-liberation-mono font](https://archlinux.org/packages/extra/any/ttf-liberation-mono-nerd/))
- [x] Install emojis
- [x] Add wallpapers using Hyprpaper
- [x] Adjust animations and colors to your liking (temporary)
- [x] Install and configure [matugen](https://github.com/InioX/matugen) for system-wide theme changes derived from background image.
- [x] Add blur effect in `hyprland.conf`
- [x] Apply [matugen themes to root GTK applications](https://wiki.archlinux.org/title/GTK#Theme_not_applied_to_root_applications)
- [x] Install fonts for all languages (you never know)
- [ ] Use [libnotify](https://github.com/GNOME/libnotify) for creating volume and brightness bar displays. Here's a good [Arch forum for other avenues as well](https://bbs.archlinux.org/viewtopic.php?id=167500).
- [ ] Create basic matugen script for automation (as an introduction to the rofi implementation)
- [ ] Custom rofi (or wofi)-based wallpaper menu using matugen commands to automatically change theme with current background colors
- [ ] Consider switching notification center to libnotify (the Gnome one) for consistency with custom GTK interfaces
- [ ] Configure `swaync` notification center to match theming. Decide whether or not to add additional configurations beyond just notifications (probably not)
- [ ] Configure [swaync](https://github.com/ErikReider/SwayNotificationCenter) notification daemon (sizing, features, etc.)
- [ ] Ensure [swaync](https://github.com/ErikReider/SwayNotificationCenter) uses matugen background colors
- [ ] Switch to [LibreWolf](https://librewolf.net/) and use [pywalfox-librewolf](https://aur.archlinux.org/packages/python-pywalfox-librewolf) to apply matugen background colors
- [ ] Apply [matugen themes to root QT applications](https://wiki.archlinux.org/title/Qt#Theme_not_applied_to_root_applications)
- [ ] Create custom GTK theme template that streamlines matugen root theme implementation
- [ ] Create custom QT theme template that streamlines matugen root theme implementation
- [ ] Install more basic and clean-looking emojis

## Waybar Configuration
- [x] Install and do basic configuration for [Waybar status bar](https://github.com/Alexays/Waybar)
- [ ] Add bluetooth module
- [ ] Slider for brightness
- [ ] Slider for volume
- [ ] Module for media
- [ ] Volume status (1, 2, or 3 bars and a mute indicator)
- [ ] Animation for when active window name pops up
- [ ] Create custom GTK dropdown menu for Waybar (looks like ya gotta learn C programming for this son) since all the options I've found are unsatisfactory.
- [ ] Advanced [Waybar](https://github.com/Alexays/Waybar) configuration: Animations and cleaning everything up
- [ ] Don't forget to fix spacing issue with disappearing update module as well
- [ ] Add float and center rule for update window
- [ ] Make sure the gap between Waybar and the bottom gap are EXACTLY equal (OCD)
- [ ] Add update module to waybar (no more manual typing, you've hammered the commands into your memory by now). Must create a snapshot before updating and reboot system after updates are complete
- [ ] Advanced [Waybar](https://github.com/Alexays/Waybar) configuration: Custom dropdown menus for Wi-fi, Bluetooth, media, etc.
- [ ] Remove `memory` module from waybar (not needed with a proper laptop)
- [ ] Integrate custom GTK menus into each relevant module
- [ ] Remove "time remaining" from battery module

## Terminal & Shell Configuration
- [x] Change terminal from bash to zsh
- [x] Basic zsh configuration
- [ ] [Bat syntax highlighting](https://github.com/sharkdp/bat) for zsh terminal

## File Management & Desktop Portals
- [x] Install and configure `xdg-desktop-portal` and `xdg-desktop-portal-shana` so you can essentially set Nautilus as a "default file manager"
- [x] Set default file manager (Nautilus) for all applications
- [ ] Create separate symlinks for `xdg-desktop-portal` and `xdg-desktop-portal-shana` (GNU Stow links don't work for these configurations)
- [ ] Use [nautilus-python](https://gitlab.gnome.org/GNOME/nautilus-python/) for creating custom keybindings for the Nautilus file manager... OR... depending on how the custom GTK dropdown menu goes... download the source and customize it to your heart's content

## Hypr Ecosystem
- [x] Install [recommended Hypr ecosystem programs](https://wiki.hypr.land/Hypr-Ecosystem/)
- [ ] Install and configure Hyprlock for lock screen

## Power Management & Performance
- [ ] Disable all power-hungry hyprland animations and GPU intensive tasks when laptop lid is closed (make sure to document for install script as well). Use "Eco mode" for inspiration and delete when done (I still think you'll need to do some additional research though to handle all GPU-intensive tasks)

## Application-Specific Tweaks
- [ ] Need Zed to stop opening single documents in currently active window
- [ ] Update Youtube and other Google quick keys so that they open in the current tab if current tab is empty
- [ ] When using Zed Editor: Using Ctrl + S must open nautilus in the currently active folder in ed Editor
- [ ] Adjust volume mute button to disable when increasing volume (currently it's required to press mute button again to unmute... not very user-friendly. Me no like.)

## Gestures & Input
- [ ] Make three finger workspace gesture animation smoother
- [ ] Make two finger swipe to show notification center
- [ ] Keyboard backlight must turn off automatically

## UI Enhancements
- [ ] App drawer (like Mac) at the bottom of the screen. Must only show when mouse is dragged to it (Might require rofi)
- [ ] Slightly slow down workspace slide animation
- [ ] (Probably listed elsewhere) Close file manager automatically after opening a file

## Security
- [x] Install and enable [`ufw`](https://wiki.archlinux.org/title/Uncomplicated_Firewall) for firewall protection
- [ ] Limit TUI login attempts
- [ ] Investigate the [Arch Wiki](https://wiki.archlinux.org/title/Security) for any additional measures

# General QOL
- [ ] Configure clang and python for zed
- [ ] Automatically log out / shut down
- [ ] Automatically turn off keyboard brightness

## Final Requirements
- [ ] Test and configure your system for multiple monitors
- [ ] Screen shot functionality
- [ ] Custom boot screen
- [ ] Automatically launch into Hyprland - no more TUI for logging in
- [ ] Create install script to make the migration to a new (proper) laptop as easy as possible
- [ ] Ensure all packages are stored separately so you can update their versions for install script more easily
- [ ] Test install script using a virtual machine
- [ ] Enjoy
