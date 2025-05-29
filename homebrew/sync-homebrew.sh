#!/bin/bash

echo "Syncing Homebrew setup..."

# Update dotfiles repo
cd ~/dotfiles && git pull

# Restore taps, formulas, and casks
#xargs brew tap <~/dotfiles/homebrew/brew-taps.txt
#xargs brew install <~/dotfiles/homebrew/brew-formulas.txt
#xargs brew install --cask <~/dotfiles/homebrew/brew-casks.txt
#!/bin/bash

# Install Homebrew taps only if not already tapped
while read -r tap; do
  if ! brew tap | grep -q "^$tap\$"; then
    echo "Tapping $tap..."
    brew tap "$tap"
  else
    echo "Tap $tap already exists, skipping."
  fi
done < ~/dotfiles/homebrew/brew-taps.txt

# Install Homebrew formulas only if not already installed
while read -r formula; do
  if ! brew list --formula | grep -q "^$formula\$"; then
    echo "Installing formula $formula..."
    brew install "$formula"
  else
    echo "Formula $formula already installed, skipping."
  fi
done < ~/dotfiles/homebrew/brew-formulas.txt

# Install Homebrew casks only if not already installed
while read -r cask; do
  if ! brew list --cask | grep -q "^$cask\$"; then
    echo "Installing cask $cask..."
    brew install --cask "$cask"
  else
    echo "Cask $cask already installed, skipping."
  fi
done < ~/dotfiles/homebrew/brew-casks.txt


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
