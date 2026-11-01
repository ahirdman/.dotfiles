# Zsh plugins
if [[ "$OSTYPE" == darwin* ]]; then
  source ${HOMEBREW_PREFIX:-$(brew --prefix)}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ${HOMEBREW_PREFIX:-$(brew --prefix)}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ "$OSTYPE" == linux* ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Fzf
function init_fzf() {
  if [[ "$OSTYPE" == darwin* ]]; then
    source <(fzf --zsh)
  elif [[ "$OSTYPE" == linux* ]]; then
    source /usr/share/zsh/plugins/fzf/fzf.plugin.zsh
  fi
}

init_fzf

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory share_history hist_ignore_all_dups hist_ignore_space extended_history
