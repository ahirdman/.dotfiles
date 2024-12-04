#!/usr/bin/env sh
PLUGIN_DIR="$CONFIG_DIR/plugins"

# Some items refresh on a fixed cycle, e.g. the clock runs its script once
# every 10s. Other items respond to events they subscribe to, e.g. the
# volume.sh script is only executed once an actual change in system audio
# volume is registered. More info about the event system can be found here:
# https://felixkratz.github.io/SketchyBar/config/events

sketchybar --add item clock right \
           --set clock update_freq=10 icon=  script="$PLUGIN_DIR/clock.sh" \
