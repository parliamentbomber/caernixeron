# desktop specific nixos options
{...}: {
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
