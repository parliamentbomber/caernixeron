{
  config,
  pkgs,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel"];
    kernelParams = ["nvidia_drm.modeset=1"];
    supportedFilesystems = ["ntfs"];
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
