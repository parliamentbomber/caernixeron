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
  wayland = ../system/wayland;
  homeManager = inputs.home-manager.nixosModules.home-manager;

  shared = [ core ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
    users.nixer = {
      imports = [ ../home ];
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
        { inherit home-manager; }
      ]
      ++ shared;
    specialArgs = { inherit inputs; };
  };

  # thinkpad
  minmus = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        { networking.hostName = "minmus"; }
        ./minmus
        wayland
        homeManager
        tailscale
        printing
        grub
        gaming
        gamedev
        { inherit home-manager; }
      ]
      ++ shared;
    specialArgs = { inherit inputs; };
  };
}
