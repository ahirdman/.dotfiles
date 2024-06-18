#!/bin/zsh

function cd() {
  builtin cd "$@"

  local nvmrc_file=".nvmrc"

  if [[ -f "$PWD/$nvmrc_file" ]]; then
    local desired_version=$(cat "$PWD/$nvmrc_file")
    local current_version=$(node -v)

    if [[ "$current_version" != "$desired_version" ]]; then
      n auto
    fi
  fi
}
