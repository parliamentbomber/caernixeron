{pkgs, ...}: {
  imports = [
    ./syncthing.nix
    ./cli
    ./firefox.nix
    ./discord.nix
  ];
  home.packages = with pkgs; [
    overskride
    mission-center
  ];
}
