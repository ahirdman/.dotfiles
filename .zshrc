export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='1337'
export NULLCMD=bat
export GH_DASH_CONFIG="$HOME/.config/ghdash/config.yml"

# Editor settings
export EDITOR="nvim"
export ZVM_VI_EDITOR="nvim"
export ZVM_CURSOR_STYLE_ENABLED=false
export ZVM_VI_ESCAPE_BINDKEY="jj"

# Gum settings
export GUM_INPUT_CURSOR_FOREGROUND="#ff6d12"
export GUM_INPUT_PROMPT_FOREGROUND="#fff2eb"
export GUM_INPUT_PLACEHOLDER="..."
export GUM_INPUT_PROMPT=" "
export GUM_INPUT_WIDTH=80

# Rainfrog settings
export RAINFROG_CONFIG=~/.config/rainfrog

# FZF Defaults
export FZF_DEFAULT_OPTS='
  --height 40%
  --tmux bottom,40% 
  --layout reverse 

  --color=fg:-1:,fg+:#fbf1c7,bg:-1,bg+:#1F1F1F
  --color=gutter:#121212
  --color=hl:#a9b665,hl+:#e78a4e
  --color=info:#665c54

  --prompt="   "
  --color=prompt:#fbf1c7

  --marker=">"
  --color=marker:#a9b665

  --pointer="" 
  --color=pointer:#e78a4e

  --separator="─"

  --scrollbar="│"
  --color=scrollbar:#665c54
  '

# macOS-specific settings
if [[ "$OSTYPE" == darwin* ]]; then
  export HOMEBREW_CASK_OPTS="--no-quarantine"

  # Node.js version manager
  export N_PREFIX="$HOME/.n"
  export PREFIX="$N_PREFIX"
  export PATH="$N_PREFIX/bin:$PATH"

  # Postgres
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

  # OpenJDK
  export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

  # Bun
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  export PATH="$PATH:$HOME/.maestro/bin"

  # Go Executables
  export PATH=$PATH:$HOME/go/bin

  export FZF_DEFAULT_COMMAND='find ~ -type f \( -path "~/Library/*" \) -prune -o -print'

  # LM Studio CLI
  export PATH="$PATH:$HOME/.lmstudio/bin"

  # bun completions
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

  # opencode
  export PATH=$HOME/.opencode/bin:$PATH
fi

# Linux-specific settings
if [[ "$OSTYPE" == linux* ]]; then
  # Standalone binaries installed to /data/bin
  export PATH="/data/bin:$PATH"
fi

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"
eval "$(zoxide init zsh)"

# Aliases
[[ -f ~/.config/zsh/alias.zsh ]] && source ~/.config/zsh/alias.zsh

# Functions
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh

# Completions
[[ -f ~/.config/zsh/completions.zsh ]] && source ~/.config/zsh/completions.zsh

# Plugins
[[ -f ~/.config/zsh/plugins.zsh ]] && source ~/.config/zsh/plugins.zsh


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/alexander.hirdman/.lmstudio/bin"
# End of LM Studio CLI section

