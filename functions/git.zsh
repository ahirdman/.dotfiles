#!/bin/zsh

function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -s
  fi
}
