{
  description = "caernixeron";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable"; # bleeding edge all the way gang
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    hyprcontrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/";
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
      url = "github:exellentcoin26/spicetify-nix";
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      # Run the following command in the flake's directory to
      # deploy this configuration on any NixOS system:
      #   sudo nixos-rebuild switch --flake .#nixos-test
      "eeloo" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./configurations/eeloo
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.nixer = import ./home;
          }
          inputs.hyprland.nixosModules.default
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
      "minmus" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configurations/minmus
          ./system/core
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.nixer = import ./home;
          }
          inputs.hyprland.nixosModules.default
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
      "tylo" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configurations/tylo
        ];
      };
    };
  };
}
