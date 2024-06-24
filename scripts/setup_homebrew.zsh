#!/bin/zsh

if exists brew
then
  echo " - Homebrew is already installed."
else
  echo " - Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose
