#!/usr/bin/env sh
PLUGIN_DIR="$CONFIG_DIR/plugins"

sketchybar --add event aerospace_binding_mode 

set=(
    background.corner_radius=5
    background.height=20
    label.padding_left=0
    label.padding_right=10
    script="$PLUGIN_DIR/aerospace_binding_mode.sh"
  )

sketchybar  --add item mode left \
            --subscribe mode aerospace_binding_mode \
            --set mode "${set[@]}"
