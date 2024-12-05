#!/usr/bin/env bash

NOTIFICATIONS="$(gh notify -s)"

if [[ "$NOTIFICATIONS" == "All caught up!" ]]; then
  sketchybar --set "$NAME" label="0" label.highlight=off
else
  RESULT=$(echo "$NOTIFICATIONS" | wc -l | xargs)
  
  sketchybar --set "$NAME" label="$RESULT" label.highlight=on
fi

