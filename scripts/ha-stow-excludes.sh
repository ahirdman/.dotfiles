# Mac-only configs skipped when stowing on Home Assistant. Sourced by bootstrap-ha.sh and ha-init.sh.
# shellcheck shell=bash disable=SC2034
HA_STOW_EXCLUDES=(
  --ignore='\.ssh'
  --ignore='Brewfile'
  --ignore='\.actrc'
  --ignore='\.taplo\.toml'
  --ignore='aerospace'
  --ignore='gh$'
  --ignore='ghdash'
  --ignore='ghostty'
  --ignore='github-copilot'
  --ignore='opencode'
  --ignore='rainfrog'
  --ignore='sketchybar'
  --ignore='tmuxinator'
)
