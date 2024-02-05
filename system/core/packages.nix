{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    playerctl
    polkit_gnome
    xdg-user-dirs
    google-chrome
    wget
    gnome.gnome-calendar
    microsoft-edge-dev
    bat
    vscode
    spotify
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
        pinentryFlavor = "gnome3";
      };
    };
  };
}
