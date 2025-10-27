#!/bin/sh

timestamp=$(date +"%Y-%m-%d-%T")
output="$HOME/Pictures/Screenshots/$timestamp.png"

choice=$(printf "Selection\nScreen" | rofi -dmenu -i -p 'Screenshot:' -l 2 -theme $HOME/.config/i3/resources/rofi/config.rasi)

case "$choice" in
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

notify-send "Screenshot taken." "Saved to: \"$output\""
