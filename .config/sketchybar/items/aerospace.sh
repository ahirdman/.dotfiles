#!/usr/bin/env sh
PLUGIN_DIR="$CONFIG_DIR/plugins"
FONT="BerkeleyMono Nerd Font Propo"

sketchybar --add event aerospace_workspace_change
  
for sid in $(aerospace list-workspaces --all); do
  set=(
    background.corner_radius=5
    background.height=20
    label.padding_left=0
    label.padding_right=1
    label.highlight_color="$ORANGE" 
    label="●"
    label.font="$FONT:Bold:26.0"
    click_script="aerospace workspace $sid"
    script="$PLUGIN_DIR/aerospace.sh $sid"
  )

  sketchybar  --add item space.$sid left \
              --subscribe space.$sid aerospace_workspace_change \
              --set space.$sid "${set[@]}"
done
