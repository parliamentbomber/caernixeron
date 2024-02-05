# laptop specific nixos options
{ config
, pkgs
, ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../system/wayland
    ../../system/hyprland
    ../../system/audio
    ../../system/gamedev
  ];

  # networking, firewall, and hostname
  networking = {
    hostName = "minmus";
    networkmanager.enable = true;
    firewall = {
      allowPing = false;
      enable = true;
    };
    enableIPv6 = false;
  };

  # env variables
  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };

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
