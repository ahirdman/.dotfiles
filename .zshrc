# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

eval $(/opt/homebrew/bin/brew shellenv)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="cloud"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

export NVM_AUTO_USE=true

plugins+=(
zsh-nvm 
zsh-autosuggestions
zsh-syntax-highlighting
zsh-completions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="exa --icons --all --ignore-glob="node_modules" "
alias lt="exa --tree --level=2 --icons --all --ignore-glob="node_modules" "

alias glt='git log --oneline --decorate --graph --all'
alias glta='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias status='git status -s'
alias branch='git branch -v'
alias coa='git add -A && git commit -m'

# NVM Setup on work machine:
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# fpath=($fpath "/Users/hirdman/.zfunctions")

export STARSHIP_CONFIG=~/.dotfiles/starship.toml

eval "$(starship init zsh)"

function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

# Set Starship as ZSH prompt - https://starship.rs/
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

. /opt/homebrew/etc/profile.d/z.sh
