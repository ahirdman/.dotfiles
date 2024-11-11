{config, ...}: {
  programs.home-manager.enable = true;

  home.username = "ahirdman";
  home.homeDirectory = "/Users/ahirdman";
  home.stateVersion = "24.05";

  home.file = {
    ".yabairc".source = config.lib.file.mkOutOfStoreSymlink ../../.yabairc;
    ".skhdrc".source = config.lib.file.mkOutOfStoreSymlink ../../.skhdrc;
    ".config/ohmyposh".source = ./.config/ohmyposh;
    ".config/nvim".source = ./.config/nvim;
    #"dummy.json".source = config.lib.file.mkOutOfStoreSymlink ../../dummy.json;
  };

  imports = [
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
  ];
}
