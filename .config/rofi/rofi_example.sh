#!/usr/bin/env bash

if [ x"$@" = x"quit" ]
then
    exit 0
fi
echo "reload"
echo "quit"

#rofi -show script -modi "script:$HOME/.dotfiles/.config/rofi/rofi_example.sh"
