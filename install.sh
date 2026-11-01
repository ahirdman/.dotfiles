#!/usr/bin/env bash
# Links the layers for this machine into $HOME. The role is remembered per machine.
set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
role_file="$HOME/.config/dotfiles-role"
role="${1:-$(cat "$role_file" 2>/dev/null || true)}"

case "$role" in
  personal-mac) layers=(common mac personal) ;;
  work-mac) layers=(common mac work) ;;
  linux) layers=(common linux) ;;
  *)
    echo "usage: $0 personal-mac|work-mac|linux" >&2
    exit 1
    ;;
esac

# Real directories, so stow never links ~/.ssh or ~/.config into the repo.
mkdir -p "$HOME/.config" "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

stow --dir="$dir" --target="$HOME" --restow "${layers[@]}"
printf '%s\n' "$role" >"$role_file"
echo "Linked ${layers[*]} for $role."
