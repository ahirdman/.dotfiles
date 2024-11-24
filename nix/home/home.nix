{config, ...}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  programs.home-manager.enable = true;

  home.username = "ahirdman";
  home.homeDirectory = "/Users/ahirdman";
  home.stateVersion = "24.05";

  xdg = {
    enable = true;
    configFile = {
      nvim.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/nvim";
      aeorpsace.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/aerospace";
      ohmyposh.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/ohmyposh";
      sketchybar.source = mkOutOfStoreSymlink "/Users/ahirdman/.dotfiles/.config/sketchybar";
    };
  };

  home.file = {
    ".actrc".text = ''
      -P ubuntu-latest=catthehacker/ubuntu:act-latest
      -P ubuntu-22.04=catthehacker/ubuntu:act-22.04
      -P ubuntu-20.04=catthehacker/ubuntu:act-20.04
      -P ubuntu-18.04=catthehacker/ubuntu:act-18.04

      --container-architecture linux/amd64
    '';
  };

  imports = [
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
  ];
}
