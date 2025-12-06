#!/usr/bin/env bash

PROFILE="nix"

case "$1" in
  -i) nix profile add ".#default" ;;
  -u) nix profile upgrade "$PROFILE" ;;
  -r) nix profile remove "$PROFILE" ;;
  *) exit 1 ;;
esac
