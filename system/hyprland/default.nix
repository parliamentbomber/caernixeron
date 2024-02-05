{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./systemd.nix
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
