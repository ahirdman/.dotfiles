{config, ...}: {
  programs.home-manager.enable = true;

  home.username = "ahirdman";
  home.homeDirectory = "/Users/ahirdman";
  home.stateVersion = "24.05";

  home.activation = {
    linkMyFiles = config.lib.dag.entryAfter ["writeBoundary"] ''
      ln -sf ~/.dotfiles/.config/aerospace ~/.config/aerospace
      ln -sf ~/.dotfiles/.config/ohmyposh ~/.config/ohmyposh
      ln -sf ~/.dotfiles/.config/nvim  ~/.config/nvim
    '';
  };

  home.file = {
    ".actrc".text = ''
      -P ubuntu-latest=catthehacker/ubuntu:act-latest
      -P ubuntu-22.04=catthehacker/ubuntu:act-22.04
      -P ubuntu-20.04=catthehacker/ubuntu:act-20.04
      -P ubuntu-18.04=catthehacker/ubuntu:act-18.04

      --container-architecture linux/amd64
    '';

    # ".skhdrc".source = config.lib.file.mkOutOfStoreSymlink "~/.dotfiles/.skhdrc";

    # ".config/ohmyposh".source = ./.config/ohmyposh;
  };

  imports = [
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
  ];
}
