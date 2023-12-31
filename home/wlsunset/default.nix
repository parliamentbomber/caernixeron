{
  config,
  inputs,
  ...
}: {
  services = {
    wlsunset = {
      enable = true;
      latitude = "52.0";
      longitude = "21.0";
      temperature = {
        day = 6200;
        night = 3750;
      };
      systemdTarget = "hyprland-session.target";
    };
  };
}
