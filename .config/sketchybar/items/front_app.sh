#!/usr/bin/env sh
PLUGIN_DIR="$CONFIG_DIR/plugins"

sketchybar --add item front_app left \
           --set front_app script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
