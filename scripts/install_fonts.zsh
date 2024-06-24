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

