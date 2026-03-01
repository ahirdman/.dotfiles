#!/usr/bin/env bash
# ha-init.sh — Runs on every HA Advanced SSH add-on startup
# Add to add-on config: init_commands: ["/data/ha-init.sh"]

set -euo pipefail

DATA_DIR="/data"
DOTFILES_DIR="$DATA_DIR/.dotfiles"
BIN_DIR="$DATA_DIR/bin"
HOME_DIR="/home/hassio"

# Skip if dotfiles haven't been bootstrapped yet
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "[ha-init] Dotfiles not found at $DOTFILES_DIR — run bootstrap-ha.sh first."
  exit 0
fi

echo "[ha-init] Restoring dev environment..."

# Backup default .zprofile if it exists and isn't a symlink
if [ -f "$HOME_DIR/.zprofile" ] && [ ! -L "$HOME_DIR/.zprofile" ]; then
  mv "$HOME_DIR/.zprofile" "$HOME_DIR/.zprofile.ha-default"
fi

# Re-stow dotfiles (ignore .ssh and .config/gh — managed independently on Pi)
cd "$DOTFILES_DIR" && stow -t "$HOME_DIR" --ignore='\.ssh' --ignore='\.config/gh' .

# Install Ghostty terminfo if missing
infocmp -x xterm-ghostty >/dev/null 2>&1 || {
  [ -f "$HOME_DIR/.terminfo/x/xterm-ghostty" ] || {
    TERMINFO="$HOME_DIR/.terminfo" tic -x "$DOTFILES_DIR/scripts/ghostty.terminfo" 2>/dev/null || true
  }
}

echo "[ha-init] Dev environment restored."
