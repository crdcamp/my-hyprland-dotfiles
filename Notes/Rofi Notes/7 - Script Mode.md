# Script Mode

rofi supports modes that use simple scripts in the background to generate a list and process the result from user actions. This provide a simple interface to make simple extensions to rofi.

# Usage

To specify a script mode, set a mode with the following syntax: "{name}:{executable}"

For example:

```bash
rofi -show fd -modes "fd:file_browser.sh"
```

The `fb` is just the name you're giving to the custom mode. It's an arbitrary label. So, `fb:file_browser.sh` means "create a mode called `fd`, backed by the script `file_browser.sh`.
