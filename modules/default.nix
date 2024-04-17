{
  flake.nixosModules = {
    monitors = import ./home-manager;
  };
}
