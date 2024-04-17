{ nixpkgs
, self
, ...
}:
let
  inherit (self) inputs;
  core = ../system/core;
  secureboot = ../system/core/secureboot.nix;
  grub = ../system/core/grub.nix;
  tailscale = ../home/programs/tailscale.nix;
  gamedev = ../system/gamedev;
  nvidia = ../system/novideo;
  gaming = ../system/gaming;
  printing = ../system/printing;
  server = ../system/server;
  hardware = ../system/hardware;
  wayland = ../system/wayland;
  homeManager = inputs.home-manager.nixosModules.home-manager;

  shared = [ core hardware ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
  };
in
{
  eeloo = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        { networking.hostName = "eeloo"; }
        ./eeloo
        nvidia
        secureboot
        wayland
        homeManager
        gaming
        tailscale
        gamedev
        ../system/services
        { inherit home-manager; }
      ]
      ++ shared;
    specialArgs = { inherit inputs; };
  };

  minmus = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        { networking.hostName = "minmus"; }
        ./minmus
        ../system/services
        wayland
        homeManager
        gamedev
        tailscale
        grub

        { inherit home-manager; }
      ]
      ++ shared;
    specialArgs = { inherit inputs; };
  };
}
