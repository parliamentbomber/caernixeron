{inputs, ...}: {
  imports = [
    inputs.nh.nixosModules.default
  ];

  # nh default flake
  environment.variables.FLAKE = "/home/nixer/caernixeron";
  nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
