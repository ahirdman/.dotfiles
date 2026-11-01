#!/bin/bash
# Sizes the iOS Simulator tile to 1/3 of the workspace width when it shares
# the screen with other windows. Skips resizing when it is the only window.
set -euo pipefail

WID="${AEROSPACE_WINDOW_ID:-}"
if [ -z "$WID" ]; then
  exit 0
fi

sleep 0.5

WS=$(aerospace list-windows --all --format '%{window-id} %{workspace}' \
  | awk -v id="$WID" '$1 == id { print $2 }' \
  | head -1)
if [ -z "$WS" ]; then
  exit 0
fi

COUNT=$(aerospace list-windows --workspace "$WS" --count)
if [ "$COUNT" -le 1 ]; then
  exit 0
fi

WIDTH=$(/usr/bin/swift -e 'import CoreGraphics; print(Int(CGDisplayBounds(CGMainDisplayID()).width))' 2>/dev/null)
if [ -z "$WIDTH" ] || [ "$WIDTH" -le 0 ]; then
  exit 0
fi

aerospace resize --window-id "$WID" smart $((WIDTH / 3))
