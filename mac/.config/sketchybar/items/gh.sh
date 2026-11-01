#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

PLUGIN_DIR="$CONFIG_DIR/plugins"

item=(
  update_freq=60
  icon=  
  label.highlight_color="$ORANGE" 
  script="$PLUGIN_DIR/gh.sh"
)

sketchybar  --add item github center \
            --set github "${item[@]}"
