
# Homebrew completions ???
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

#  Bun completions -FIX: No directory ahirdman or _bun
[ -s "/Users/ahirdman/.bun/_bun" ] && source "/Users/ahirdman/.bun/_bun"
