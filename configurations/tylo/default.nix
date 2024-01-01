# laptop specific nixos options
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./networking.nix
    ../../system/server
    ../../system/core/i18n.nix
    ../../system/core/ssh.nix
    ../../system/core/security.nix
    ../../system/core/users.nix
    ../../system/core/nix.nix

  ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDyrPc3YaX6LSdWIpJblw7EaQ75EoWK66+lhkir+Qo2pLwyq4ye68lTl8VQkebo/2Oy0zIib15vMVvZ7XR1qjsD2ljf13A6/cFje+ZBrzc644yb6vP4b9EaXzFjSKX1Ewq4dPqwDaWAu7zEE5bqFlZpjqwYh0CqwupUfyh/gLnU/5zp7lf6245nac/aiQJb/KXq0gZjvx+H4SFob7nLI8Cwn3355weNcmvnxn7kMTh5sgaMFDKGjlsTguWNHgmEA+ehhMmFhOpXcuCfwuRBEVanWHVJGTV8Js/YKSlCZ+m481Bpeyugha3awGUp6QkNe+12QAONgdyMkBpRnOKXe8UxEtt4EBVe6BbAAK5SCIj/8FUDJd/eCWr+bz2jhTJuxEM02uwakH/y6DLmp9j+1ZiJdvmmVtTn9Wsm8a/l13ZdvmpVw7SDlpBC2Hm2GgICIMC51r+5tgLvCEhYT3bymbK35uAwQWCGKKKZABHPQrk0o//BqaWFNWK5o6Y/MBfCd8E= root@localhost'' ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJPV7j8FCSRAOzQrw21bzTMwcHsgjTFQC2CC/+wt2TWy 109875196+caernarferon@users.noreply.github.com'' ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICsvapy5mlMgjdq0b6+MP65TQzoZdhF8687Qcmwe6NLA nixer@nixerpc'' ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICEvnXyYl6HjmhQ1e5nSrp+JELO4xWTo8oVZYssZ3cW4 nixer@nixerpc'' ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBsHKuFonCQ3vic2A9MuFG48bgXBaLv/BcIpBB5QHi+ 109875196+caernarferon@users.noreply.github.com''];
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 12 * 2048;
    }
  ];
  programs.zsh.enable = true;
  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.11";
}
