{
  config,
  pkgs,
  inputs,
  ...
}: {
  sound = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.pulseaudio.enable = false;
}
