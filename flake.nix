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
      url = "github:the-argus/spicetify-nix";
    };
    anyrun-nixos-options = {
      url = "github:n3oney/anyrun-nixos-options";
    };
    shadower = {
      url = "github:n3oney/shadower";
      inputs.nixpkgs.follows = "nixpkgs";
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
          ./modules/core
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.nixer = import ./home;
          }
          inputs.hyprland.nixosModules.default
          {
            programs.hyprland.enable = true;
            programs.hyprland.xwayland.enable = true;
          }
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
      "minmus" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
          inputs.hyprland.nixosModules.default
          {
            programs.hyprland.enable = true;
            programs.hyprland.xwayland.enable = true;
          }
          ./configurations/minmus
          ./modules/core
        ];
      };
    };
  };
}
