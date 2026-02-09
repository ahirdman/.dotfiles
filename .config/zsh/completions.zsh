
# Homebrew completions ???
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

#  Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
