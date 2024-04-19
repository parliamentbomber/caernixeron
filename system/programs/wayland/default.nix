{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./swaylock.nix
    ./clight.nix
    ./hyprland
  ];
}
