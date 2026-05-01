# General

- [ ] Add resize window to float key
- [ ] Sync system clock with network
- [ ] Add the functionality that enables you to partially scroll through workspaces
- [ ] Double check that Nautilus is defaulting to Zed
- [ ] Fix Spotify window rule
- [ ] Timer for turning off screen and locking (after Hyprlock is done)
- [ ] Find out if there's some way to have animations to match the window name for rofi to apply them to all rofi windows
- [ ] Install font's for other languages
- [ ] Screen shot functionality
- [ ] Fill half of screen with key binding
- [ ] In all `.sh` files, correct `~/` to `${HOME}` 
- [ ] Keyboard light timer
- [ ] Resize window for float windows
- [ ] Shadow for float windows
- [ ] Can't drag to resize float windows when they're under waybar
- [ ] Display All keybindings in rofi menu (MOD + M)

# Keybindings

- [x] SUPER + SHIFT + {hjkl} to move windows
- [x] Resize windows with arrow keys
- [ ] Resize active float window to a default size
- [ ] Keybinding for spotify web player (app barely works)
- [ ] Bind for github.com
- [ ] Fix mute button so volume unmutes when the audio up key is pressed
- [ ] Alt-Tab functionality

# Install script
- [ ] Setting iwd as backend for NetworkManager. [Link](https://wiki.debian.org/NetworkManager/iwd) (this will be easy)
- [ ] Set eww config directory

# Appearance
- [ ] Fix cursor size changing in slectron apps like Steam and Spotify
- [ ] Ensure QT theming is working correctly

# Interaction
  - [ ] Scrolling that flows (I'm not sure what the exact word for this is)

# Rofi

- [ ] Need to make System directory accessible
- [ ] Make config file specifically for `open-controls.sh`:
  - [ ] Change the display name to `Control Center:`
  - [ ] Remove the current directory, remove the `..` (the first result)
  - [ ] Remove the (1/5) to the right of the input menu
  - [ ] Remove extensions from file names
  - [ ] Add icons for eachg menu
  - [ ] Customize the order menus are presented
  - [ ] Consider making is a horizontal view if you can replace the names with icons
- [ ] Grid view for wallpaper menu
- [ ] Finish customizing color scheme
- [ ] Apply Hyprland animations to custom scripts

# Waybar

- [ ] Move workspaces to the left of active workspace (in its own box)
- [ ] Move time to center
- [ ] Audio control
- [ ] Add percent for volume to the right
- [ ] Add percent for brightness to the right
- [ ] Add rofi menus as "on-click" for relevant display info
- [ ] Add highlight for currently active workspace

# Hyprlock
- [ ] Download and configure Hyprlock (probably gonna add some new requirements here)

# Super Advanced
- [ ] Save exact position and size of all windows when shutting down (put a command before the exit keybinding)
- [ ] Fill half screen functionality. Just `fullscreen` dispatcher, only instead it's `halfscreen`
- [ ] Show waybar when screen is completely filled and you drag the mouse to the top of the screen
- [ ] Have nautilus close whenever you open a document with it
- [ ] Functionality to hide float windows in the currently active workspace
- [ ] When moving a window with keybindings, preserve the initial scale of the window

# Final Requirements
**Note: The more difficult options of these will require creating a tracking system for all windows. That should be your first step before continuing with the window management aspects.**
- [ ] Ensure the following things are functional:
  - [ ] Screen sharing
  - [ ] Screen shots
  - [ ] External monitors
  - [ ] Spotify: Think you're missing some software to have it work fully. Visit [this page](https://wiki.archlinux.org/title/Spotify) as a good starting point
- [ ] Create logo for Aptus
- [ ] Use logo in boot screen
- [ ] Have computer load into Hyprland right at the start
