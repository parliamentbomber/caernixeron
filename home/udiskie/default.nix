{
  config,
  inputs,
  ...
}: {
  services.udiskie = {
    automount = true;
    tray = "never";
  };
}
