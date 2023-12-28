#!/bin/sh

# keyboard
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 1
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool "true"
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

# dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock

# finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder

# clock
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""

# mission control
defaults write com.apple.dock "expose-group-apps" -bool "true" && killall Dock
