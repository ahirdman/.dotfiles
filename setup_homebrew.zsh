#!/bin/zsh

echo "\n --- Starting HomeBrew Setup ---\n"

if exists brew
then
  echo " - Homebrew is already installed."
else
  echo " - Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "\n --- Installing and upgrading all dependencies from the Brewfile ---\n"

brew bundle --verbose
