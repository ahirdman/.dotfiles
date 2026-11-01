# Homebrew completions
if [[ -n "$HOMEBREW_PREFIX" ]] || type brew &>/dev/null; then
  FPATH=${HOMEBREW_PREFIX:-$(brew --prefix)}/share/zsh-completions:$FPATH
fi

# Rebuild the completion cache at most once a day.
autoload -Uz compinit
_stale_compdump=(${ZDOTDIR:-$HOME}/.zcompdump(N.mh+24))
if (( ${#_stale_compdump} )) || [[ ! -e ${ZDOTDIR:-$HOME}/.zcompdump ]]; then
  compinit
else
  compinit -C
fi
unset _stale_compdump
