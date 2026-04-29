# Running rofi
To launch rofi directly in a certain mode, specify a mode with rofi -show <mode>. To show the drun dialog:

```terminal
rofi -show drun
```

# [Rofi Script Mode](https://davatorium.github.io/rofi/2.0.0/rofi-script.5/)

Rofi supports modes that use simple scripts in the background to generate a list and process the result from user actions. This provides a simple interface to make siple extensions to rofi.

## Usage

To specify a script mode, set a mode with the following syntax: "{name}: {executable}"

For example:

```terminal
rofi -show fb -modes "fb:file_browser.sh"
```

The name should be unique.

## API

Rofi calls the executable without arguments on startup. This should generate a list of options, separated by a newline (`\n`) (This can be cahnged by the script). If the user selects an topion, rofi calls the executable with the text of that option as the first argument. If the script returns no entries, rofi quits.

A simple sctipt would be:

```bash
#!/usr/bin/env bash

if [ x"$@" = x"quit" ]
then
    exit 0
fi
echo "reload"
echo "quit"
```

You can call this with the following:

```terminal
`rofi -show script -modi "script:$HOME/.dotfiles/.config/rofi/rofi_example.sh"`
```

This shows two entries: reload and quit. When the quit entry is selected, rofi closes.
