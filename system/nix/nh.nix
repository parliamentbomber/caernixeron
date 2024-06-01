{ inputs, pkgs, ... }: {
  # nh default flake
  environment.variables.FLAKE = "/home/nixer/caernixeron";
  programs.nh = {
    package = inputs.nh.packages.${pkgs.system}.default;
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
