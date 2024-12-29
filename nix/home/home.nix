{config, ...}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  programs.home-manager.enable = true;

  home = {
    username = "ahirdman";
    homeDirectory = "/Users/ahirdman";
    stateVersion = "24.05";

    file = {
      ".actrc".text = ''
        -P ubuntu-latest=catthehacker/ubuntu:act-latest
        -P ubuntu-22.04=catthehacker/ubuntu:act-22.04
        -P ubuntu-20.04=catthehacker/ubuntu:act-20.04
        -P ubuntu-18.04=catthehacker/ubuntu:act-18.04

        --container-architecture linux/amd64
      '';
    };
  };

  xdg = {
    enable = true;
    configFile = {
      nvim.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/nvim";
      aerospace.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/aerospace";
      ohmyposh.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/ohmyposh";
      sketchybar.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/sketchybar";
      ghostty.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/ghostty";
    };
  };

  imports = [
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
  ];
}
