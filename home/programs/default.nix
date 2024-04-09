{pkgs, ...}: {
  imports = [
    ./syncthing.nix
    ./cli
  ];
  home.packages = with pkgs; [
    overskride
    mission-center
  ];
}
