# laptop specific nixos options
{ ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  # networking, firewall, and hostname
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  networking = {
    networkmanager.enable = true;
    firewall = {
      allowPing = false;
      allowedTCPPorts = [ 57621 ];
      enable = true;
    };
    enableIPv6 = false;
  };

  # env variables
  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };
  hardware.bluetooth.enable = true;
  monitors = [{
    primary = true;
    name = "eDP-1";
    width = 1920;
    height = 1080;
    x = 0;
    workspace = "1";
    enabled = false;
  }];

  # swap
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 12 * 2048;
    }
  ];
  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.11";
}
