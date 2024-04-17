# desktop specific nixos options
{config, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];
  powerManagement = {
    cpuFreqGovernor = "performance";
  };

  # networking, firewall, and hostname
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        7000
        7001
        7100
      ];
      allowedUDPPorts = [
        6000
        6001
        7011
      ];
    };
    enableIPv6 = false;
  };
  # swap
  monitors = [
    {
      name = "DP-3";
      primary = true;
      width = 2560;
      height = 1440;
      x = 0;
      y = 0;
      workspace = "1";
      enabled = true;
    }
    {
      name = "DP-2";
      width = 1920;
      height = 1080;
      x = 2560;
      y = 0;
      workspace = "2";
      enabled = true;
    }
  ];
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  # env variables
  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.11";
}
