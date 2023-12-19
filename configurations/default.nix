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