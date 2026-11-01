#!/usr/bin/env bash
# One-time setup for a Debian or Ubuntu server. Run from a clone at ~/.dotfiles.
set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

sudo apt-get update -qq
sudo apt-get install -y -qq zsh stow bat zoxide zsh-autosuggestions zsh-syntax-highlighting

mkdir -p "$HOME/.local/bin"
command -v oh-my-posh >/dev/null || [ -x "$HOME/.local/bin/oh-my-posh" ] ||
  curl -sSfL https://ohmyposh.dev/install.sh | bash -s -- -d "$HOME/.local/bin"

infocmp xterm-ghostty >/dev/null 2>&1 || tic -x "$dir/scripts/ghostty.terminfo"

"$dir/install.sh" linux

tpm="$HOME/.config/tmux/plugins/tpm"
[ -d "$tpm" ] || git clone -q https://github.com/tmux-plugins/tpm "$tpm"
"$tpm/bin/install_plugins" >/dev/null || true

nvim --headless "+Lazy! restore" +qa 2>/dev/null || true

echo "Done. Change the login shell with: sudo chsh -s \"\$(command -v zsh)\" \"\$USER\""
