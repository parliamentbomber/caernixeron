{
  config,
  inputs,
  ...
}: {
  services.cliphist = {
    enable = true;
    systemdTarget = "graphical-session.target";
  };
}
