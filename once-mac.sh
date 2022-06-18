#!/bin/bash
# Commands to run to set up a new mac

# keyboard repeat
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2

# Don't write .DS_Store files on network mounts
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

