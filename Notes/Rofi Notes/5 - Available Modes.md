# Available Modes

## window

Show a list of all the windows and allow switching between them. Pressing the `delete-entry` binding (`shift-delete`) will close the window. Pressing the `accept-custom` binding (`control-enter` or `shift-enter`) will run a command on the window. (See option `window-commmand`),

If there's no match, it will try to launch the input.

## windowcd

Shows a list of the windows on the current desktop and allows switching between them. Pressing the `delete-entry` binding (`shift-delete`) will kill the window. Pressing the `accept-custom` binding (`control-enter` or `shift-enter`) will run a command on the window.

If there's no match, it will try to launch the input.

## run

* Shows a list of executables in `$PATH` and can launch them (optional in a terminal).
* Pressing the `delete-entry` binding (`shift-delete`) will remove this entry from the run history.
* Pressing the `accept-custom` binding (`control-enter`) will run the command as entered in the entry box.
* Pressing the accept-alt binding (`shift-enter`) will run the command in a terminal.

When pressing the `mode-complete` binding (`Control-l`), you can use the File Browser mode to launch the application with a file as the first argument.

## drun

Same as the **run** launches, but the list is created from the installed desktop files. It automatically launches them in a terminal if specified in the Desktop File.

* Pressing the `delete-entry` binding (`shift-delete``) will remove this entry from the run history.
* Pressing the `accept-custom` binding (`control-enter`) will run the command as entered in the entry box.
* Pressing the `accept-alt` binding (`shift-enter`) will run the command in a terminal.

## ssh

Shows a list of SSH targets based on your `ssh` config file, and allows to quickly ssh into them.

## keys

Shows a searchable list of key bindings.

## script

Allows custom scripted Modes to be added, see the rofi-script(5) manpage for more information.

## combi

Combines multiple modes in one list. Specify which modes are included with the `-combi-modes` option.

When using the combi mode, a !bang can be used to filter the results by modes. All modes that match the bang as a prefix are included. For example, say you have specified `-combi-modes run,window,windowcd`. If your query begins with the bang `!w`, only results from the `window` and `windowcd` modes are shown, even if the rest of the input text would match results from run.

If no match, the input is handled by the first combined modes.
