#!/bin/zsh

SESSION=$(tmux ls -F \#S)

if [ -z "$SESSION" ]; then
  NEW_SESSION=$(gum input --placeholder "new session:")
  exec tmux new-session -s $NEW_SESSION
else
  gum choose $SESSION
  tmux switch-client -t $SESSION || tmux attach -t $SESSION
fi

