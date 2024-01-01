{
  config,
  pkgs,
  ...
}: {
  sound = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.pulseaudio.enable = false;
}
