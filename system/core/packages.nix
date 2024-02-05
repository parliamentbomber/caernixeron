{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
    playerctl
    polkit
    polkit_gnome
    xdg-user-dirs
    gruvbox-dark-gtk
    tealdeer
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    webcord-vencord
    google-chrome
    wget
    gnome.gnome-calendar
    microsoft-edge-dev
    bat
    vscode
    ffmpeg
    mpv
    spotify
    imv
    obs-studio
    blender
    uxplay
    rpiplay
    pavucontrol
    gnome.nautilus
    htop
  ];
  programs = {
    wireshark.enable = true;
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
