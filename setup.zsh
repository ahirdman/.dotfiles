#!/bin/zsh

source_directory="$HOME/.dotfiles/fonts"
target_directory="$HOME/Library/Fonts"

for file in "${source_directory}"/*; do
  if [[ -f "$file" ]]; then
    filename=$(basename "$file")
    if [[ ! -e "${target_directory}/${filename}" ]]; then
      cp "$file" "$target_directory"
      echo "Installed ${filename}"
    else
      echo "${filename} already installed in ${target_directory}"
    fi
  fi
done

if exists brew
then
  echo " - Homebrew is already installed."
else
  echo " - Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if exists node
then
  echo " - Node $(node -v) & NPM $(npm -v) already installed"
else
  echo " - Installing Node & NPM with n"
  n 20.17.0
fi
