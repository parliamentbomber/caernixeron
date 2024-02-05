{ inputs
, pkgs
, ...
}: {
  imports = [
    ./swaylock.nix
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
}
