#!/bin/bash

xrandr \
  --output DP-0 --off \
  --output DP-1 --off \
  --output DP-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 165.00 \
  --output DP-3 --off \
  --output HDMI-0 --off \
  --output DP-4 --off \
  --output DP-5 --off
