{config, ...}: {
  programs.home-manager.enable = true;

  home.username = "ahirdman";
  home.homeDirectory = "/Users/ahirdman";
  home.stateVersion = "24.05";
  home.sessionPath = [
    "/run/current-system/sw/bin"
    "$HOME/.nix-profile/bin"
  ];
  home.file = {
    #".yabairc".source = ./../dummy.json;
    #".yabairc".source = ./../../.dotfiles/.yabairc;
    ".config/ohmyposh".source = ./.config/ohmyposh;
    ".config/nvim".source = ./.config/nvim;
    "dummy.json".source = config.lib.file.mkOutOfStoreSymlink "~/.config/";
  };

  imports = [
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
  ];
}
