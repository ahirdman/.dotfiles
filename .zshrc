eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"
eval EAS_AC_ZSH_SETUP_PATH=/Users/ahirdman/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH;

# Pager and theme settings
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='1337'
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

export FZF_DEFAULT_COMMAND='find ~ -type f \( -path "~/Library/*" \) -prune -o -print'

# Bun settings
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$HOME/.maestro/bin"

# Go Executables
export PATH=$PATH:/Users/hirdman/go/bin

# Aliases
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh

# Functions
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh

# Completions
[[ -f ~/.config/zsh/completions.zsh ]] && source ~/.config/zsh/completions.zsh

# Plugins
[[ -f ~/.config/zsh/plugins.zsh ]] && source ~/.config/zsh/plugins.zsh

# pnpm config
export PNPM_HOME="/Users/ahirdman/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
