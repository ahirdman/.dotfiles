#!/bin/zsh

echo "# Clone Repository with SSH profile: \n" "" | gum format

MODE=$(gum choose  "Work" "Personal")

GIT_URL=$(gum input --placeholder "Repositry url")

REPO=${GIT_URL#*:}

PREFIX=""

if [ "$MODE" = "Work" ]; then
  PREFIX="workgit"
else
  PREFIX="personalgit"
fi

gum confirm "Clone repo?" && git clone $PREFIX:$REPO
