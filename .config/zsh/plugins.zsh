# Zsh plugins
if [[ "$OSTYPE" == darwin* ]]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

  HISTFILE=~/.zsh_history
  HISTSIZE=10000
  SAVEHIST=10000

  setopt appendhistory
}

init_fzf

zvm_after_init_commands+=(init_fzf)
