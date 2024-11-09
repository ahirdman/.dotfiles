{
  description = "Raw Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    configuration = { pkgs, ... }: {

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages =
        [ 
            pkgs.neovim
            pkgs.tmux
            pkgs.gum
            pkgs.oh-my-posh
            pkgs.eza
            pkgs.fzf
            pkgs.direnv
            pkgs.wezterm
            pkgs.alacritty
            pkgs.skhd
            pkgs.yabai
            pkgs.zsh-syntax-highlighting
            pkgs.zsh-autosuggestions
            pkgs.gh
            pkgs.ngrok
        ];

      homebrew = {
          enable = true;
          # enableRosetta = true;
          ## User owning the Homebrew prefix
          # user = "ahirdman";
          # autoMigrate = true;
          casks = [ 
            "firefox"
            "1password"
            "1password-cli"
            "android-studio"
            "arc"
            "discord"
            "docker"
            "dotnet"
            "expo-orbit"
            "firefox"
            "google-chrome"
            "httpie"
            "keymapp"
            "linear-linear"
            "microsoft-auto-update"
            "microsoft-teams"
            "notion"
            "postman"
            "raycast"
            "sf-symbols"
            "slack"
            "spotify"
            "zed"
          ];
          onActivation.cleanup = "zap";
          # onActivation.autoUpdate = true;
          # onActivation.upgrade = true;
        };

      users.users.ahirdman.home = "/Users/ahirdman";

      security.pam.enableSudoTouchIdAuth = true;

      home-manager.backupFileExtension = "backup";

      nix.configureBuildUsers = true;
      nix.useDaemon = true;
      nix.settings.experimental-features = "nix-command flakes";

      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
    };
  in
  {
    darwinConfigurations."work" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
          configuration
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ahirdman = import ./home.nix;
          }
      ];
    };

    darwinPackages = self.darwinConfigurations."work".pkgs;
  };
}
