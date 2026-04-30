# Synopsis

Here's the general overview of the rofi command:

```bash
rofi [ -show mode ]|[ -dmenu ]|[ -e msg ] [ CONFIGURATION ]
```

# Usage

There are different *modes* for different types of actions if rofi. 

rofi is a standalone application and should not be integrated into scripts (but we're gonna do that anyway).

**For integration into scripts, rofi has a special mode that functions as a (drop-in) replacement for dmenu.**

## Running rofi

To launch rofi directly in a certain mode, specify a mode with `rofi -show <mode>`.To show the `drun` dialog:

```bash
rofi -show drun
```

A useful setup in minimalistic window managers is to combine (combi) `drun`, `run` with `window` mode. In other words, this creates a menu that shows applications you can launch with names in desktop files (drun), shows all installed files (run), and displays open windows (window) 

```bash
rofi -show combi -modes combi -combi-modes "window,drun,run"
```

In this setup it first list all open applications, then all installed applications. So if you type firefox and hit return, it will switch to the running firefox, or launch it when it is not running.

The definition straight from the rofi documentation can be found in `5 - Available Modes.md`.

## [rofi Modes](https://mxlinux.org/wiki/help-files/help-rofi/)

**drun**
* Applications menu with names in desktop files
* Icons can be enabled in config file
* Creates favorites list by sorting frequently used programs on top
* Cannot launch apps requiring root access

**run**
* Shows all installed files
* Preserves history
* Displays command, not name (e.g., "calc" brings up "localc", not "LibreOffice Calc")

**window**
* Displays open windows for rapid switching

**calc**
* A calculator with a bunch of functionalities (might be worth investigating when the main menus are done)

**ssh**
* Creates a list of remote hosts based on the content of the `~/.ssh/config` and the `~/.ssh/known_hosts` files
* Allows user to ssh into them quickly

Custom **modi** (simply plural for modes) can be added using the internal `script` mode. **Each mode has two parameters "name" and "script"**.

# dmenu Mode

Run rofi in dmenu mode. This **allows for interactive scripts**. In `dmenu` mode, rofi reads frmo STDIN, and output to STDOUT. A simple example, displaying three predefined options:

```bash
echo -e "Option #1\nOption #2\nOption#3" | dofi -dmenu
```

Or **get the options from a script**:

```bash
~/my_script.sh | rofi -dmenu
```

# Running rofi with multiple modes

Specify an ordered, comma-separated list of modes to enable. Enables modes can be changed at runtime. Default key is `Ctrl+Tab`. If no modes are specified, all configured modes will be enables. To only show the `run` and `ssh` launcher:

```bash
rofi -modes "run,ssh" -show run
```

**Custom modes** can be added using the internal `script` mode. Each such mode has two parameters:

```bash
<name>:<script>
```

Example: Have a mode called `Workspaces` using the `i3_switch_workspaces.sh` script:

```terminal
rofi -modes "window,run,ssh,Workspaces:i3_switch_workspaces.sh" -show Workspaces
```

**Note:** The i3 window manager dislikes commas in the command when specifying an exec command, for that case **`#` can be used as a separator**.

**Tip:** The name is allowed to contain spaces:

```terminal
rofi -modes "My File Browser:fb.sh" -show "My File Browser"
```
