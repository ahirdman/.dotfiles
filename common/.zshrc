export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='1337'
export NULLCMD=bat
export GH_DASH_CONFIG="$HOME/.config/ghdash/config.yml"

# Editor settings
export EDITOR="nvim"

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

# Settings from the layers stowed on this machine
for layer in ~/.config/zsh-layers/*.zsh(N); do
  source "$layer"
done
unset layer

export POSH_CONFIG="$HOME/.config/ohmyposh/base.toml"
command -v oh-my-posh >/dev/null && eval "$(oh-my-posh init zsh --config "$POSH_CONFIG")"

# Restore the theme if shell tooling clears Oh My Posh's environment variable.
# Oh My Posh calls this hook before rendering each primary prompt.
function set_poshcontext() {
  export POSH_CONFIG="$HOME/.config/ohmyposh/base.toml"
}

command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# Aliases
[[ -f ~/.config/zsh/alias.zsh ]] && source ~/.config/zsh/alias.zsh

# Functions
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh

# Completions
[[ -f ~/.config/zsh/completions.zsh ]] && source ~/.config/zsh/completions.zsh

# Plugins
[[ -f ~/.config/zsh/plugins.zsh ]] && source ~/.config/zsh/plugins.zsh

export PATH="$HOME/.local/bin:$PATH"
