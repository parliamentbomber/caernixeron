{ lib, ... }: {
  # balls
  imports = [
    ./avahi.nix
  ]; #

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.powersave = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    # DNS resolver
  };

  # Don't wait for network startup
}
# borrowed from fufexan

