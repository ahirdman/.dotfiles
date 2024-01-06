export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='gruvbox-dark'
export NULLCMD=bat

export HOMEBREW_CASK_OPTS="--no-quarantine"

export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

export ZVM_VI_EDITOR="nvim"
export ZVM_CURSOR_STYLE_ENABLED=false

export PATH="$N_PREFIX/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

export EDITOR="nvim"

export GUM_INPUT_CURSOR_FOREGROUND="#ff6d12"
export GUM_INPUT_PROMPT_FOREGROUND="#fff2eb"
export GUM_INPUT_PLACEHOLDER="..."
export GUM_INPUT_PROMPT=" "
export GUM_INPUT_WIDTH=80

function help() {
    "$@" --help 2>&1 | bat --plain --language=help
}

function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

function cd() {
  builtin cd "$@"

  local nvmrc_file=".nvmrc"

  if [[ -f "$PWD/$nvmrc_file" ]]; then
    local desired_version=$(cat "$PWD/$nvmrc_file")
    local current_version=$(node -v)

    if [[ "$current_version" != "$desired_version" ]]; then
      n auto
    fi
  fi
}

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

alias trail='<<<${(F)path}'
alias ls="exa -la --icons --git --group-directories-first"
alias lt="exa --tree --level=2 --icons --all --ignore-glob="node_modules" "

alias bbd='brew bundle dump --force'

alias glt='git log --oneline --decorate --graph --all'
alias glta='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias status='git status -s'
alias branch='git branch -v'
alias coa='git add -A && git commit -m'

alias gc="~/.dotfiles/functions/git_clone.zsh"
alias ts="~/.dotfiles/functions/tmux_sessions.zsh"
alias gb="~/.dotfiles/functions/git_branch.zsh"

alias tmn="tmuxinator new"
alias tmr="tmuxinator start"
alias tme="tmuxinator edit"
alias tms="tmuxinator stop"
alias tsource="tmux source-file $HOME/.dotfiles/tmux/tmux.conf"

alias v="nvim"
alias vc="NVIM_APPNAME=nvim-custom nvim"

. /opt/homebrew/etc/profile.d/z.sh

# Eval
eval "$(starship init zsh)"
eval EAS_AC_ZSH_SETUP_PATH=/Users/ahirdman/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH;

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# bun completions
[ -s "/Users/ahirdman/.bun/_bun" ] && source "/Users/ahirdman/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
