#!/bin/sh

choices="printf '  Power Off\n  Reboot\n  Lock\n󰍃  Logout'"
selection="rofi -dmenu -i -p 'Run:' -l 4 -theme $HOME/.config/i3/resources/rofi/config.rasi"

chosen=$(eval "$choices | $selection")

case "$chosen" in
  "  Power Off")
    poweroff
    ;;

  "  Reboot")
    reboot
    ;;

  "  Lock")
    i3lock -c 1C1C1C
    ;;

  "󰍃  Logout")
    i3-msg exit
    ;;

  *)
    exit 1
    ;;
esac
