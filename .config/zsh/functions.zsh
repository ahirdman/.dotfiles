#Git
function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -s
  fi
}

function switchBranch() {
  BRANCH=$(git branch -v | gum choose |  awk '{print $1}')

  git switch $BRANCH
}

function clone() {
  echo "# Clone Repository with SSH profile: \n" | gum format
  echo ""

  MODE=$(gum choose  "Work" "Personal")

  GIT_URL=$(gum input --placeholder "Repositry url")

  REPO=${GIT_URL#*:}

  PREFIX=""

  if [ "$MODE" = "Work" ]; then
    PREFIX="workgit"
  else
    PREFIX="personalgit"
  fi

  gum confirm "Clone repo?" && git clone --bare $PREFIX:$REPO
}

function batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# Help pages
function help() {
    "$@" --help 2>&1 | bat --plain --language=help
}

function tmuxPickSession() {
  SESSION=$(tmux list-sessions -F \#S | gum filter --placeholder "Pick session...");
  tmux switch-client -t $SESSION || tmux attach -t $SESSION
}
