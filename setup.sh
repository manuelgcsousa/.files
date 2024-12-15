#!/bin/bash

HOME_ITEMS=(
  'zshrc'
)

CONFIG_DIRS=(
  'aerospace'
  'alacritty'
  'home-manager'
  'kitty'
  'nvim'
  'tmux'
)

setup_symlinks() {
  for item in "${HOME_ITEMS[@]}"; do
    ln -sfv "$(pwd)/config/$item" "$HOME/.$item"
  done

  for dir in "${CONFIG_DIRS[@]}"; do
    ln -sfv "$(pwd)/config/$dir" "$HOME/.config/$dir"
  done
}

delete_symlinks() {
  for item in "${HOME_ITEMS[@]}"; do
    rm -fv "$HOME/.$item"
  done

  for dir in "${CONFIG_DIRS[@]}"; do
    rm -fv "$HOME/.config/$dir"
  done
}

case $1 in
  -s)
    setup_symlinks
    ;;

  -d)
    delete_symlinks
    ;;

  *)
    echo "Usage: $0 -s (for setup) or -d (for deletion)"
    exit 1
    ;;
esac

