{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ckan
  ];
  programs.steam.enable = true;
}
