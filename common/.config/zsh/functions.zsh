#Git
function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -s
  fi
}

function switchBranch() {
  local BRANCH=$(git branch -v | gum choose |  awk '{print $1}')

  git switch $BRANCH
}

function clone() {
  echo "# Clone Repository with SSH profile: \n" | gum format
  echo ""

  local MODE=$(gum choose  "Work" "Personal")

  local GIT_URL=$(gum input --placeholder "Repositry url")

  local REPO=${GIT_URL#*:}

  local SSH_HOST=""

  if [ "$MODE" = "Work" ]; then
    SSH_HOST="workgit"
  else
    SSH_HOST="personalgit"
  fi

  gum confirm "Clone repo?" && git clone --bare $SSH_HOST:$REPO
}

function batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# Help pages
function help() {
    "$@" --help 2>&1 | bat --plain --language=help
}

function tmuxPickSession() {
  local SESSION=$(tmux list-sessions -F \#S | gum filter --placeholder "Pick session...");
  tmux switch-client -t $SESSION || tmux attach -t $SESSION
}
