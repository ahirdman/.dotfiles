# Starship prompt configuration
export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"

# Pager and theme settings
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='gruvbox-dark'
export NULLCMD=bat

# Homebrew settings
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Node.js version manager settings
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
export PATH="$N_PREFIX/bin:$PATH"

# OpenJDK settings
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# Editor settings
export EDITOR="nvim"
export ZVM_VI_EDITOR="nvim"
export ZVM_CURSOR_STYLE_ENABLED=false

# Gum settings
export GUM_INPUT_CURSOR_FOREGROUND="#ff6d12"
export GUM_INPUT_PROMPT_FOREGROUND="#fff2eb"
export GUM_INPUT_PLACEHOLDER="..."
export GUM_INPUT_PROMPT=" "
export GUM_INPUT_WIDTH=80

function batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# FZF Defaults
export FZF_DEFAULT_OPTS='
  --height 40%
  --tmux bottom,40% 
  --layout reverse 

  --color=fg:-1:,fg+:#fbf1c7,bg:-1,bg+:#1F1F1F
  --color=gutter:#000000
  --color=hl:#a9b665,hl+:#e78a4e
  --color=info:#665c54

  --prompt="   "
  --color=prompt:#fbf1c7

  --marker=">"
  --color=marker:#a9b665

  --pointer="" 
  --color=pointer:#e78a4e

  --separator="─"

  --scrollbar="│"
  --color=scrollbar:#665c54
  '

# Homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Source additional scripts and plugins
. /opt/homebrew/etc/profile.d/z.sh

# Starship prompt initialization
eval "$(starship init zsh)"
eval EAS_AC_ZSH_SETUP_PATH=/Users/ahirdman/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH;

# Zsh plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Zsh Custom functions
source $HOME/.dotfiles/functions/git.zsh
source $HOME/.dotfiles/functions/help.zsh
source $HOME/.dotfiles/functions/cd.zsh

# Custom initialization function
function init_fzf() {
  source <(fzf --zsh)

  HISTFILE=~/.zsh_history
  HISTSIZE=10000
  SAVEHIST=10000

  setopt appendhistory
}

export FZF_DEFAULT_COMMAND='find ~ -type f \( -path "~/Library/*" \) -prune -o -print'

zvm_after_init_commands+=(init_fzf)

# Bun completions
[ -s "/Users/ahirdman/.bun/_bun" ] && source "/Users/ahirdman/.bun/_bun"

# Bun settings
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$HOME/.maestro/bin"

# Aliases
alias trail='<<<${(F)path}'

alias ls="exa -la --icons --git --group-directories-first"
alias lt="exa --tree --level=2 --icons --all --ignore-glob="node_modules" "

alias bbd='brew bundle dump --force'

alias glt='git log --oneline --decorate --graph --all'
alias glta='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias branch='git branch -v'
alias coa='git add -A && git commit -m'
alias gc="~/.dotfiles/functions/git_clone.zsh"
alias gb="~/.dotfiles/functions/git_branch.zsh"
alias gp="git pull"

alias ts="~/.dotfiles/functions/tmux_sessions.zsh"
alias tmn="tmuxinator new"
alias tmr="tmuxinator start"
alias tme="tmuxinator edit"
alias tms="tmuxinator stop"
alias tsource="tmux source-file $HOME/.dotfiles/tmux/tmux.conf"

alias v="nvim"

alias fp="fzf --preview='bat --style=numbers --color=always --line-range :500 {} '"
