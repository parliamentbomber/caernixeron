{
  config,
  inputs,
  ...
}: {
  services = {
    wlsunset = {
      enable = true;
      latitude = "51";
      longitude = "114";
      temperature = {
        day = 6200;
        night = 3750;
      };
    };
  };
}
