# laptop specific nixos options
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  system.stateVersion = "23.11";
}
