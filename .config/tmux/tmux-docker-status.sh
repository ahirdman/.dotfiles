#!/usr/bin/env bash
# ~/.local/bin/docker-running.sh
set -euo pipefail

# Silent if docker missing/down
command -v docker >/dev/null 2>&1 || exit 0
docker info >/dev/null 2>&1 || exit 0

n=$(docker info --format '{{.ContainersRunning}}' 2>/dev/null || echo 0)

case "$n" in
  0) exit 0 ;;
  1) docker ps --format '{{.Names}}' 2>/dev/null | head -n1 ;;
  *) echo "$n" ;;
esac

