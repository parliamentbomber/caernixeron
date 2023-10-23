# laptop specific nixos options
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # networking, firewall, and hostname
  networking = {
    hostName = "nixerlaptop";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
    };
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
  system.stateVersion = "23.05";
}
