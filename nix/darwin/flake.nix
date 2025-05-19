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
      #url = "git+https://github.com/zhaofengli/nix-homebrew?ref=refs/pull/71/merge";
      #url = "git+https://github.com/zhaofengli/nix-homebrew?rev=04b0536479d2d2e8d71dc8c8ee97c2b61f0c9987";
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
    nix-homebrew,
    ...
  }: let
    configuration = {pkgs, ...}: {
      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config = {
          allowUnfree = true;
        };
        # overlays = [
        #   (final: prev: {
        #     lla = final.rustPlatform.buildRustPackage {
        #       pname = "lla";
        #       version = "0.2.9";
        #       src = final.fetchFromGitHub {
        #         owner = "triyanox";
        #         repo = "lla";
        #         rev = "main";
        #         sha256 = "sha256-C2wbMOYiowx21YDDVEQgilH9rODUlPdHbdVVKFv63fI=";
        #       };
        #       cargoHash = "sha256-sjJUG32jchAG/q4y649PyTJ2kqjT+0COSvO2QM6GnV0=";
        #     };
        #
        #      pnpm = prev.pnpm.overrideAttrs (oldAttrs: rec {
        #        version = "9.12.3";
        #        src = prev.fetchurl {
        #          url = "https://registry.npmjs.org/pnpm/-/pnpm-${version}.tgz";
        #          sha256 = "sha256-JCNXcsxKyCpiYnzUf4NMcmZ6LOh3mahG7E6OVV4tS4s=";
        #        };
        #      });
        #   })
        # ];
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
        nodePackages.eas-cli
        python3
        uv
        #docker
        #colima
      ];

      homebrew = {
        enable = true;
        taps = [
          "azure/functions"
        ];
        brews = [
          "azure-functions-core-tools@4"
          #"ghostscript"
          "imagemagick"
        ];
        casks = [
          "ghostty"
          "firefox"
          "1password"
          "docker"
          "1password-cli"
          "arc"
          "discord"
          "expo-orbit"
          "google-chrome"
          "linear-linear"
          "microsoft-auto-update"
          "microsoft-teams"
          "notion"
          "keymapp"
          "sf-symbols"
          "slack"
          "spotify"
          "raycast"
          "zed"
          "yaak"
          "zen-browser"
          "orbstack"
          "chatgpt"
        ];
        onActivation = {
          cleanup = "zap";
          autoUpdate = true;
          upgrade = true;
        };
      };

      users.users.ahirdman.home = "/Users/ahirdman";
      security.pam.services.sudo_local.touchIdAuth = true;
      home-manager.backupFileExtension = "backup";

      nix = {
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
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "ahirdman";
            autoMigrate = true;
          };
        }
      ];
    };

    darwinPackages = self.darwinConfigurations."work".pkgs;
  };
}
