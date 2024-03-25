{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = with pkgs; [
      obsidian
      "electron-25.9.0"
      "electron-24.8.6"
    ];
  };
  nixpkgs.overlays = [
    (final: prev: {
      obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
    })
  ];
  environment.systemPackages = with pkgs; [
    obsidian-wayland
    google-chrome
    wget
    gnome.gnome-calendar
    imv
    gnome.nautilus
    htop
  ];
  programs = {
    nix-ld.enable = true;
    zsh = {
      enable = true;
    };
    seahorse = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableExtraSocket = true;
      };
    };
  };
}
