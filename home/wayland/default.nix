{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
  with inputs.hyprcontrib.packages.${pkgs.system};
  with inputs.hyprpicker.packages.${pkgs.system};
  with inputs.shadower.packages.${pkgs.system}; [
    inputs.watershot.packages.${pkgs.system}.default
    inputs.skibidivim.packages.${pkgs.system}.default
    shadower
    hyprpicker
    libnotify
    kooha
    dunst
    wl-clipboard
    wl-clip-persist
    socat
    jq
    brightnessctl
    gnome3.gnome-control-center
    gnome3.gnome-settings-daemon
    wlogout
    swww
    grim
    slurp
    networkmanagerapplet
  ];
  imports = [
    ./wlsunset
    ./wlogout
    ./swayosd
    ./cliphist
    ./swayidle
    ./alacritty
    ./swaylock.nix
    ./hyprlock.nix
    ./ricetools.nix
    ./hyprland
  ];
}
