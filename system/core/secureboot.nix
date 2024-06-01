{ pkgs
, config
, inputs
, lib
, ...
}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];
  boot = {
    kernelPackages = pkgs.pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "nvidia-drm.fbdev=1" ];
    supportedFilesystems = [ "ntfs" ];
    loader = {
      timeout = 15;
      systemd-boot = {
        enable = lib.mkForce false;
        consoleMode = "auto";
      };
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
  environment.systemPackages = [
    inputs.nh.packages.${pkgs.system}.default
  ];
}
