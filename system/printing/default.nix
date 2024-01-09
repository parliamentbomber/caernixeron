{
  config,
  inputs,
  pkgs,
  ...
}: {
  printing = {
    enable = true;
    logLevel = "debug";
    drivers = [
      pkgs.cups-kyodialog
    ];
  };
}
