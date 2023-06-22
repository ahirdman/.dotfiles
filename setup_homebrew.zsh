#!/bin/zsh

if ! command -v brew &> /dev/null
then
    echo " - Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo " - Homebrew is already installed."
fi

brew bundle --verbose
