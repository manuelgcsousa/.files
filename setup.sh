#!/bin/bash

CONFIG_DIR='./config'
DOTFILES=(
  'aerospace'
  'alacritty'
  'home-manager'
  'kitty'
  'nvim'
  'tmux'
  'zsh'
)

if [[ -z $1 ]]; then
  echo "Usage: $0 -s (for setup) or -u (for unsetup)"
  exit 1
fi

if [[ $1 == '-s' ]]; then
  stow -v -t $HOME -d $CONFIG_DIR "${DOTFILES[@]}"
elif [[ $1 == '-u' ]]; then
  stow -v -D -t $HOME -d $CONFIG_DIR "${DOTFILES[@]}"
else
  echo "Invalid flag. Usage: $0 -s (for setup) or -u (for unsetup)"
  exit 1
fi
