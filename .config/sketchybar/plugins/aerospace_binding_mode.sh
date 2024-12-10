#!/usr/bin/env sh

if [ "$ACTIVE_MODE" == "service" ]; then
  sketchybar --set mode label="service"
else
  sketchybar --set mode label="main"
fi
