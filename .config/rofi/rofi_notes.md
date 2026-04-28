# Running rofi
To launch rofi directly in a certain mode, specify a mode with rofi -show <mode>. To show the drun dialog:

```terminal
rofi -show drun
```

# [Rofi Script Mode](https://davatorium.github.io/rofi/2.0.0/rofi-script.5/)

rofi supports modes that use simple scripts in the background to generate a list and process the result from user actions. This provides a simple interface to make siple extensions to rofi.

## Usage

To specify a script mode, set a mode with the following syntax: "{name}: {executable}"

For example:

```terminal
rofi -show fb -modes "fb:file_browser.sh"
```

The name should be unique.
