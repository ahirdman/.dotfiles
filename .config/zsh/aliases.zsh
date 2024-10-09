alias trail='<<<${(F)path}'

alias ls="eza -la --icons --git --group-directories-first"
alias lt="eza --tree --level=2 --icons --all --ignore-glob="node_modules" "

alias bbd='brew bundle dump --force'
alias bu="brew list | gum choose --no-limit | xargs brew uninstall"

alias glt='git log --oneline --decorate --graph --all'
alias glta='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias branch='git branch -v'
alias coa='git add -A && git commit -m'
alias gc="clone"
alias gb="switchBranch"
alias gp="git pull"
alias pr="gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout"
alias gclean="git branch | cut -c 3- | gum choose --no-limit | xargs git branch -D"
alias gpick="git log --oneline | gum filter | cut -d' ' -f1 # | copy"

alias ts="tmuxPickSession"
alias tmn="tmuxinator new"
alias tmr="tmuxinator start"
alias tme="tmuxinator edit"
alias tms="tmuxinator stop"
alias tsource="tmux source-file $HOME/.config/tmux/tmux.conf"

alias v="nvim"

alias fp="fzf --preview='bat --style=numbers --color=always --line-range :500 {} '"

alias cl='clear'

### Work related
alias az-sub-id="az account list --query '[?isDefault].id' --output tsv"
