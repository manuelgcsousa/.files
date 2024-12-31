#!/bin/bash

#
# Settings
#

# move windows by holding 'ctrl+cmd' and dragging any part of the window
defaults write -g NSWindowShouldDragOnGesture -bool true

# show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# remove the auto-hiding Dock delay \
# remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# set Dock icon size
defaults write com.apple.dock "tilesize" -int "38"

# disable recents apps on Dock
defaults write com.apple.dock show-recents -bool false

# group windows by application
defaults write com.apple.dock expose-group-apps -bool true


#
# Restart apps
#

killall "Finder" &> /dev/null
killall "Dock" &> /dev/null
