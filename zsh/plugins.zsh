source ./zsh-autosuggestions/zsh-autosuggestions.zsh

source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ./opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Source additional scripts and plugins
. /opt/homebrew/etc/profile.d/z.sh

# Fzf Has to be initialized after zsh-vi-mode
function init_fzf() {
  source <(fzf --zsh)

  HISTFILE=~/.zsh_history
  HISTSIZE=10000
  SAVEHIST=10000

  setopt appendhistory
}

zvm_after_init_commands+=(init_fzf)
