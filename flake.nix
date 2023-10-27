{
  description = "caernixeron";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
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
      inputs.nixpkgs.follows = "nixpkgs";
    
    };
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    eww-tray,
    anyrun,
    home-manager,
    watershot,
    ...
  } @ inputs: {
    nixosConfigurations = {
      # Run the following command in the flake's directory to
      # deploy this configuration on any NixOS system:
      #   sudo nixos-rebuild switch --flake .#nixos-test
      "nixerpc" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./configurations/desktop.nix
          ./common
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixer = import ./home/home.nix;
          }
          hyprland.nixosModules.default
          {
            programs.hyprland.enable = true;
            programs.hyprland.enableNvidiaPatches = true;
            programs.hyprland.xwayland.enable = true;
          }
        ];
      };
      "nixerlaptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./configurations/laptop.nix
          ./common
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixer = import ./home/home.nix;
          }
          hyprland.nixosModules.default
          {
            programs.hyprland.enable = true;
            programs.hyprland.enableNvidiaPatches = false;
            programs.hyprland.xwayland.enable = true;
          }
        ];
      };
    };
  };
}
