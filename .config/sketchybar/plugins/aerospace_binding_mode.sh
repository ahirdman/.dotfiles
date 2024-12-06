#!/usr/bin/env sh

if [ "$ACTIVE_MODE" == "service" ]; then
  sketchybar --set space.mode label="service"
else
  sketchybar --set space.mode label="main"
fi
