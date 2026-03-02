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

# Re-stow dotfiles (skip mac-only configs)
cd "$DOTFILES_DIR" && stow -t "$HOME_DIR" --no-folding \
  --ignore='\.ssh' \
  --ignore='Brewfile' \
  --ignore='\.actrc' \
  --ignore='\.taplo\.toml' \
  --ignore='aerospace' \
  --ignore='gh$' \
  --ignore='ghdash' \
  --ignore='ghostty' \
  --ignore='github-copilot' \
  --ignore='opencode' \
  --ignore='rainfrog' \
  --ignore='sketchybar' \
  --ignore='tmuxinator' \
  .

# Install tmux plugins if TPM exists but plugins are missing
TPM_DIR="$DOTFILES_DIR/.config/tmux/plugins/tpm"
if [ -x "$TPM_DIR/bin/install_plugins" ]; then
  PLUGIN_COUNT=$(ls -d "$DOTFILES_DIR/.config/tmux/plugins"/*/ 2>/dev/null | wc -l)
  if [ "$PLUGIN_COUNT" -le 1 ]; then
    echo "[ha-init] Installing tmux plugins..."
    "$TPM_DIR/bin/install_plugins" || true
  fi
fi

# Install Ghostty terminfo if missing
infocmp -x xterm-ghostty >/dev/null 2>&1 || {
  [ -f "$HOME_DIR/.terminfo/x/xterm-ghostty" ] || {
    TERMINFO="$HOME_DIR/.terminfo" tic -x "$DOTFILES_DIR/scripts/ghostty.terminfo" 2>/dev/null || true
  }
}

echo "[ha-init] Dev environment restored."
