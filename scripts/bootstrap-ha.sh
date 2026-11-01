#!/usr/bin/env bash
# bootstrap-ha.sh — One-time setup for Home Assistant dev environment
# Run this on the HA Pi after SSH'ing in: ./bootstrap-ha.sh

set -euo pipefail

DATA_DIR="/data"
BIN_DIR="$DATA_DIR/bin"
DOTFILES_DIR="$DATA_DIR/.dotfiles"
REPO="https://github.com/ahirdman/.dotfiles.git"

echo "=== HA Dev Environment Bootstrap ==="
echo ""

# -----------------------------------------------
# 1. Create persistent bin directory
# -----------------------------------------------
echo "[1/8] Creating persistent bin directory..."
mkdir -p "$BIN_DIR"

# -----------------------------------------------
# 2. Install oh-my-posh
# -----------------------------------------------
echo "[2/8] Installing oh-my-posh..."
if [ -f "$BIN_DIR/oh-my-posh" ]; then
  echo "  -> Already installed, skipping."
else
  curl -sSfL https://ohmyposh.dev/install.sh | bash -s -- -d "$BIN_DIR"
fi

# -----------------------------------------------
# 3. Install zoxide
# -----------------------------------------------
echo "[3/8] Installing zoxide..."
if [ -f "$BIN_DIR/zoxide" ]; then
  echo "  -> Already installed, skipping."
else
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh -s -- --bin-dir "$BIN_DIR"
fi

# -----------------------------------------------
# 4. Authenticate with GitHub via gh CLI
# -----------------------------------------------
echo "[4/8] Authenticating with GitHub..."
if gh auth status >/dev/null 2>&1; then
  echo "  -> Already authenticated, skipping."
else
  echo "  -> Follow the prompts to authenticate."
  echo "  -> Choose: SSH protocol, generate a new SSH key, no passphrase"
  gh auth login -h github.com -p ssh
fi

# -----------------------------------------------
# 5. Clone dotfiles
# -----------------------------------------------
echo "[5/8] Cloning dotfiles..."
if [ -d "$DOTFILES_DIR" ]; then
  echo "  -> $DOTFILES_DIR already exists, pulling latest."
  git -C "$DOTFILES_DIR" pull
else
  git clone "$REPO" "$DOTFILES_DIR"
fi

# -----------------------------------------------
# 6. Install Ghostty terminfo
# -----------------------------------------------
echo "[6/8] Installing Ghostty terminfo..."
if infocmp xterm-ghostty >/dev/null 2>&1; then
  echo "  -> Already installed, skipping."
else
  tic -x "$DOTFILES_DIR/scripts/ghostty.terminfo"
  echo "  -> Installed."
fi

# -----------------------------------------------
# 7. Stow dotfiles
# -----------------------------------------------
echo "[7/8] Stowing dotfiles..."

# Backup any existing files that would conflict
[ -f "$HOME/.zprofile" ] && mv "$HOME/.zprofile" "$HOME/.zprofile.bak" 2>/dev/null || true
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak" 2>/dev/null || true
[ -f "$HOME/.zshenv" ] && mv "$HOME/.zshenv" "$HOME/.zshenv.bak" 2>/dev/null || true

# Stow dotfiles, skipping mac-only configs
cd "$DOTFILES_DIR" && source scripts/ha-stow-excludes.sh
stow -t "$HOME" --no-folding "${HA_STOW_EXCLUDES[@]}" .

# -----------------------------------------------
# 8. Install tmux & neovim plugins
# -----------------------------------------------
echo "[8/8] Installing tmux & neovim plugins..."

# TPM
if [ -d "$HOME/.config/tmux/plugins/tpm" ]; then
  echo "  -> TPM already installed."
else
  git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins" || true

# Neovim plugins
echo "  -> Installing neovim plugins (this may take a minute)..."
nvim --headless "+Lazy! restore" +qa 2>/dev/null || true

echo ""
echo "=== Bootstrap complete! ==="
echo ""
echo "Run 'exec zsh' to reload your shell."
echo "Or disconnect and reconnect: ssh ha"
