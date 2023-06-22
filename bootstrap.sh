#!/bin/sh

if ! command -v brew &> /dev/null
then
    echo " - Homebrew not found. Installing Homebrew..."
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo " - Homebrew is already installed."
fi

packages=(
# Nvim / Vim
neovim
ripgrep
lazygit

# Terminal
gh
exa
starship
tmux
bat
z

# Android Emulator
# openjdk@17

# DevOps
# docker
# docker-buildx
ngrok/ngrok/ngrok


# arch -arm64 brew install --cask docker
)

echo " - Installing formulas..."

for package in "${packages[@]}"
do
  if brew list "$package" >/dev/null 2>&1; then
    echo "$package is already installed."
  else
    echo "Installing $package..."
    brew install $package
  fi
done

# casks=(
# iTerm2
# raycast 
# Spotify
# Postman
# Obsidian
# Mozilla Firefox
# insomnia
# dotnet-sdk
# )

# echo " - Installing casks..."

# for cask in "${casks[@]}"
# do
#   if brew list --cask "$cask" 2>&1 | grep -q "Error: No installed cask" ; then
#     echo "$cask is already installed."
#   else
#     echo "Installing $cask..."
#     brew install --cask $cask
#   fi
# done

# TODO - Fonts

# Clean up
echo " - Cleaning up Homebrew..."
brew cleanup

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

