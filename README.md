# Shared configurations

Preferences only. Secrets and connection details stay out of this repo, and a
pre-commit hook blocks them.

## Layers
| Layer | Contents |
|---|---|
| `common` | zsh, git, tmux, Neovim, prompt |
| `mac` | window manager, terminal, status bar, SSH, opencode |
| `linux` | server settings for sisu and Home Assistant |
| `work` | work preferences and the default work git identity |

## Setup
1. `./install.sh personal-mac`, `./install.sh work-mac` or `./install.sh linux`
2. On Mac, `opencode auth login` for providers. Credentials stay in opencode's store.
3. On a new Linux server, run `scripts/bootstrap-linux.sh` instead.
4. Run `scripts/setup-git-keys.sh` for this machine's git keys. Commits are signed, so git fails until it has run.

Run `./install.sh` again after adding files. It remembers the role.

## Machine-specific values
Keep these out of git, in `~/.config/zsh/env.zsh`, `~/.ssh/config.local` and `~/.config/git/blocked-values`.

## Git keys
Each machine has its own key per GitHub account: `~/.ssh/git_personal` and, on
the work Mac, `~/.ssh/git_work`. They stay on disk outside 1Password, so git can
sign and push over SSH sessions and agents without Touch ID. Macs use them for
pushing too, and Linux pushes over HTTPS with `gh`. Other SSH hosts still go
through 1Password. If a machine is lost, revoke its keys at
https://github.com/settings/keys.
