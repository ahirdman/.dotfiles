# Shared configurations

### Includes:
- Zsh configuration
- Starship Prompt
- Vim (not configured)
- Neovim - Using NvChad
- Tmux
- Dotbot
- Brewfile and executable
- Window managment with Yabai and Skhdrc
- Git configurations
- Github CLI configurations

## Links:
- Vimrc setuo:
- https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

## Todo:
- [ ] Manage Font installs
- [ ] Remove oh-my-zsh in favor of bare setup
- [ ] Extend aliasas
- [ ] Fix duplications in $PATH
- [ ] Configure Raycast to be managed by Brew
- [ ] HomeBrew - Verify Apple Silicon installs end up in /opt/homebrew as opposed to /usr/local (not the case for docker currently)
- [ ] Uninstall or configure vim
- [ ] Configure remaingin commands from previous bootstrap executable:

```
# NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# .NET
echo " - Installing .NET requirements"
# brew tap omnisharp/omnisharp-roslyn
# brew install omnisharp-mono
dotnet tool install --global csharp-ls

arch -arm64 brew install dapr/tap/dapr-cli

sudo sh -c 'cd $(mktemp -d) \
  && curl -fLO https://github.com/Azure/bicep/releases/latest/download/bicep-langserver.zip \
  && rm -rf /usr/local/bin/bicep-langserver \
  && unzip -d /usr/local/bin/bicep-langserver bicep-langserver.zip'

```
