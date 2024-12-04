{
  description = "No1 Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    darwin,
    home-manager,
    ...
  }: let
    configuration = {pkgs, ...}: {
      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config = {
          allowUnfree = true;
        };
        overlays = [
          (final: prev: {
            lla = final.rustPlatform.buildRustPackage {
              pname = "lla";
              version = "0.2.9";
              src = final.fetchFromGitHub {
                owner = "triyanox";
                repo = "lla";
                rev = "main";
                sha256 = "sha256-C2wbMOYiowx21YDDVEQgilH9rODUlPdHbdVVKFv63fI=";
              };
              cargoHash = "sha256-sjJUG32jchAG/q4y649PyTJ2kqjT+0COSvO2QM6GnV0=";
            };

            pnpm = prev.pnpm.overrideAttrs (oldAttrs: rec {
              version = "9.12.3";
              src = prev.fetchurl {
                url = "https://registry.npmjs.org/pnpm/-/pnpm-${version}.tgz";
                sha256 = "sha256-JCNXcsxKyCpiYnzUf4NMcmZ6LOh3mahG7E6OVV4tS4s=";
              };
            });
          })
        ];
      };

      environment.systemPackages = with pkgs; [
        neovim
        tmux
        gum
        oh-my-posh
        eza
        fzf
        alacritty
        gh
        ngrok
        zoxide
        alejandra
        nixd
        bat
        pnpm
        nodejs
        ripgrep
        bun
        chafa
        aerospace
        sketchybar
        hub
        cargo
        lla
        ollama
        azure-cli
        bicep
        dotnet-sdk_8
      ];

      homebrew = {
        enable = true;
        # enableRosetta = true;
        # user = "ahirdman";
        # autoMigrate = true;
        taps = [
          "azure/azd"
        ];
        brews = [
          "azd"
        ];
        casks = [
          "firefox"
          "1password"
          "1password-cli"
          "arc"
          "discord"
          "docker"
          "expo-orbit"
          "font-hack-nerd-font"
          "google-chrome"
          "linear-linear"
          "microsoft-teams"
          "notion"
          "keymapp"
          "postman"
          "sf-symbols"
          "slack"
          "spotify"
          "raycast"
        ];
        onActivation.cleanup = "zap";
        # onActivation.autoUpdate = true;
        # onActivation.upgrade = true;
      };

      users.users.ahirdman.home = "/Users/ahirdman";
      security.pam.enableSudoTouchIdAuth = true;
      home-manager.backupFileExtension = "backup";

      services = {
        nix-daemon.enable = true;
      };

      nix = {
        configureBuildUsers = true;
        useDaemon = true;
        settings.experimental-features = "nix-command flakes";
        nixPath = ["nixpkgs=${inputs.nixpkgs}"];
        package = pkgs.nix;
      };

      system = {
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = 5;

        defaults = {
          dock = {
            autohide = true;
            show-recents = false;
            orientation = "bottom";
          };
          NSGlobalDomain = {
            AppleInterfaceStyle = "Dark";
            AppleInterfaceStyleSwitchesAutomatically = true;
            _HIHideMenuBar = true;
          };
        };
      };
    };
  in {
    darwinConfigurations."work" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ahirdman = import ../home/home.nix;
          };
        }
      ];
    };

    darwinPackages = self.darwinConfigurations."work".pkgs;
  };
}
