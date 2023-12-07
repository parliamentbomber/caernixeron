{
  config,
  inputs,
  pkgs,
  anyrun,
  watershot,
  eww-tray,
  prismlauncher,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Hyprland Requirements
    swayosd
    scrcpy
    grim
    gvfs
    kitty
    libnotify
    kooha
    playerctl
    polkit
    polkit_gnome
    slurp
    swaylock-effects
    swww
    udiskie
    udisks
    wireplumber
    wlogout
    wlsunset
    wl-clipboard
    xdg-user-dirs
    dunst
    element-desktop-wayland
    gruvbox-dark-gtk
    jq
    socat
    gnome3.gnome-control-center
    gnome3.gnome-settings-daemon
    cliphist
    swappy
    swayidle
    tealdeer
    brightnessctl
    pfetch
    neofetch
    # Internet
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    firefox
    google-chrome
    thunderbird
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
    
    # audio 
    pavucontrol
    # Customization
    # Misc
    git
    gnome.nautilus
    htop
    keepassxc
    killall
    networkmanagerapplet
    piper
    virt-manager
    anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
    watershot.packages.${pkgs.system}.default
    eww-tray.packages.${pkgs.system}.eww-wayland
    prismlauncher.packages.${pkgs.system}.default
    cups-filters

    # School 


    # Programming
    (python3.withPackages (ps: with ps; [
      pandas 
      matplotlib 
      requests
      rich
      nextcord
      gst-python
      python-dotenv]))
      nodejs
    newt
    ripgrep
    docker-client
    cargo
    gcc
    docui
    qemu
    gopls
    pyright
    nodejs
    clang
  ];
  programs = {
    steam = {
      enable = true;
    };
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
        enableSSHSupport = true;
        enableExtraSocket = true;
        pinentryFlavor = "gnome3";
      };
    };
    kdeconnect = {
      enable = true;
    };
  };
}
