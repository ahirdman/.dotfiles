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

Run `./install.sh` again after adding files. It remembers the role.

## Machine-specific values
Keep these out of git, in `~/.config/zsh/env.zsh`, `~/.ssh/config.local` and `~/.config/git/blocked-values`.

## Links:
**Configure SSH & GitHub Profiles**
- Adding "ssh-add --apple-use-keychain ~/.ssh/id_<id>" correctly set the accounts 
- https://engineeringfordatascience.com/posts/how_to_manage_multiple_git_accounts_on_the_same_machine/
