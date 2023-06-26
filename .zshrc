export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='gruvbox-dark'
export NULLCMD=bat

export HOMEBREW_CASK_OPTS="--no-quarantine"

export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

export PATH="$N_PREFIX/bin:$PATH"
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

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
