{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Hyprland Requirements
    virt-manager
    qemu
    playerctl
    polkit
    polkit_gnome
    xdg-user-dirs
    gruvbox-dark-gtk
    tealdeer
    neofetch
    # Internet
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    webcord-vencord
    google-chrome
    wget
    gnome.gnome-calendar
    microsoft-edge-dev

    # Text Editors
    neovim
    bat
    vscode

    # Entertainment
    ffmpeg
    mpv
    spotify
    imv

    # Creative
    obs-studio
    blender
    steam-run

    #fonts
    monaspace

    # audio
    pavucontrol
    # Customization
    # Misc
    git
    gnome.nautilus
    htop
    networkmanagerapplet
    inputs.nh.packages.${pkgs.system}.default
    inputs.lanzaboote.packages.${pkgs.system}.lzbt
    inputs.lanzaboote.packages.${pkgs.system}.stub
    cups-filters

    # School

    # Programming
    (python3.withPackages (ps:
      with ps; [
        pandas
        matplotlib
        requests
        rich
        nextcord
        gst-python
        python-dotenv
      ]))
    nodejs
    newt
    ripgrep
    docker-client
    cargo
    gcc
    gopls
    pyright
    nodejs
    clang
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
    kdeconnect = {
      enable = lib.mkDefault true;
    };
  };
}
