{config, ...}: {
  programs.home-manager.enable = true;

  home.username = "ahirdman";
  home.homeDirectory = "/Users/ahirdman";
  home.stateVersion = "24.05";

  home.activation = {
    linkMyFiles = config.lib.dag.entryAfter ["writeBoundary"] ''
      ln -s ~/.dotfiles/.yabairc ~/.yabairc
      ln -s ~/.dotfiles/.skhdrc  ~/.skhdrc
      ln -s ~/.dotfiles/.config/ohmyposh ~/.config/ohmyposh
      ln -s ~/.dotfiles/.config/nvim  ~/.config/nvim/
    '';
  };

  home.file = {
    # ".yabairc".source = config.lib.file.mkOutOfStoreSymlink "~/.dotfiles/.yabairc";
    # ".skhdrc".source = config.lib.file.mkOutOfStoreSymlink "~/.dotfiles/.skhdrc";
    # ".config/ohmyposh".source = ./.config/ohmyposh;
    # ".config/nvim".source = ./.config/nvim;
  };

  imports = [
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
  ];
}
