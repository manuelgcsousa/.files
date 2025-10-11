#!/bin/sh

# Options
POWEROFF="   Power Off"
REBOOT="   Reboot"
LOCK="   Lock"
LOGOUT="󰍃   Logout"

# Build choices string
choices=$(printf "%s\n%s\n%s\n%s\n%s" \
  "$POWEROFF" \
  "$REBOOT" \
  "$LOCK" \
  "$LOGOUT")

# Get choice
choice=$(printf "%s" "$choices" | walker --dmenu -p 'Run...')

case "$choice" in
  "$POWEROFF")
    poweroff
    ;;

  "$REBOOT")
    reboot
    ;;

  "$LOCK")
    swaylock \
      -c "000000" \
      --font "Fira Sans Regular" \
      --indicator-idle-visible \
      --indicator-radius 100 \
      --indicator-thickness 15
    ;;

  "$LOGOUT")
    swaymsg exit
    ;;

  *)
    exit 1
    ;;
esac
