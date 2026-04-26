#!/usr/bin/env bash
control_center_dir="${HOME}/.dotfiles/.config/rofi/control-center/controls"
cd control_center_dir
rofi -show filebrowser -filebrowser-dir "$control_center_dir"
