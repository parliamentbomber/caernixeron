{ lib, ... }: {
  # balls
  imports = [
    ./avahi.nix
  ]; #

  networking.networkmanager = {
    enable = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    # DNS resolver
    resolved.enable = true;
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
# borrowed from fufexan

