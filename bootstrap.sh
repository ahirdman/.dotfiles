#!/bin/sh

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

