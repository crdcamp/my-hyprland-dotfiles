local variables = {
    essentialTools = {
        terminal = "kitty",
        fileManager = "yazi",
        browser = "brave",
        ide = "zeditor",
    },
    rofi = {
        searchApps = "rofi -show drun",
        searchWindows = "rofi -show window",
        selectWallpaper = "~/.dotfiles/.config/rofi/select-wallpaper.sh",
        controlCenter = [[rofi -show control-center -modi "control-center:~/.dotfiles/.config/rofi/control-center.sh"]],
    },
    entertainment = {
        music = "brave https://open.spotify.com/",
        games = "steam",
    },
}

return variables
