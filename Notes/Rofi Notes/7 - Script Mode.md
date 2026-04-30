# Script Mode

rofi supports modes that use simple scripts in the background to generate a list and process the result from user actions. This provide a simple interface to make simple extensions to rofi.

# Usage

To specify a script mode, set a mode with the following syntax: "{name}:{executable}"

For example:

```bash
rofi -show fd -modes "fd:file_browser.sh"
```

The name should be unique.

The `fb` is just the name you're giving to the custom mode. It's an arbitrary label. So, `fb:file_browser.sh` means "create a mode called `fd`, backed by the script `file_browser.sh`".

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

This shows two entries, reload and quit.

See bash's [Special Parameters](https://tiswww.case.edu/php/chet/bash/bashref.html#Special-Parameters) for more details on `$@`. In short, `$@` expands to the positional parameters, starting from one. It's a shell scripting guard against empty/unset variables breaking string comparisons.

# Environment

Rofi sets the following environment variable when executing the script:

## ROFI_RETV

An integer number with the current state:

* **0**: Initial call of script
* **1**: Selected an entry
* **2**: Selected a custom entry
* **3**: Deleted an entry
* **10-28**: Custom keybinding 1-19 (Need to be explicitly enabled by script)

## ROFI_INFO

Environment get set when selected entry get set with the property value of the `info` row option, if set.

## ROFI_DATA

Environment get set when script sets **data** option in header.

# Passing Mode Options

Extra options, like setting the prompt, can be set by the sctips. Extra options are lines that start with a NULL character (\0) followed by a key, separator (\x1f) and value.

For example, to set the prompt:

```bash
echo -en "\0prompt\x1fChange prompt\n"
```

The following extra options exist:

* **prompt**: Update the prompt text
* **message**: Update the message text
* **markup-rows**: If `true`, renders markup in the row
*  **data**: Passed data to the next execution of the script via **ROFI_DATA**

## Parsing Row Options

Extra options for individual rows can be set. The extra option can be specified following the same syntax as mode option, but following the entry.

For example:

```bash
echo -en "aap\0icon\x1ffolder\n"
```

The following options are supported:

* **icon**: Set the icon for that row
* **display**: Replace the displayed string (Original string will still be used for filtering)
* **meta**: Specify invisible search terms used for filtering
* **nonselectable**: If true the row cannot be activated
* **permanent**: If true the row always shows, independent of filter.
* **info**: Info that, on selection, gets placed in the **ROFI_INFO** environment variable. This entry doesn't get searched for filtering.
* **urgent**: Set urgent flag on entry (true/false)
* **active**: Set active flag on entry (true/false)

Multiple entries can be passed using the **\x1f** separator.

```bash
echo -en "aap\0icon\x1ffolder\x1finfo\x1ftest\n"
```

# Script Locations
