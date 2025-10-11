#!/bin/sh

timestamp=$(date +"%Y-%m-%d-%T")
output="$HOME/Pictures/Screenshots/$timestamp.png"

choice=$(printf "Selection\nScreen" | walker --dmenu -p "Screenshot...")

case "$choice" in
  "Selection")
    grim -g "$(slurp)" "$output" \
      && wl-copy --type image/png < "$output" \
      || exit
    ;;

  "Screen")
    grim "$output" \
      && wl-copy --type image/png < "$output" \
      || exit
    ;;

  *)
    exit
    ;;
esac

notify-send "Screenshot taken." "Saved to: \"$output\""
