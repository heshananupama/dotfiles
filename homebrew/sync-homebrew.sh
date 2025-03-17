#!/bin/bash

echo "Syncing Homebrew setup..."

# Update dotfiles repo
cd ~/dotfiles && git pull

# Restore taps, formulas, and casks
xargs brew tap <~/dotfiles/homebrew/brew-taps.txt
xargs brew install <~/dotfiles/homebrew/brew-formulas.txt
xargs brew install --cask <~/dotfiles/homebrew/brew-casks.txt

# Save new state
brew tap >~/dotfiles/homebrew/brew-taps.txt
brew list --formula >~/dotfiles/homebrew/brew-formulas.txt
brew list --cask >~/dotfiles/homebrew/brew-casks.txt

# Commit and push changes
cd ~/dotfiles
git add homebrew/*
git commit -m "Auto-update Homebrew package lists"
git push

echo "Homebrew sync complete!"
