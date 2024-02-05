{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel"];
    supportedFilesystems = ["ntfs"];
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
    inputs.lanzaboote.packages.${pkgs.system}.lzbt
    inputs.lanzaboote.packages.${pkgs.system}.stub
  ];
}
