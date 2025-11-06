#!/bin/sh

timestamp=$(date +"%Y-%m-%d-%T")
output="$HOME/Pictures/Screenshots/$timestamp.png"

choice=$(printf "Selection\nScreen\nColor" | fuzzel --lines 3 --width 40 --dmenu --prompt "Capture: ")

case "$choice" in
  "Selection")
    grim -g "$(slurp)" "$output" && wl-copy --type image/png < "$output" || exit
    notify-send "Screenshot taken." "Saved to: \"$output\""
    ;;

  "Screen")
    grim "$output" && wl-copy --type image/png < "$output" || exit
    notify-send "Screenshot taken." "Saved to: \"$output\""
    ;;

  "Color")
    color=$(hyprpicker -a)
    [ -n "$color" ] && notify-send "Color picked: $color"
    ;;

  *)
    exit
    ;;
esac
