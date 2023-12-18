{
  config,
  pkgs,
  ...
}: {
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    tailscale.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    greetd = {
      enable = true;
      restart = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd dbus-run-session Hyprland'";
        };
      };      
    };
    gnome.gnome-keyring.enable = true;
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        pkgs.cups-kyodialog
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    logind = {
      extraConfig = "HandlePowerKey=ignore\n HandlePowerKeyLongPress=ignore";
    };
  };
  hardware.bluetooth.enable = true;
}
