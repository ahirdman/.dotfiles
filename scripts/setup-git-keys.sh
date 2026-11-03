#!/usr/bin/env bash
# Creates this machine's git keys and registers them on GitHub. Safe to run again.
#
# One key per GitHub account per machine, on disk without a passphrase, so git
# can sign and push from SSH sessions and agents with nobody at the keyboard.
# Revoke a lost machine's key on GitHub without touching the others.
#
#   personal  ~/.ssh/git_personal  -> ahirdman
#   work      ~/.ssh/git_work      -> AlexHird
#
# Usage: scripts/setup-git-keys.sh [personal] [work]
# With no arguments the role decides: personal-mac and linux get personal,
# work-mac gets both.
set -euo pipefail

role="$(cat "$HOME/.config/dotfiles-role" 2>/dev/null || true)"
if (($# == 0)); then
  case "$role" in
    work-mac) set -- work personal ;;
    *) set -- personal ;;
  esac
fi

# Macs push over SSH. Linux pushes over HTTPS with gh, so it only needs to sign.
types=(signing)
[[ "$role" == *-mac ]] && types+=(authentication)

host="$(hostname -s)"

for id in "$@"; do
  case "$id" in
    personal) account=ahirdman ;;
    work) account=AlexHird ;;
    *)
      echo "unknown identity: $id (personal or work)" >&2
      exit 1
      ;;
  esac

  key="$HOME/.ssh/git_$id"
  if [[ ! -f "$key" ]]; then
    ssh-keygen -q -t ed25519 -N "" -C "git-$id@$host" -f "$key"
    echo "Created $key"
  fi
  chmod 600 "$key"
  material="$(cut -d' ' -f1-2 "$key.pub")"

  if ! token="$(gh auth token --hostname github.com --user "$account" 2>/dev/null)"; then
    echo "gh is not logged in as $account. Add $key.pub by hand at https://github.com/settings/keys"
    continue
  fi

  for type in "${types[@]}"; do
    endpoint=user/keys
    [[ "$type" == signing ]] && endpoint=user/ssh_signing_keys
    if GH_TOKEN="$token" gh api "$endpoint" --paginate --jq '.[].key' 2>/dev/null | grep -qxF "$material"; then
      echo "$account already has the $type key from $key."
    elif GH_TOKEN="$token" gh ssh-key add "$key.pub" --type "$type" --title "$host ($id)" >/dev/null; then
      echo "Added $key to $account for $type."
    else
      echo "Could not add the $type key to $account. Grant the scope, then run this again:" >&2
      echo "  gh auth switch --user $account && gh auth refresh --scopes admin:public_key,admin:ssh_signing_key" >&2
    fi
  done
done
