# Script Mode

rofi supports modes that use simple scripts in the background to generate a list and process the result from user actions. This provide a simple interface to make simple extensions to rofi.

# Usage

To specify a script mode, set a mode with the following syntax: "{name}:{executable}"

For example:

```bash
rofi -show fd -modes "fd:file_browser.sh"
```

The name should be unique.

The `fb` is just the name you're giving to the custom mode. It's an arbitrary label. So, `fb:file_browser.sh` means "create a mode called `fd`, backed by the script `file_browser.sh`.

# API

Rofi calls the executable without arguments on startup. This should generate a list of options separated by a newline (This can be changed by the script). If the user selects an option, rofi calls the executable with the text of that option as the first argument. If the script returns no entries, rofi quits.

A simple script would be:

```bash
#!/usr/bin/env bash
if [ x"$@" = x"quit" ]
then
    exit 0
fi
echo "reload"
echo "quit"
```
