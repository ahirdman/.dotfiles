#!/bin/sh

ICON_PADDING_RIGHT=5

if [ "$SENDER" = "front_app_switched" ]; then
  case $INFO in
    "Arc")
      ICON_PADDING_RIGHT=5
      ICON=
      ;;
    "Alacritty")
      ICON_PADDING_RIGHT=4
      ICON=
      ;;
    "Calendar")
      ICON_PADDING_RIGHT=3
      ICON=
      ;;
    "FaceTime")
      ICON_PADDING_RIGHT=5
      ICON=
      ;;
    "Finder")
      ICON=󰀶
      ;;
    "Messages")
      ICON=
      ;;
    "Preview")
      ICON_PADDING_RIGHT=3
      ICON=
      ;;
    "Slack")
      ICON_PADDING_RIGHT=2
      ICON=
      ;;
    "Spotify")
      ICON_PADDING_RIGHT=2
      ICON=
      ;;
    *)
      ICON_PADDING_RIGHT=2
      ICON=
      ;;
  esac

  sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
  sketchybar --set $NAME.name label="$INFO"

fi
