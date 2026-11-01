# Keep only the first occurrence of each PATH entry.
typeset -U PATH path

# export ANDROID_HOME=/Users/ahirdman/Library/Android/sdk
# export PATH=/Users/ahirdman/Library/Android/sdk/platform-tools:$PATH

# Make the existing Node installation available to non-interactive SSH tools.
if [[ -d "$HOME/.n/bin" ]]; then
  export PATH="$HOME/.n/bin:$PATH"
fi

# Native installers such as Claude Code live here. Non-interactive shells and apps need it too.
export PATH="$HOME/.local/bin:$PATH"

# Machine-specific values kept out of git.
[[ -f "$HOME/.config/zsh/env.zsh" ]] && source "$HOME/.config/zsh/env.zsh"
