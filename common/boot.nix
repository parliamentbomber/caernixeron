{
  config,
  pkgs,
  ...
}: {
  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
    initrd = {
      verbose = false;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "quiet" "udev.log_level=0" ];
    supportedFilesystems = ["ntfs"];
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
      };
    };
  };
}
