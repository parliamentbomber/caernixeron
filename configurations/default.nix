{
  nixpkgs,
  self,
  ...
}: let
  inherit (self) inputs;
  shared = [core agenix];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
    users.sioodmy = ../home;
  };
in {
  # all my hosts are named after saturn moons btw

  # desktop
    eeloo = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        ./eeloo
        bootloader
        nvidia
        wayland
        hmModule
        {inherit home-manager;}
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };

  # thinkpad
    minmus = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        ./minmus
        bootloader
        wayland
        hmModule
        {inherit home-manager;}
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };
}