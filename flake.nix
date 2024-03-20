{
  description = "caernixeron";
  outputs = {
    self,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs self;} ({withSystem, ...}: {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        ./precommit.nix
        ./pkgs
        {
          config._module.args._inputs = inputs // {inherit (inputs) self;};
        }

        inputs.flake-parts.flakeModules.easyOverlay
        inputs.pre-commit-hooks.flakeModule
        inputs.treefmt-nix.flakeModule
      ];

      perSystem = {
        inputs,
        config,
        pkgs,
        ...
      }: {
        # provide the formatter for nix fmt
        formatter = pkgs.alejandra;

        pre-commit = {
          settings.excludes = ["flake.lock"];

          settings.hooks = {
            alejandra.enable = true;
            prettier.enable = true;
          };
        };
        # configure treefmt
        treefmt = {
          projectRootFile = "flake.nix";

          programs = {
            alejandra.enable = true;
            black.enable = true;
            deadnix.enable = false;
            shellcheck.enable = true;
            shfmt = {
              enable = true;
              indent_size = 4;
            };
          };
        };
      };

      flake = {
        nixosConfigurations = import ./configurations inputs;
      };
    });

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable"; # bleeding edge all the way gang
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waybar = {
      url = "github:alexays/waybar";
    };
    matugen = {
      url = "github:iniox/matugen";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
    };
    hyprcontrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    watershot = {
      url = "github:kirottu/watershot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eww-tray = {
      url = "github:ralismark/eww/tray-3";
    };
    prismlauncher = {
      url = "github:prismlauncher/prismlauncher";
    };
    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };
    anyrun-nixos-options = {
      url = "github:n3oney/anyrun-nixos-options";
    };
    shadower = {
      url = "github:n3oney/shadower";
    };
    nh = {
      url = "github:viperml/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
    };
    xdg-desktop-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    skibidivim = {
      url = "github:caernarferon/skibidivim";
    };
  };
}
