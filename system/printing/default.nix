{ config
, inputs
, pkgs
, ...
}: {
  services.printing = {
    enable = true;
    logLevel = "debug";
    drivers = [
      pkgs.cups-kyodialog
    ];
  };
}
