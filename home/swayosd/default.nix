{
  config,
  inputs,
  ...
}: {
  services.swayosd = {
    enable = true;
    maxVolume = 120;
  };
}
