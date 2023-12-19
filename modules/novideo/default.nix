{
  config,
  lib,
  nixpkgs,
  pkgs,
  ...
}: {
  imports = [
    ./nvidia.nix
  ];
}
