#!/bin/zsh

SESSION=$(tmux ls -F \#S)

if [ -z "$SESSION" ]; then
  NEW_SESSION=$(gum input --placeholder "new session:")
  tmux new-session -d -s $NEW_SESSION
  SESSION=$NEW_SESSION
else
  gum choose $SESSION
fi

tmux switch-client -t $SESSION || tmux attach -t $SESSION
