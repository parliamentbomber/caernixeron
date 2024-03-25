{pkgs, ...}: {
  services = {
    devmon.enable = true;
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    gvfs.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    gnome.gnome-keyring.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
        domain = true;
      };
    };
    logind = {
      extraConfig = "HandlePowerKey=ignore\n HandlePowerKeyLongPress=ignore";
    };
  };
  hardware.bluetooth = {
    enable = true;
  };
}
