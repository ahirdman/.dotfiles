alias trail='<<<${(F)path}'

alias cat="bat"
alias cl='clear'
alias ..="cd .."
alias ...="cd ../.."

alias ls="eza -la --icons --git --group-directories-first"
alias lt="eza --tree --level=2 --icons --all --ignore-glob="node_modules" "



alias bbd='brew bundle dump --force'
alias bu="brew list | gum choose --no-limit | xargs brew uninstall"

alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias glt='git log --oneline --decorate --graph --all'
alias glta='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias coa='git add -A && git commit -m'
alias gc="clone"
alias gb="switchBranch"
alias gp="git pull"
alias pr="gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout"
alias gclean="git branch | cut -c 3- | gum choose --no-limit | xargs git branch -D"
alias gpick="git log --oneline | gum filter | cut -d' ' -f1 # | copy"

alias ts="tmuxPickSession"
alias tsource="tmux source-file $HOME/.config/tmux/tmux.conf"

alias v="nvim"

alias fp="fzf --preview='bat --style=numbers --color=always --line-range :500 {} '"
