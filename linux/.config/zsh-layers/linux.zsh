# Standalone binaries: /data/bin on Home Assistant, ~/.local/bin elsewhere
export PATH="/data/bin:$HOME/.local/bin:$PATH"

# Skip workstation-only Neovim plugins and language servers.
export DOTFILES_LIGHT=1

# Debian and Ubuntu install bat as batcat.
if ! command -v bat >/dev/null && command -v batcat >/dev/null; then
  alias bat="batcat"
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  export NULLCMD=batcat
elif ! command -v bat >/dev/null; then
  unset MANPAGER NULLCMD
fi

# Older distro builds of fzf reject the shared options.
autoload -Uz is-at-least
if ! is-at-least 0.53 "${$(fzf --version)%% *}"; then
  export FZF_DEFAULT_OPTS="--height 40% --layout reverse"
fi
