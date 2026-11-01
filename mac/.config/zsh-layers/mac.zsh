# Node.js version manager
export N_PREFIX="$HOME/.n"
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

export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!Library/**' --glob '!.git/**' \"\$HOME\""

# LM Studio CLI
export PATH="$PATH:$HOME/.lmstudio/bin"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# opencode
export PATH=$HOME/.opencode/bin:$PATH
