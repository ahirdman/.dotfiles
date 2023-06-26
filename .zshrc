export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"

export NVM_AUTO_USE=true

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='gruvbox-dark'
export NULLCMD=bat

export HOMEBREW_CASK_OPTS="--no-quarantine"

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

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

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

plugins+=(
zsh-nvm 
zsh-autosuggestions
zsh-syntax-highlighting
zsh-completions
)

source $ZSH/oh-my-zsh.sh

alias trail='<<<${(F)path}'
alias ls="exa -la --icons --git --group-directories-first"
alias lt="exa --tree --level=2 --icons --all --ignore-glob="node_modules" "

alias bbd='brew bundle dump --force'

alias glt='git log --oneline --decorate --graph --all'
alias glta='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias status='git status -s'
alias branch='git branch -v'
alias coa='git add -A && git commit -m'

. /opt/homebrew/etc/profile.d/z.sh

# Eval
eval "$(starship init zsh)"


