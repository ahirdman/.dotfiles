#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    set=(
      background.drawing=on
      background.color=$ORANGE
    )

    sketchybar --set $NAME "${set[@]}"
else
    sketchybar --set $NAME background.drawing=off
fi
