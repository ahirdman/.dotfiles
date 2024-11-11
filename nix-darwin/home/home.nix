{config, ...}: {
  programs.home-manager.enable = true;

  home.username = "ahirdman";
  home.homeDirectory = "/Users/ahirdman";
  home.stateVersion = "24.05";

  home.activation = {
    linkMyFiles = config.lib.dag.entryAfter ["writeBoundary"] ''
      ln -s ${toString ./../../.yabairc} ~/.yabairc
      ln -s ${toString ./../../.skhdrc} ~/.skhdrc
    '';
  };

  home.file = {
    # ".yabairc".source = config.lib.file.mkOutOfStoreSymlink "~/.dotfiles/.yabairc";
    # ".skhdrc".source = config.lib.file.mkOutOfStoreSymlink "~/.dotfiles/.skhdrc";
    ".config/ohmyposh".source = ./.config/ohmyposh;
    ".config/nvim".source = ./.config/nvim;
  };

  imports = [
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
  ];
}
