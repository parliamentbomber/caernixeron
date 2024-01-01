{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.nh.packages.${pkgs.system}.default
    inputs.lanzaboote.packages.${pkgs.system}.lzbt
    inputs.lanzaboote.packages.${pkgs.system}.stub
  ];
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel"];
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
