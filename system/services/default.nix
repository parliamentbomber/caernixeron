{pkgs, ...}: {
  services = {
    dbus.implementation = "broker";

    # profile-sync-daemon
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
  };
  imports = [
    ./location.nix
    ./power.nix
    ./guhnome.nix
    ./audio.nix
  ];
}
