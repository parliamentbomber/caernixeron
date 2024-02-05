# desktop specific nixos options
{ config
, options
, pkgs
, ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../system/novideo
    ../../system/gaming
    ../../system/wayland
    ../../system/gamedev
    ../../system/audio
    ../../system/hyprland
    ../../system/services
  ];
  powerManagement = {
    cpuFreqGovernor = "performance";
  };

  # networking, firewall, and hostname
  networking = {
    hostName = "eeloo";
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
