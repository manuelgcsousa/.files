#!/bin/sh

output="$HOME/Pictures/Screenshots/%Y-%m-%d-%T.png"
chosen=$(printf "Selection\nScreen" | rofi -dmenu -i -p 'Screenshot:' -l 2 -theme $HOME/.config/i3/resources/rofi/config.rasi)

case "$chosen" in
    "Selection")
        scrot "$output" --select --line mode=edge || exit
        ;;

    "Screen")
        scrot "$output" --focused --border || exit
        ;;

    *)
        exit
        ;;
esac

notify-send "Screenshot taken."
