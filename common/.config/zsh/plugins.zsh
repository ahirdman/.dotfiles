# Zsh plugins
function source_first() {
  local file
  for file in "$@"; do
    if [[ -r "$file" ]]; then
      source "$file"
      return
    fi
  done
}

if [[ "$OSTYPE" == darwin* ]]; then
  source ${HOMEBREW_PREFIX:-$(brew --prefix)}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ${HOMEBREW_PREFIX:-$(brew --prefix)}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ "$OSTYPE" == linux* ]]; then
  source_first /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source_first /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Fzf
function init_fzf() {
  if fzf --zsh >/dev/null 2>&1; then
    source <(fzf --zsh)
  else
    source_first /usr/share/doc/fzf/examples/key-bindings.zsh /usr/share/zsh/plugins/fzf/fzf.plugin.zsh
    source_first /usr/share/doc/fzf/examples/completion.zsh
  fi
}

init_fzf

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory share_history hist_ignore_all_dups hist_ignore_space extended_history
